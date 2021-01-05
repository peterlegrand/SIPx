using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class FrontProjectController : ControllerBase
    {
        private readonly IPersonProvider _personProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IProjectTypeProvider _projectTypeProvider;
        private readonly IFrontProjectProvider _frontProjectProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontProjectController(IPersonProvider personProvider
            , ISecurityLevelProvider securityLevelProvider
            , IProjectProvider projectProvider
            , IProjectTypeProvider projectTypeProvider
            , IFrontProjectProvider frontProjectProvider
            , IMasterProvider masterProvider
            , IMasterListProvider masterListProvider
            , ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , IClassificationProvider classificationProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _personProvider = personProvider;
            _securityLevelProvider = securityLevelProvider;
            _projectProvider = projectProvider;
            _projectTypeProvider = projectTypeProvider;
            _frontProjectProvider = frontProjectProvider;
            _masterProvider = masterProvider;
            _masterListProvider = masterListProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var project = new FrontProjectIndexGet();
                project =  await _frontProjectProvider.IndexGet(CurrentUser.Id, Id);
                var subproject = await _frontProjectProvider.IndexGetSubProject(CurrentUser.Id, Id);
                var Content = await _frontProjectProvider.IndexGetContent(CurrentUser.Id, Id);
                var Process = await _frontProjectProvider.IndexGetProcess(CurrentUser.Id, Id);
                var Member = await _frontProjectProvider.IndexGetMember(CurrentUser.Id, Id);
                project.SubProjects = subproject;
                project.Contents = Content;
                project.Processes= Process;
                project.Members = Member;
              //      var x= await _frontProjectProvider.IndexGetSubProjectTree(CurrentUser.Id, Id);
       //         project.SubProjectTree = JObject.Parse(x);

                return Ok(project);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("Classifications", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var Project = await _projectProvider.UpdateGet(CurrentUser.Id, Id);
//                var u = await _classificationProvider.CreateGetSequence(CurrentUser.Id);
                var Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
                var projectTypes = await _projectTypeProvider.List(CurrentUser.Id);
                var SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                Project.Statuses = Statuses;
                Project.ProjectTypes = projectTypes;

                Project.SecurityLevels = SecurityLevels;
                return Ok(Project);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }
        private async Task<ProjectUpdateGet> UpdateAddDropDownBoxes(ProjectUpdateGet Project, string UserId)
        {
            var Statuses = await _masterListProvider.StatusList(UserId);
            var ProjectTypes = await _projectTypeProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            var SecurityLevels = await _securityLevelProvider.List(UserId);
            Project.ProjectTypes = ProjectTypes;
            Project.Statuses = Statuses;
            Project.SecurityLevels = SecurityLevels;
            return Project;
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProjectUpdateGet Project)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _projectProvider.UpdatePostCheck(Project);
                if (ErrorMessages.Count > 0)
                {
                    Project = await UpdateAddDropDownBoxes(Project, CurrentUser.Id);
                }
                else
                {
                    _projectProvider.UpdatePost(Project);
                }
                ProjectUpdateGetWithErrorMessages ProjectWithErrorMessage = new ProjectUpdateGetWithErrorMessages { Project = Project, ErrorMessages = ErrorMessages };
                return Ok(ProjectWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProjectUpdateGetWithErrorMessages ProjectWithNoRights = new ProjectUpdateGetWithErrorMessages { Project = Project, ErrorMessages = ErrorMessages };
            return Ok(ProjectWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("Classifications", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationDeleteGet Classification)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Classification.UserId= CurrentUser.Id;
                //var CheckString = await _classificationProvider.DeletePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _classificationProvider.DeletePost(CurrentUser.Id,Classification.ClassificationId);
                return Ok(Classification);
                //}
                return BadRequest(new
                {
                    IsSuccess = false,
                    //Message = CheckString,
                });

            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("LanguageCreate")]
        public async Task<IActionResult> LanguageCreate(ObjectLanguageCreatePost Classification)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Classification.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var CheckString = await _masterProvider.PostObjectLanguageCheck("CLassification", Classification.LanguageId, Classification.ObjectId);
                if (CheckString)
                {
                    Classification.TableName = "Classification";
                    _masterProvider.PostObjectLanguage(Classification);
                    return Ok(Classification);
                }
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = CheckString,
                });

            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpGet("LanguageCreate/{Id:int}")]
        public async Task<IActionResult> LanguageCreate(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationCreateGet = new ObjectLanguageCreateGet();
                ClassificationCreateGet.ObjectId = Id;
                var LanguageList = await _classificationProvider.LangugageCreateGetLanguageList(CurrentUser.Id, Id);
                if (LanguageList.Count == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No active languages",
                    });
                }
                ClassificationCreateGet.Languages = LanguageList;
                return Ok(ClassificationCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> LanguageIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationLanguages", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.LanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> LanguageUpdate(int Id)
        {
            if (await _checkProvider.CheckIfRecordExists("ClassificationLanguages", "ClassificationLanguageID", Id) == 0)
            {
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = "No record with this ID",
                });
            }

            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  
            {
                return Ok(await _classificationProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProjectCreateGet = new ProjectCreateGet();
                var Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
                var ProjectTypes = await _projectTypeProvider.List(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                var SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                ProjectCreateGet.LanguageId = UserLanguage.LanguageId;
                ProjectCreateGet.LanguageName = UserLanguage.Name;
                ProjectCreateGet.ProjectTypes = ProjectTypes;
                ProjectCreateGet.Statuses = Statuses;
                ProjectCreateGet.SecurityLevels= SecurityLevels;
                if (Id == null)
                {
                    Id = 0;
                }
                ProjectCreateGet.ParentProjectId = Id;
                return Ok(ProjectCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProjectCreateGet Project)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Project.UserId= CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var CheckString = await _projectProvider.CreatePostCheck(Project);
                if (CheckString.Count == 0)
                {
                    _projectProvider.CreatePost(Project);
                    return Ok(Project);
                }
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = CheckString,

                    //PETER TODO Not sure if the issue is here. But need to check if all is filled in well and then give feedback to front mvc
                });
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProjectAdvancedSearch = new ProjectAdvancedSearchPost();
                ProjectAdvancedSearch.SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                ProjectAdvancedSearch.ParentProjects = await _projectProvider.List(CurrentUser.Id);
                ProjectAdvancedSearch.Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
                ProjectAdvancedSearch.ProjectTypes = await _projectTypeProvider.List(CurrentUser.Id);
                ProjectAdvancedSearch.Persons = await _personProvider.List();
//                ProjectAdvancedSearch = await _projectProvider.FrontProjectAdvancedSearchGet(CurrentUser.Id);
                return Ok(ProjectAdvancedSearch);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }
        [HttpPost("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch(ProjectAdvancedSearchPost AdvancedSearch)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            AdvancedSearch.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _ProjectProvider.CreatePostCheck(Project);
                //if (CheckString.Length == 0)
                //{

                if (AdvancedSearch.Contains == null)
                { AdvancedSearch.Contains = ""; }

                var Result = await _projectProvider.AdvancedSearch(AdvancedSearch);
                return Ok(Result);
                //}
                return BadRequest(new
                {
                    IsSuccess = false,
                    //Message = CheckString,
                });
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


    }
}