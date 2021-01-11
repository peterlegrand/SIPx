using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class MVCFavoriteController : ControllerBase
    {
        private readonly IUITermLanguageCustomizationProvider _uITermLanguageCustomizationProvider;
        private readonly IMVCFavoriteProvider _favoriteProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public MVCFavoriteController(IUITermLanguageCustomizationProvider uITermLanguageCustomizationProvider
            , IMVCFavoriteProvider favoriteProvider
            , IMasterProvider masterProvider
            , IMasterListProvider masterListProvider
            , ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , IClassificationProvider classificationProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _uITermLanguageCustomizationProvider = uITermLanguageCustomizationProvider;
            _favoriteProvider = favoriteProvider;
            _masterProvider = masterProvider;
            _masterListProvider = masterListProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }


        [HttpGet("View")]
        public async Task<IActionResult> View()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var RootFavorites = await _favoriteProvider.ViewGet(CurrentUser.Id, null);
            var FavoriteGroups = await _favoriteProvider.ViewGetGroup(CurrentUser.Id);
            var FavoriteListView = new MVCFavoriteListView();
            FavoriteListView.RootFavorites = RootFavorites;
            FavoriteListView.FavoriteGroups = FavoriteGroups;
            List<object> menuItems = new List<object>();

            //for (int i = 0; i < RootFavorites.Count; i++)
            //{
            //    FavoriteListView.FavoriteGroups[i].Favorites = await _favoriteProvider.ViewGet(CurrentUser.Id, FavoriteGroups[i].MVCFavoriteGroupId);
            //}
            for (int i = 0; i < FavoriteGroups.Count; i++)
            {
                FavoriteListView.FavoriteGroups[i].Favorites = await _favoriteProvider.ViewGet(CurrentUser.Id, FavoriteGroups[i].MVCFavoriteGroupId);
            }

            return Ok(FavoriteListView);
        }
        [HttpGet("Menu")]
        public async Task<IActionResult> Menu()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var FavoriteMenu = await _favoriteProvider.Menu(CurrentUser.Id);


            return Ok(FavoriteMenu);
        }
        [HttpGet("GroupList")]
        public async Task<IActionResult> GroupList()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var FavoriteGroupList = new List<MVCFavoriteGroupList>();
            FavoriteGroupList = await _favoriteProvider.GroupList(CurrentUser.Id);
            var Term = await _uITermLanguageCustomizationProvider.OneTerm("Root", CurrentUser.Id);
            FavoriteGroupList.Insert(0, new MVCFavoriteGroupList { MVCFavoriteGroupId = 0, Name = Term });
            return Ok(FavoriteGroupList);
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add(MVCFavoriteAdd Favorite)
        {
         if(Favorite.MVCFavoriteGroupId == 0)
            { 
                Favorite.MVCFavoriteGroupId = null;
            }
            var CurrentUser = await _userManager.GetUserAsync(User);
            Favorite.UserId = CurrentUser.Id;
            await _favoriteProvider.Add(Favorite);
            return Ok(Favorite);
         }

    }
}