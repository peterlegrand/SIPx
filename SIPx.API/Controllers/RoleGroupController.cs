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
    public class RoleGroupController : ControllerBase
    {
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IRoleGroupProvider _roleGroupProvider;
        private readonly UserManager<SipUser> _userManager;

        public RoleGroupController(IMasterProvider masterProvider, IClaimCheck claimCheck, IRoleGroupProvider roleGroupProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _roleGroupProvider = roleGroupProvider;
            _userManager = userManager;
        }

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> GetRoleGroupLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _roleGroupProvider.RoleGroupLanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> GetRoleGroupLanguage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _roleGroupProvider.RoleGroupLanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Index")]
        public async Task<IActionResult> GetRoleGroups()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _roleGroupProvider.RoleGroupIndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetRoleGroup(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _roleGroupProvider.RoleGroupUpdateGet(CurrentUser.Id, Id));
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
                var RoleGroupCreateGet = new RoleGroupCreateGet();
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                RoleGroupCreateGet.LanguageId = UserLanguage.LanguageId;
                RoleGroupCreateGet.LanguageName = UserLanguage.Name;
                return Ok(RoleGroupCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(RoleGroupCreatePost RoleGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            RoleGroup.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _roleGroupProvider.RoleGroupCreatePostCheck(RoleGroup);
                if (CheckString.Length == 0)
                {
                    _roleGroupProvider.RoleGroupCreatePost(RoleGroup);
                    return Ok(RoleGroup);
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