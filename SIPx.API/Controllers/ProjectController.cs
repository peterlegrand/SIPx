using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.Shared;
using SIPx.DataAccess;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class ProjectController : ControllerBase
    {
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IProjectTypeProvider _projectTypeProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectProvider _projectProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProjectController(ISecurityLevelProvider securityLevelProvider, ICheckProvider checkProvider, IProjectTypeProvider projectTypeProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProjectProvider ProjectProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _securityLevelProvider = securityLevelProvider;
            _checkProvider = checkProvider;
            _projectTypeProvider = projectTypeProvider;
            _masterListProvider = masterListProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _projectProvider = ProjectProvider;
            _userManager = userManager;
        }
        private async Task<ProjectCreateGet> CreateAddDropDownBoxes(ProjectCreateGet Project, string UserId, int? ParentId = null)
        {
            var Statuses = await _masterListProvider.StatusList(UserId);
            var ProjectTypes = await _projectTypeProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            var SecurityLevels = await _securityLevelProvider.List(UserId);
            Project.LanguageId = UserLanguage.LanguageId;
            Project.LanguageName = UserLanguage.Name;
            Project.ProjectTypes = ProjectTypes;
            Project.Statuses = Statuses;
            Project.ParentProjectId = ParentId;
            Project.SecurityLevels = SecurityLevels;
            return Project;
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

        [HttpGet("Create/{Id:int?}")]
        public async Task<IActionResult> Create(int? Id=null)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var Project = new ProjectCreateGet();
                Project = await CreateAddDropDownBoxes(Project, CurrentUser.Id, Id);
                return Ok(Project);
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
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _projectProvider.CreatePostCheck(Project);
                if (ErrorMessages.Count > 0)
                {
                    Project = await CreateAddDropDownBoxes(Project, CurrentUser.Id);
                }
                else
                {
                    _projectProvider.CreatePost(Project);
                }
                ProjectCreateGetWithErrorMessages ProjectWithErrorMessage = new ProjectCreateGetWithErrorMessages { Project = Project, ErrorMessages = ErrorMessages };
                return Ok(ProjectWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProjectCreateGetWithErrorMessages ProjectWithNoRights = new ProjectCreateGetWithErrorMessages { Project = Project, ErrorMessages = ErrorMessages };
            return Ok(ProjectWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _projectProvider.IndexGet(CurrentUser.Id));
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

                var Project = await _projectProvider.UpdateGet(CurrentUser.Id, Id);
                Project = await UpdateAddDropDownBoxes(Project, CurrentUser.Id);
                return Ok(Project);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
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
                if (await _checkProvider.CheckIfRecordExists("Projects", "ProjectID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _projectProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProjectDeleteGet Project)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Project.UserId= CurrentUser.Id;
                //var CheckString = await _ProjectProvider.DeletePostCheck(Project);
                //if (CheckString.Length == 0)
                //{
                _projectProvider.DeletePost(Project.ProjectId);
                return Ok(Project);
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

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> LanguageIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _projectProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _projectProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}