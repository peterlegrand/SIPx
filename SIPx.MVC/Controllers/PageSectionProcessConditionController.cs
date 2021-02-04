using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SIPx.CallAPI;
using SIPx.MVC.Classes;
using SIPx.Shared;

namespace SIPx.MVC.Controllers
{
    public class PageSectionProcessConditionController : Controller
    {

        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        readonly LoadViewBagModel _loadViewBagModel = new LoadViewBagModel();
        public PageSectionProcessConditionController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PageSectionProcessConditionCreateGet>($"{_configuration["APIUrl"]}api/PageSectionProcessCondition/Create/" + Id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PageSectionProcessCondition/Create", token);
            //ViewBag.Env = _hostingEnv.EnvironmentName;

            //var ErrorMessages = new List<ErrorMessage>();
            //ViewBag.ErrorMessages = ErrorMessages;
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
        public async Task<IActionResult> Create(PageSectionProcessConditionCreateGet PageSectionProcessCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PageSectionProcessConditionCreateGet>($"{_configuration["APIUrl"]}api/PageSectionProcessCondition/Create", PageSectionProcessCondition, token);
            var PageSectionProcessConditionCreateGetWithErrorMessage = await _client.PostProtectedAsync<PageSectionProcessConditionCreateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/PageSectionProcessCondition/Create", PageSectionProcessCondition, token);
            if (PageSectionProcessConditionCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
                AllStuff.ErrorMessages = PageSectionProcessConditionCreateGetWithErrorMessage.ErrorMessages;
                ViewBag.AllStuff = AllStuff;
                //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PageSectionProcessCondition/Create", token);
                //ViewBag.Env = _hostingEnv.EnvironmentName;

                //ViewBag.ErrorMessages = PageSectionProcessConditionCreateGetWithErrorMessage.ErrorMessages;
                return View(PageSectionProcessConditionCreateGetWithErrorMessage.PageSectionProcessCondition);
            }

            return RedirectToAction("Index", new { id = PageSectionProcessCondition.PageSectionId });
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<PageSectionProcessConditionIndexGet>>($"{_configuration["APIUrl"]}api/PageSectionProcessCondition/Index/" +id,token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PageSectionProcessCondition/Index", token);
            //ViewBag.Id = id;
            //ViewBag.Env = _hostingEnv.EnvironmentName;

            //var ErrorMessage = new List<ErrorMessage>();
            //ViewBag.ErrorMessages = ErrorMessage;
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
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PageSectionProcessConditionUpdateGet>($"{_configuration["APIUrl"]}api/PageSectionProcessCondition/Update/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PageSectionProcessCondition/Edit", token);
            //ViewBag.Env = _hostingEnv.EnvironmentName;

            //var ErrorMessage = new List<ErrorMessage>();
            //ViewBag.ErrorMessages = ErrorMessage;
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
        public async Task<IActionResult> Edit(PageSectionProcessConditionUpdateGet PageSectionProcessCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PageSectionProcessConditionUpdateGetWithErrorMessage = await _client.PostProtectedAsync<PageSectionProcessConditionUpdateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/PageSectionProcessCondition/Update", PageSectionProcessCondition, token);
            if (PageSectionProcessConditionUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
                AllStuff.ErrorMessages = PageSectionProcessConditionUpdateGetWithErrorMessage.ErrorMessages;
                ViewBag.AllStuff = AllStuff;
                //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PageSectionProcessCondition/Edit", token);
                //ViewBag.Env = _hostingEnv.EnvironmentName;

                //ViewBag.ErrorMessages = PageSectionProcessConditionUpdateGetWithErrorMessage.ErrorMessages;
                return View(PageSectionProcessConditionUpdateGetWithErrorMessage.PageSectionProcessCondition);
            }

            return RedirectToAction("Index", new { id = PageSectionProcessCondition.PageSectionId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PageSectionProcessConditionDeleteGet>($"{_configuration["APIUrl"]}api/PageSectionProcessCondition/Delete/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PageSectionProcessCondition/Delete", token);
            //ViewBag.Env = _hostingEnv.EnvironmentName;

            //var ErrorMessage = new List<ErrorMessage>();
            //ViewBag.ErrorMessages = ErrorMessage;
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
        public async Task<IActionResult> Delete(PageSectionProcessConditionDeleteGet PageSectionProcessCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PageSectionProcessConditionDeleteGet>($"{_configuration["APIUrl"]}api/PageSectionProcessCondition/Delete", PageSectionProcessCondition, token);

            return RedirectToAction("Index", new { id = PageSectionProcessCondition.PageSectionId });
        }
        [HttpGet]
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<PageSectionLanguageIndexGet>>($"{_configuration["APIUrl"]}api/PageSection/LanguageIndex/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PageSection/LanguageIndex", token);
            //ViewBag.Env = _hostingEnv.EnvironmentName;

            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<PageSectionLanguageIndexGet>($"{_configuration["APIUrl"]}api/PageSection/LanguageUpdate/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PageSection/LanguageEdit", token);
            //ViewBag.Env = _hostingEnv.EnvironmentName;

            return View(response);
        }


    }
}