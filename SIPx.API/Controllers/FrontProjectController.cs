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
        private readonly IClassificationPageProvider _classificationPageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontProjectController(IPersonProvider personProvider, ISecurityLevelProvider securityLevelProvider, IProjectProvider projectProvider, IProjectTypeProvider projectTypeProvider, IFrontProjectProvider frontProjectProvider, IClassificationPageProvider classificationPageProvider, IMasterProvider masterProvider, IMasterListProvider masterListProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _personProvider = personProvider;
            _securityLevelProvider = securityLevelProvider;
            _projectProvider = projectProvider;
            _projectTypeProvider = projectTypeProvider;
            _frontProjectProvider = frontProjectProvider;
            _classificationPageProvider = classificationPageProvider;
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "188"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                if (await _checkProvider.CheckIfRecordExists("Classifications", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationProvider.UpdateGet(CurrentUser.Id, Id);
                var y = await _classificationPageProvider.List(CurrentUser.Id, Id);
                var u = await _classificationProvider.CreateGetSequence(CurrentUser.Id);
                var z = await _masterListProvider.StatusList(CurrentUser.Id);
                var icons = await _masterListProvider.IconList(CurrentUser.Id);
                x.Icons = icons;

                x.DropDownSequences = u;
                x.DefaultPages = y;
                x.Statuses = z;
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationUpdateGet Classification)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                Classification.CreatorId = CurrentUser.Id;
                //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                    _classificationProvider.UpdatePost(Classification);
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

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                Classification.CreatorId = CurrentUser.Id;
                //var CheckString = await _classificationProvider.DeletePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _classificationProvider.DeletePost(Classification.ClassificationId);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "193"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "193"))  
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ProjectCreateGet = new ProjectCreateGet();
                var Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
                var ProjectTypes = await _projectTypeProvider.List(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                ProjectCreateGet.LanguageId = UserLanguage.LanguageId;
                ProjectCreateGet.LanguageName = UserLanguage.Name;
                ProjectCreateGet.ProjectTypes = ProjectTypes;
                ProjectCreateGet.Statuses = Statuses;
                if(Id == null)
                {
                    Id = 0;
                }
                ProjectCreateGet.ProjectParentId = Id;
                return Ok(ProjectCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Post(ProjectCreatePost Project)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Project.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _projectProvider.CreatePostCheck(Project);
                if (CheckString.Length == 0)
                {
                    _projectProvider.CreatePost(Project);
                    return Ok(Project);
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
        [HttpGet("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
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