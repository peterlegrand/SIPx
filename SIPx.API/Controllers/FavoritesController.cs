using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class FavoriteController : ControllerBase
    {
        private readonly IFavoriteProvider _favoriteProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public FavoriteController(IFavoriteProvider favoriteProvider, IMasterProvider masterProvider, IMasterListProvider masterListProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _favoriteProvider = favoriteProvider;
            _masterProvider = masterProvider;
            _masterListProvider = masterListProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }



        [HttpPost("Add")]
        public async Task<IActionResult> Add(FavoritesAdd Favorite)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Favorite.UserId = CurrentUser.Id;
            await _favoriteProvider.Add(Favorite);
            return Ok(Favorite);
            //if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            //{
            //    ErrorMessages = await _classificationProvider.CreatePostCheck(Classification);
            //    if(ErrorMessages.Count>0)
            //    {
            //        Classification = await CreateAddDropDownBoxes(Classification, CurrentUser.Id);     }
            //    else
            //    { 
            //    _classificationProvider.CreatePost(Classification);
            //    }
            //    ClassificationCreateGetWithErrorMessages ClassificationWithErrorMessage = new ClassificationCreateGetWithErrorMessages { Classification = Classification, ErrorMessages = ErrorMessages };
            //    return Ok(ClassificationWithErrorMessage);              
            //}
            //ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            //ClassificationCreateGetWithErrorMessages ClassificationWithNoRights = new ClassificationCreateGetWithErrorMessages { Classification = Classification, ErrorMessages = ErrorMessages };
            //return Ok(ClassificationWithNoRights);
        }

    }
}