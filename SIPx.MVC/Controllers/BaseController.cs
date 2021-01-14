using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SIPx.CallAPI;
using SIPx.Shared;



namespace SIPx.MVC.Controllers
{
    public class BaseController : Controller
    {

        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        public BaseController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }

    


        [HttpGet]
        public async Task<IActionResult> LanguageCreate(int Id, string BaseType)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }

            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/{BaseType}/LanguageCreate", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;
            ViewBag.ErrorMessages = new List<ErrorMessage>();

            var response = await _client.GetProtectedAsync2<BaseLanguageCreateGet>($"{_configuration["APIUrl"]}api/Base/LanguageCreate/{Id}?BaseType={BaseType}", token);
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
        public async Task<IActionResult> LanguageCreate(BaseLanguageCreateGet BaseLanguage)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var BaseLanguageCreateGetWithErrorMessage = await _client.PostProtectedAsync<BaseLanguageCreateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/Base/LanguageCreate?BaseType={BaseLanguage.BaseType}", BaseLanguage, token);
            if (BaseLanguageCreateGetWithErrorMessage.ErrorMessages.Count>0)
            {
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/{BaseLanguage}/LanguageCreate", token);
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.Env = _hostingEnv.EnvironmentName;
                ViewBag.ErrorMessages = BaseLanguageCreateGetWithErrorMessage.ErrorMessages;

                return View(BaseLanguageCreateGetWithErrorMessage.BaseLanguage);
            }
            var RouteValues = new Dictionary<string, string> { { "BaseType", BaseLanguage.BaseType }, { "Id", BaseLanguage.BaseId.ToString() } };
            return RedirectToAction("LanguageIndex", "Base",RouteValues);
        }
        [HttpGet]
        public async Task<IActionResult> LanguageIndex(int Id, string BaseType)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<BaseLanguageIndexGet>($"{_configuration["APIUrl"]}api/Base/LanguageIndex/{Id}?BaseType={BaseType}", token);

            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/{BaseType}/LanguageIndex", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;

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
        public async Task<IActionResult> LanguageEdit(int Id, string BaseType)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<BaseLanguageUpdateGet>($"{_configuration["APIUrl"]}api/Base/LanguageUpdate/{Id}?BaseType={BaseType}", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/{BaseType}/LanguageEdit", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;
            ViewBag.ErrorMessages = new List<ErrorMessage>();
            //var tool = new
            //{
            //    tooltipText = "Multiple Image upload",
            //    template = "<button type='button' class='e-tbar-btn e-btn' tabindex='-1' id='custom_tbar'  style='width:100%'><div class='e-tbar-btn-text rtecustomtool' style='font-weight: 500;'>Multiple upload</div></button>" 
            //};
            ////PETER TODO This view stuff need to be reviewed. Above and below
            //ViewBag.items = new object[] { "Bold", "Italic", "Underline","Formats", "Alignments", "OrderedList", "UnorderedList",
            //     "Image", "|", tool, "SourceCode", "Undo", "Redo" };
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
        public async Task<IActionResult> LanguageEdit(BaseLanguageUpdateGet BaseLanguage)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var BaseLanguageUpdateGetWithErrorMessage = await _client.PostProtectedAsync<BaseLanguageUpdateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/Base/LanguageUpdate?BaseType={BaseLanguage.BaseType}", BaseLanguage, token);
            if (BaseLanguageUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/{BaseLanguage.BaseType}/LanguageEdit", token);
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.ErrorMessages = BaseLanguageUpdateGetWithErrorMessage.ErrorMessages;
                ViewBag.Env = _hostingEnv.EnvironmentName;
                return View(BaseLanguageUpdateGetWithErrorMessage.BaseLanguage);
            }
            var RouteValues = new Dictionary<string, string> { { "BaseType", BaseLanguage.BaseType }, { "Id", BaseLanguage.BaseId.ToString() } };
            return RedirectToAction("LanguageIndex", "Base", RouteValues);

        }
        [HttpGet]
        public async Task<IActionResult> LanguageDelete(int Id, string BaseType)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<BaseLanguageDeleteGet>($"{_configuration["APIUrl"]}api/{BaseType}/LanguageDelete/" + Id, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/{BaseType}/LanguageDelete", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.ErrorMessages = new List<ErrorMessage>();
            ViewBag.Env = _hostingEnv.EnvironmentName;
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
        public async Task<IActionResult> LanguageDelete(BaseLanguageDeleteGet BaseLanguage)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<BaseLanguageDeleteGet>($"{_configuration["APIUrl"]}api/{BaseLanguage.BaseType}/LanguageDelete", BaseLanguage, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index",BaseLanguage.BaseId);
        }
   }
}