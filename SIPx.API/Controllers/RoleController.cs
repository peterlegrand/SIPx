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
    public class RoleController : ControllerBase
    {
        private readonly IRoleGroupProvider _roleGroupProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IRoleProvider _roleProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;
        private readonly RoleManager<SipRole> _roleManager;

        public RoleController(IRoleGroupProvider roleGroupProvider, ICheckProvider checkProvider, IRoleProvider roleProvider, IClaimCheck claimCheck,  Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager, RoleManager<SipRole> roleManager)
        {
            _roleGroupProvider = roleGroupProvider;
            _checkProvider = checkProvider;
            _roleProvider = roleProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
            _roleManager = roleManager;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var RoleCreateGet = new RoleCreateGet();
                var Groups = await _roleGroupProvider.List(CurrentUser.Id);
                RoleCreateGet.RoleGroups = Groups;
                return Ok(RoleCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(RoleCreateGet Role)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Role.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _RoleProvider.RoleCreatePostCheck(Role);
                //if (CheckString.Length == 0)
                //{
                SipRole AspNetRole = new SipRole
                {
                    Name = Role.Name,
                    RoleGroupId = Role.RoleGroupId
                };
                await _roleManager.CreateAsync(AspNetRole);
                var x = await _roleManager.GetRoleIdAsync(AspNetRole);
                Role.RoleId = x;
                _roleProvider.CreatePost(Role);
                return Ok(Role);
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

        [HttpGet("Index")]
        public async Task<IActionResult> RoleIndexGet()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _roleProvider.IndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Update/{Id}")]
        public async Task<IActionResult> Update(string Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                if (await _checkProvider.CheckIfRecordExists("AspNetRoles", "ID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _roleProvider.UpdateGet(CurrentUser.Id, Id);
                var y = await _roleGroupProvider.List(CurrentUser.Id);

                x.RoleGroups = y;
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(RoleUpdateGet Role)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {

                Role.UserId= CurrentUser.Id;

                var RoleToBeUpdate = await _roleManager.FindByIdAsync(Role.RoleId);
                RoleToBeUpdate.Name = Role.Name;
                RoleToBeUpdate.RoleGroupId = Role.RoleGroupId;
                
                var x = await _roleManager.UpdateAsync(RoleToBeUpdate);
                if (x.Succeeded )
                {
                    _roleProvider.UpdatePost(Role);
                    return Ok(Role);
                }


                //var CheckString = await _RoleProvider.UpdatePostCheck(Role);
                //if (CheckString.Length == 0)
                //{
                _roleProvider.UpdatePost(Role);
                return Ok(Role);
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


        [HttpGet("Delete/{Id}")]
        public async Task<IActionResult> Delete(string Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                //if (await _checkProvider.CheckIfRecordExists("Roles", "RoleID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var x = await _roleProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(RoleDeleteGet Role)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                //Role.CreatorId = CurrentUser.Id;
                //var CheckString = await _RoleProvider.DeletePostCheck(Role);
                //if (CheckString.Length == 0)
                //{
                _roleProvider.DeletePost(Role.RoleId);
                var x = await _roleManager.FindByIdAsync(Role.RoleId);
                _roleManager.DeleteAsync(x);
                return Ok(Role);
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

        [HttpGet("LanguageIndex/{Id}")]
        public async Task<IActionResult> LanguageIndex(string Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _roleProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _roleProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}