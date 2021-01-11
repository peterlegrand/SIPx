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
    public class FrontUserFavoriteController : ControllerBase
    {
        private readonly IFrontUserFavoriteGroupProvider _frontUserFavoriteGroupProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IFrontUserFavoriteProvider _frontUserFavoriteProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public FrontUserFavoriteController(
            IFrontUserFavoriteGroupProvider frontUserFavoriteGroupProvider
            , ICheckProvider checkProvider
            , IFrontUserFavoriteProvider frontUserFavoriteProvider
            , IClaimCheck claimCheck
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _frontUserFavoriteGroupProvider = frontUserFavoriteGroupProvider;
            _checkProvider = checkProvider;
            _frontUserFavoriteProvider = frontUserFavoriteProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }
   
        private async Task<MVCFavoriteUpdateGet> UpdateAddDropDownBoxes(MVCFavoriteUpdateGet MVCFavorite, string UserId)
        {

            var Sequences = await _frontUserFavoriteProvider.UpdateGetSequence(UserId,  MVCFavorite.MVCFavoriteGroupId);
            var MVCFavoriteGroups = await _frontUserFavoriteGroupProvider.List(UserId);
            MVCFavorite.Sequences = Sequences;
            MVCFavorite.MVCFavoriteGroups = MVCFavoriteGroups;
            return MVCFavorite;
        }
       
        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _frontUserFavoriteProvider.IndexGet(CurrentUser.Id));
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
                var MVCFavorite = await _frontUserFavoriteProvider.UpdateGet(CurrentUser.Id, Id);
                MVCFavorite = await UpdateAddDropDownBoxes(MVCFavorite, CurrentUser.Id);
                return Ok(MVCFavorite);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(MVCFavoriteUpdateGet MVCFavorite)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _frontUserFavoriteProvider.UpdatePostCheck(MVCFavorite);
                if (ErrorMessages.Count > 0)
                {
                    MVCFavorite = await UpdateAddDropDownBoxes(MVCFavorite, CurrentUser.Id);
                }
                else
                {
                    _frontUserFavoriteProvider.UpdatePost(MVCFavorite);
                }
                MVCFavoriteUpdateGetWithErrorMessages MVCFavoriteWithErrorMessage = new MVCFavoriteUpdateGetWithErrorMessages { MVCFavorite = MVCFavorite, ErrorMessages = ErrorMessages };
                return Ok(MVCFavoriteWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            MVCFavoriteUpdateGetWithErrorMessages MVCFavoriteWithNoRights = new MVCFavoriteUpdateGetWithErrorMessages { MVCFavorite = MVCFavorite, ErrorMessages = ErrorMessages };
            return Ok(MVCFavoriteWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
         
                if (await _checkProvider.CheckIfRecordExists("MVCFavorites", "MVCFavoriteID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _frontUserFavoriteProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(MVCFavoriteDeleteGet MVCFavorite)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                MVCFavorite.UserId= CurrentUser.Id;

                //PETER TODO Add the post check
                _frontUserFavoriteProvider.DeletePost(CurrentUser.Id, MVCFavorite.MVCFavoriteId);
                return Ok(MVCFavorite);
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