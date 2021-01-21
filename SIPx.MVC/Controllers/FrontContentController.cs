using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SIPx.CallAPI;
using SIPx.Shared;
using Syncfusion.EJ2.QueryBuilder;

namespace SIPx.MVC.Controllers
{
    public class FrontContentController : Controller
    {

        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        public FrontContentController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }

        [HttpGet]
        public async Task<IActionResult> ContentType()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<FrontContentContentTypeGroup>>($"{_configuration["APIUrl"]}api/FrontContent/ContentType", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/ContentType", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;

            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> ContentNew(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<FrontContentContentNew>($"{_configuration["APIUrl"]}api/FrontContent/ContentNew/" + Id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/ContentNew", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;

            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> ContentNew(FrontContentContentNew Content)
        {

            //PETER TODO other similar methods have different structure
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            await _client.PostProtectedAsync<FrontContentContentNew>($"{_configuration["APIUrl"]}api/FrontContent/ContentNew", Content, token);

            return RedirectToAction("Index", "Front");
        }
        [HttpGet]
        public async Task<IActionResult> ShowContent(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<FrontContentShowContent>($"{_configuration["APIUrl"]}api/FrontContent/ShowContent/" + Id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/ShowContent", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;

            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> AdvancedSearch()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<ContentAdvancedSearchPost>($"{_configuration["APIUrl"]}api/FrontContent/AdvancedSearch/", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/AdvancedSearch", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;

            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> AdvancedSearch(ContentAdvancedSearchPost SearchData)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var result = await _client.PostProtectedAsync<List<ContentAdvancedSearchResult>>($"{_configuration["APIUrl"]}api/FrontContent/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/SearchResult", token);
            
            return View("SearchResult", result);
        }

        [HttpGet]
        public async Task<IActionResult> RightsEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<FrontContentRightsUpdateGet>($"{_configuration["APIUrl"]}api/FrontContent/RightsUpdate/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/RightsEdit", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;

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
            var FrontContentRightsUpdateGetWithErrorMessage = await _client.PostProtectedAsync<FrontContentRightsUpdateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/FrontContent/RightsUpdate", RightsEdit, token);
            if (FrontContentRightsUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/RightsEdit", token);
                ViewBag.Env = _hostingEnv.EnvironmentName;

                ViewBag.ErrorMessages = FrontContentRightsUpdateGetWithErrorMessage.ErrorMessages;
                return View(FrontContentRightsUpdateGetWithErrorMessage.FrontContentRights);
            }


            return RedirectToAction("ShowContent", new { id = RightsEdit.ContentId });
        }

        [HttpGet]
        public async Task<IActionResult> RightsEditUserCreate(int Id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<FrontContentRightsEditUserCreateGet>($"{_configuration["APIUrl"]}api/FrontContent/RightsEditUserCreate/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/RightsEditUserCreate", token);
            
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
            var FrontContentRightsEditUserCreateGetWithErrorMessage = await _client.PostProtectedAsync<FrontContentRightsEditUserCreateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/FrontContent/RightsEditUserCreate", RightsEditUser, token);
            if (FrontContentRightsEditUserCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/RightsEditUserCreate", token);
                ViewBag.Env = _hostingEnv.EnvironmentName;

                ViewBag.ErrorMessages = FrontContentRightsEditUserCreateGetWithErrorMessage.ErrorMessages;
                return View(FrontContentRightsEditUserCreateGetWithErrorMessage.FrontContentRightsEditUser);
            }


            return RedirectToAction("RightsEditUserIndex", new { id = RightsEditUser.ContentId });
        }
        [HttpGet]
        public async Task<IActionResult> RightsEditUserIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<List<FrontContentRightsEditUserIndexGet>>($"{_configuration["APIUrl"]}api/FrontContent/RightsEditUserIndex/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/RightsEditUserIndex", token);
            ViewBag.Id = id;
            ViewBag.Env = _hostingEnv.EnvironmentName;

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
            var response = await _client.GetProtectedAsync2<FrontContentRightsEditUserDeleteGet>($"{_configuration["APIUrl"]}api/FrontContent/RightsEditUserDelete/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/FrontContent/RightsEditUserDelete", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;

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
            await _client.PostProtectedAsync<FrontContentRightsEditUserDeleteGet>($"{_configuration["APIUrl"]}api/FrontContent/RightsEditUserDelete", RightsEditUser, token);

            return RedirectToAction("RightsEditUserIndex", new { id = RightsEditUser.ContentId });
        }
    }
}
