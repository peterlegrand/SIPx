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
    public class ProjectTypeController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProjectTypeProvider _projectTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectProvider _ProjectProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProjectTypeController(ICheckProvider checkProvider, IMasterListProvider masterListProvider, IProjectTypeProvider projectTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProjectProvider ProjectProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _projectTypeProvider = projectTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _ProjectProvider = ProjectProvider;
            _userManager = userManager;
        }
        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> GetProjectTypeLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _ProjectProvider.LanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> GetProjectTypeLanguage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _ProjectProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Index")]
        public async Task<IActionResult> GetProjectTypes()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _ProjectProvider.IndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetProjectType(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var x = await _projectTypeProvider.UpdateGet(CurrentUser.Id, Id);
                var icons = await _masterListProvider.IconList(CurrentUser.Id);
               // x.Icons = icons;

                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ProjectTypeCreateGet = new ProjectTypeCreateGet();
                var icons = await _masterListProvider.IconList(CurrentUser.Id);
                ProjectTypeCreateGet.Icons = icons;

                //var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                //ProjectTypeCreateGet.LanguageId = UserLanguage.LanguageId;
                //ProjectTypeCreateGet.LanguageName = UserLanguage.Name;
                return Ok(ProjectTypeCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(ProjectTypeCreateGet ProjectType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProjectType.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _projectTypeProvider.ProjectTypeCreatePostCheck(ProjectType);
                //if (CheckString.Length == 0)
                //{
                    _projectTypeProvider.CreatePost(ProjectType);
                    return Ok(ProjectType);
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
                if (await _checkProvider.CheckIfRecordExists("ProjectTypes", "ProjectTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _projectTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProjectTypeDeleteGet ProjectType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ProjectType.CreatorId = CurrentUser.Id;
                //var CheckString = await _ProjectTypeProvider.DeletePostCheck(ProjectType);
                //if (CheckString.Length == 0)
                //{
                _projectTypeProvider.DeletePost(ProjectType.ProjectTypeId);
                return Ok(ProjectType);
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