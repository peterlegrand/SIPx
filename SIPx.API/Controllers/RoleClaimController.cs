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
    public class RoleClaimController : ControllerBase
    {
        private readonly IMasterListProvider _masterListProvider;
        private readonly IRoleClaimProvider _roleClaimProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public RoleClaimController(IMasterListProvider masterListProvider, IRoleClaimProvider roleClaimProvider, ICheckProvider checkProvider, IClaimCheck claimCheck,Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterListProvider = masterListProvider;
            _roleClaimProvider = roleClaimProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }
        private async Task<RoleClaimCreateGet> CreateAddDropDownBoxes(RoleClaimCreateGet RoleClaim, string UserId, string RoleId )
        {
            RoleClaim = await _roleClaimProvider.CreateGet(UserId, RoleId);
            var Claims = await _roleClaimProvider.CreateGetClaimList(UserId, RoleId);
            RoleClaim.Claims = Claims;
            return RoleClaim;
        }

  

        [HttpGet("Create/{Id}")]
        public async Task<IActionResult> Create(string Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var RoleClaim = new RoleClaimCreateGet();
                RoleClaim = await CreateAddDropDownBoxes(RoleClaim, CurrentUser.Id, Id);
                return Ok(RoleClaim);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(RoleClaimCreateGet RoleClaim)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            RoleClaim.UserId= CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _roleClaimProvider.CreatePostCheck(RoleClaim);
                if (ErrorMessages.Count > 0)
                {
                    RoleClaim = await CreateAddDropDownBoxes(RoleClaim, CurrentUser.Id, RoleClaim.RoleId);
                }
                else
                {
                    _roleClaimProvider.CreatePost(RoleClaim);
                }
                RoleClaimCreateGetWithErrorMessages RoleClaimWithErrorMessage = new RoleClaimCreateGetWithErrorMessages { RoleClaim = RoleClaim, ErrorMessages = ErrorMessages };
                return Ok(RoleClaimWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            RoleClaimCreateGetWithErrorMessages RoleClaimWithNoRights = new RoleClaimCreateGetWithErrorMessages { RoleClaim = RoleClaim, ErrorMessages = ErrorMessages };
            return Ok(RoleClaimWithNoRights);
        }

        [HttpGet("Index/{Id}")]
        public async Task<IActionResult> Index(string Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _roleClaimProvider.IndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        //[HttpGet("Update/{Id:int}")]
        //public async Task<IActionResult> Update(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        var x = await _roleClaimProvider.UpdateGet(CurrentUser.Id, Id);
        //        // x.Icons = icons;

        //        return Ok(x);
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpPost("Update")]
        //public async Task<IActionResult> Update(RoleClaimUpdateGet RoleClaim)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        RoleClaim.ModifierId = CurrentUser.Id;
        //        //var CheckString = await _PersonProvider.UpdatePostCheck(Person);
        //        //if (CheckString.Length == 0)
        //        //{
        //        _roleClaimProvider.UpdatePost(RoleClaim);
        //        return Ok(RoleClaim);
        //        //}
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            //Message = CheckString,
        //        });

        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });

        //}

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("AspNetRoleClaims", "Id", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var x = await _roleClaimProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                //Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(RoleClaimDeleteGet RoleClaim)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //RoleClaim.CreatorId = CurrentUser.Id;
                //var CheckString = await _RoleClaimProvider.DeletePostCheck(RoleClaim);
                //if (CheckString.Length == 0)
                //{
                _roleClaimProvider.DeletePost(CurrentUser.Id, RoleClaim.RoleClaimId);
                return Ok(RoleClaim);
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