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
    public class OrganizationController : Controller
    {

        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        readonly LoadViewBagModel _loadViewBagModel = new LoadViewBagModel();
        public OrganizationController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<OrganizationCreateGet>($"{_configuration["APIUrl"]}api/Organization/Create/"+Id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/Organization/Create", token);
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
        public async Task<IActionResult> Create(OrganizationCreateGet Organization)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var OrganizationCreateGetWithErrorMessage = await _client.PostProtectedAsync<OrganizationCreateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/Organization/Create", Organization, token);
            if (OrganizationCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
                AllStuff.ErrorMessages = OrganizationCreateGetWithErrorMessage.ErrorMessages;
                ViewBag.AllStuff = AllStuff;
                //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/Organization/Create", token);
                //ViewBag.Env = _hostingEnv.EnvironmentName;

                //ViewBag.ErrorMessages = OrganizationCreateGetWithErrorMessage.ErrorMessages;
                return View(OrganizationCreateGetWithErrorMessage.Organization);
            }

            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<OrganizationIndexGet>>($"{_configuration["APIUrl"]}api/Organization/Index",token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/Organization/Index", token);
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
            var response = await _client.GetProtectedAsync2<OrganizationUpdateGet>($"{_configuration["APIUrl"]}api/Organization/Update/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/Organization/Edit", token);
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
        public async Task<IActionResult> Edit(OrganizationUpdateGet Organization)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var OrganizationUpdateGetWithErrorMessage = await _client.PostProtectedAsync<OrganizationUpdateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/Organization/Update", Organization, token);
            if (OrganizationUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
                AllStuff.ErrorMessages = OrganizationUpdateGetWithErrorMessage.ErrorMessages;
                ViewBag.AllStuff = AllStuff;
                //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/Organization/Edit", token);
                //ViewBag.Env = _hostingEnv.EnvironmentName;

                //ViewBag.ErrorMessages = OrganizationUpdateGetWithErrorMessage.ErrorMessages;
                return View(OrganizationUpdateGetWithErrorMessage.Organization);
            }

            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<OrganizationDeleteGet>($"{_configuration["APIUrl"]}api/Organization/Delete/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/Organization/Delete", token);
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
        public async Task<IActionResult> Delete(OrganizationDeleteGet Page)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<OrganizationDeleteGet>($"{_configuration["APIUrl"]}api/Organization/Delete", Page, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<OrganizationLanguageIndexGet>>($"{_configuration["APIUrl"]}api/Organization/LanguageIndex/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/Organization/LanguageIndex", token);
            //ViewBag.Env = _hostingEnv.EnvironmentName;

            return View(response);
            //return View();
        }

        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<OrganizationLanguageIndexGet>($"{_configuration["APIUrl"]}api/Organization/LanguageUpdate/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/Organization/LanguageEdit", token);
            //ViewBag.Env = _hostingEnv.EnvironmentName;

            return View(response);
        }

    }
}