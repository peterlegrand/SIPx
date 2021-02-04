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
    public class OrganizationTelecomController : Controller
    {

        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        readonly LoadViewBagModel _loadViewBagModel = new LoadViewBagModel();
        public OrganizationTelecomController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<OrganizationTelecomCreateGet>($"{_configuration["APIUrl"]}api/OrganizationTelecom/Create/" + Id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/OrganizationTelecom/Create", token);
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
        public async Task<IActionResult> Create(OrganizationTelecomCreateGet OrganizationTelecom)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var OrganizationTelecomCreateGetWithErrorMessage = await _client.PostProtectedAsync<OrganizationTelecomCreateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/OrganizationTelecom/Create", OrganizationTelecom, token);
            if (OrganizationTelecomCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
                AllStuff.ErrorMessages = OrganizationTelecomCreateGetWithErrorMessage.ErrorMessages;
                ViewBag.AllStuff = AllStuff;
                //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/OrganizationTelecom/Create", token);
                //ViewBag.Env = _hostingEnv.EnvironmentName;

                //ViewBag.ErrorMessages = OrganizationTelecomCreateGetWithErrorMessage.ErrorMessages;
                return View(OrganizationTelecomCreateGetWithErrorMessage.OrganizationTelecom);
            }

            return RedirectToAction("Index", new { id = OrganizationTelecom.OrganizationId });
        }
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<OrganizationTelecomIndexGet>>($"{_configuration["APIUrl"]}api/OrganizationTelecom/Index/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/OrganizationTelecom/Index", token);
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
            var response = await _client.GetProtectedAsync2<OrganizationTelecomUpdateGet>($"{_configuration["APIUrl"]}api/OrganizationTelecom/Update/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/OrganizationTelecom/Edit", token);
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
        public async Task<IActionResult> Edit(OrganizationTelecomUpdateGet OrganizationTelecom)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var OrganizationTelecomUpdateGetWithErrorMessage = await _client.PostProtectedAsync<OrganizationTelecomUpdateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/OrganizationTelecom/Update", OrganizationTelecom, token);
            if (OrganizationTelecomUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
                AllStuff.ErrorMessages = OrganizationTelecomUpdateGetWithErrorMessage.ErrorMessages;
                ViewBag.AllStuff = AllStuff;
                //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/OrganizationTelecom/Edit", token);
                //ViewBag.Env = _hostingEnv.EnvironmentName;

                //ViewBag.ErrorMessages = OrganizationTelecomUpdateGetWithErrorMessage.ErrorMessages;
                return View(OrganizationTelecomUpdateGetWithErrorMessage.OrganizationTelecom);
            }

            return RedirectToAction("Index", new { id = OrganizationTelecom.OrganizationId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<OrganizationTelecomDeleteGet>($"{_configuration["APIUrl"]}api/OrganizationTelecom/Delete/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/OrganizationTelecom/Delete", token);
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
        public async Task<IActionResult> Delete(OrganizationTelecomDeleteGet OrganizationTelecom)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<OrganizationTelecomDeleteGet>($"{_configuration["APIUrl"]}api/OrganizationTelecom/Delete", OrganizationTelecom, token);

            return RedirectToAction("Index", new { id = OrganizationTelecom.OrganizationId });
        }


    }
}