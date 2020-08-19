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
        private readonly ICheckProvider _checkProvider;
        private readonly IProjectTypeProvider _projectTypeProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectProvider _projectProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProjectController(ICheckProvider checkProvider, IProjectTypeProvider projectTypeProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProjectProvider ProjectProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _projectTypeProvider = projectTypeProvider;
            _masterListProvider = masterListProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _projectProvider = ProjectProvider;
            _userManager = userManager;
        }

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> GetProjectLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
        public async Task<IActionResult> GetProjectLanguage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _projectProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Index")]
        public async Task<IActionResult> GetProjects()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
        public async Task<IActionResult> GetProject(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _projectProvider.UpdateGet(CurrentUser.Id, Id));
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
            Project.UserId = CurrentUser.Id;
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
        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                Project.CreatorId = CurrentUser.Id;
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

    }
}