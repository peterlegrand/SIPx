using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SIPx.CallAPI;
using SIPx.Shared;
using Syncfusion.EJ2.QueryBuilder;

namespace SIPx.MVC.Controllers
{
    public class FrontContentController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> ContentType()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<FrontContentContentTypeGroup>>($"{_baseUrl}api/FrontContent/ContentType", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/ContentType", token);
            
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> ContentNew(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<FrontContentContentNew>($"{_baseUrl}api/FrontContent/ContentNew/" + Id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/ContentType", token);
          
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> ContentNew(FrontContentContentNew Content)
        {

            //PETER TODO other similar methods have different structure
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            await _client.PostProtectedAsync<FrontContentContentNew>($"{_baseUrl}api/FrontContent/ContentNew", Content, token);

            return RedirectToAction("Index", "Front");
        }
        [HttpGet]
        public async Task<IActionResult> ShowContent(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<FrontContentShowContent>($"{_baseUrl}api/FrontContent/ShowContent/" + Id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/ShowContent", token);
            
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> AdvancedSearch()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<ContentAdvancedSearchPost>($"{_baseUrl}api/FrontContent/AdvancedSearch/", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/AdvancedSearch", token);
            
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> AdvancedSearch(ContentAdvancedSearchPost SearchData)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var result = await _client.PostProtectedAsync<List<ContentAdvancedSearchResult>>($"{_baseUrl}api/FrontContent/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/SearchResult", token);
            
            return View("SearchResult", result);
        }

        [HttpGet]
        public async Task<IActionResult> RightsEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<FrontContentRightsUpdateGet>($"{_baseUrl}api/FrontContent/RightsUpdate/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/RightsEdit", token);
            
            var ErrorMessage = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessage;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Menu", "Admin");
            }
        }
        [HttpPost]
        public async Task<IActionResult> RightsEdit(FrontContentRightsUpdateGet RightsEdit)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var FrontContentRightsUpdateGetWithErrorMessage = await _client.PostProtectedAsync<FrontContentRightsUpdateGetWithErrorMessages>($"{_baseUrl}api/FrontContent/RightsUpdate", RightsEdit, token);
            if (FrontContentRightsUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/RightsEdit", token);
                
                ViewBag.ErrorMessages = FrontContentRightsUpdateGetWithErrorMessage.ErrorMessages;
                return View(FrontContentRightsUpdateGetWithErrorMessage.FrontContentRights);
            }


            return RedirectToAction("ShowContent", new { id = RightsEdit.ContentId });
        }

        [HttpGet]
        public async Task<IActionResult> RightsEditUserCreate(int Id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<FrontContentRightsEditUserCreateGet>($"{_baseUrl}api/FrontContent/RightsEditUserCreate/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/RightsEditUserCreate", token);
            
            var ErrorMessages = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessages;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Menu", "Admin");
            }
        }
        [HttpPost]
        public async Task<IActionResult> RightsEditUserCreate(FrontContentRightsEditUserCreateGet RightsEditUser)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var FrontContentRightsEditUserCreateGetWithErrorMessage = await _client.PostProtectedAsync<FrontContentRightsEditUserCreateGetWithErrorMessages>($"{_baseUrl}api/FrontContent/RightsEditUserCreate", RightsEditUser, token);
            if (FrontContentRightsEditUserCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/RightsEditUserCreate", token);
                
                ViewBag.ErrorMessages = FrontContentRightsEditUserCreateGetWithErrorMessage.ErrorMessages;
                return View(FrontContentRightsEditUserCreateGetWithErrorMessage.FrontContentRightsEditUser);
            }


            return RedirectToAction("RightsEditUserIndex", new { id = RightsEditUser.ContentId });
        }
        [HttpGet]
        public async Task<IActionResult> RightsEditUserIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<List<FrontContentRightsEditUserIndexGet>>($"{_baseUrl}api/FrontContent/RightsEditUserIndex/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/RightsEditUserIndex", token);
            ViewBag.Id = id;
            
            var ErrorMessage = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessage;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Menu", "Admin");
            }
        }
        [HttpGet]
        public async Task<IActionResult> RightsEditUserDelete(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<FrontContentRightsEditUserDeleteGet>($"{_baseUrl}api/FrontContent/RightsEditUserDelete/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/RightsEditUserDelete", token);
            
            var ErrorMessage = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessage;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Menu", "Admin");
            }
        }

        [HttpPost]
        public async Task<IActionResult> RightsEditUserDelete(FrontContentRightsEditUserDeleteGet RightsEditUser)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            await _client.PostProtectedAsync<FrontContentRightsEditUserDeleteGet>($"{_baseUrl}api/FrontContent/RightsEditUserDelete", RightsEditUser, token);

            return RedirectToAction("RightsEditUserIndex", new { id = RightsEditUser.ContentId });
        }
    }
}
