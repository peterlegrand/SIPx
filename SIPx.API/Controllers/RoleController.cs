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

        private async Task<RoleCreateGet> CreateAddDropDownBoxes(RoleCreateGet Role, string UserId)
        {
            var Groups = await _roleGroupProvider.List(UserId);
            Role.RoleGroups = Groups;

            return Role;
        }

        private async Task<RoleUpdateGet> UpdateAddDropDownBoxes(RoleUpdateGet Role, string UserId)
        {
            var RoleGroups = await _roleGroupProvider.List(UserId);

            Role.RoleGroups = RoleGroups;

            return Role;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var Role = new RoleCreateGet();
                Role = await CreateAddDropDownBoxes(Role, CurrentUser.Id);
                return Ok(Role);
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
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _roleProvider.CreatePostCheck(Role);
                if (ErrorMessages.Count > 0)
                {
                    Role = await CreateAddDropDownBoxes(Role, CurrentUser.Id);
                }
                else
                {
                    _roleProvider.CreatePost(Role);
                }
                RoleCreateGetWithErrorMessages RoleWithErrorMessage = new RoleCreateGetWithErrorMessages { Role = Role, ErrorMessages = ErrorMessages };
                return Ok(RoleWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            RoleCreateGetWithErrorMessages RoleWithNoRights = new RoleCreateGetWithErrorMessages { Role = Role, ErrorMessages = ErrorMessages };
            return Ok(RoleWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("AspNetRoles", "ID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var Role = await _roleProvider.UpdateGet(CurrentUser.Id, Id);
                Role = await UpdateAddDropDownBoxes(Role, CurrentUser.Id);
                return Ok(Role);
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
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _roleProvider.UpdatePostCheck(Role);
                if (ErrorMessages.Count > 0)
                {
                    Role = await UpdateAddDropDownBoxes(Role, CurrentUser.Id);
                }
                else
                {
                    _roleProvider.UpdatePost(Role);
                }
                RoleUpdateGetWithErrorMessages RoleWithErrorMessage = new RoleUpdateGetWithErrorMessages { Role = Role, ErrorMessages = ErrorMessages };
                return Ok(RoleWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            RoleUpdateGetWithErrorMessages RoleWithNoRights = new RoleUpdateGetWithErrorMessages { Role = Role, ErrorMessages = ErrorMessages };
            return Ok(RoleWithNoRights);
        }


        [HttpGet("Delete/{Id}")]
        public async Task<IActionResult> Delete(string Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //Role.CreatorId = CurrentUser.Id;
                //var CheckString = await _RoleProvider.DeletePostCheck(Role);
                //if (CheckString.Length == 0)
                //{
                _roleProvider.DeletePost(CurrentUser.Id, Role.RoleId);
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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