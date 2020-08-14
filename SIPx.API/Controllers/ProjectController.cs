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
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectProvider _projectProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProjectController(IMasterListProvider masterListProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProjectProvider ProjectProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
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
                return Ok(await _projectProvider.ProjectLanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _projectProvider.ProjectLanguageUpdateGet(CurrentUser.Id, Id));
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
                return Ok(await _projectProvider.ProjectIndexGet(CurrentUser.Id));
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
                return Ok(await _projectProvider.ProjectUpdateGet(CurrentUser.Id, Id));
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
                var ProjectTypes = await _projectProvider.ProjectTypeList(CurrentUser.Id);
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
                var CheckString = await _projectProvider.ProjectCreatePostCheck(Project);
                if (CheckString.Length == 0)
                {
                    _projectProvider.ProjectCreatePost(Project);
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

    }
}