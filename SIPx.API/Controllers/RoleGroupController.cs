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
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IRoleGroupProvider _roleGroupProvider;
        private readonly UserManager<SipUser> _userManager;

        public RoleGroupController(ICheckProvider checkProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IRoleGroupProvider roleGroupProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
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
                return Ok(await _roleGroupProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _roleGroupProvider.LanguageUpdateGet(CurrentUser.Id, Id));
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
                return Ok(await _roleGroupProvider.IndexGet(CurrentUser.Id));
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
                return Ok(await _roleGroupProvider.UpdateGet(CurrentUser.Id, Id));
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
                var CheckString = await _roleGroupProvider.CreatePostCheck(RoleGroup);
                if (CheckString.Length == 0)
                {
                    _roleGroupProvider.CreatePost(RoleGroup);
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
        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                if (await _checkProvider.CheckIfRecordExists("RoleGroups", "RoleGroupID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _roleGroupProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(RoleGroupDeleteGet RoleGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                RoleGroup.CreatorId = CurrentUser.Id;
                //var CheckString = await _RoleGroupProvider.DeletePostCheck(RoleGroup);
                //if (CheckString.Length == 0)
                //{
                _roleGroupProvider.DeletePost(RoleGroup.RoleGroupId);
                return Ok(RoleGroup);
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