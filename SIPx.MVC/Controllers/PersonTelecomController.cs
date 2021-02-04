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
    public class PersonTelecomController : Controller
    {

        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        readonly LoadViewBagModel _loadViewBagModel = new LoadViewBagModel();
        public PersonTelecomController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PersonTelecomCreateGet>($"{_configuration["APIUrl"]}api/PersonTelecom/Create/" + Id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PersonTelecom/Create", token);
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
        public async Task<IActionResult> Create(PersonTelecomCreateGet PersonTelecom)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PersonTelecomCreateGetWithErrorMessage = await _client.PostProtectedAsync<PersonTelecomCreateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/PersonTelecom/Create", PersonTelecom, token);
            if (PersonTelecomCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
                AllStuff.ErrorMessages = PersonTelecomCreateGetWithErrorMessage.ErrorMessages;
                ViewBag.AllStuff = AllStuff;
                //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PersonTelecom/Create", token);
                //ViewBag.Env = _hostingEnv.EnvironmentName;

                //ViewBag.ErrorMessages = PersonTelecomCreateGetWithErrorMessage.ErrorMessages;
                return View(PersonTelecomCreateGetWithErrorMessage.PersonTelecom);
            }


            return RedirectToAction("Index", new { id = PersonTelecom.PersonId });
        }
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<PersonTelecomIndexGet>>($"{_configuration["APIUrl"]}api/PersonTelecom/Index/" + id,token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PersonTelecom/Index", token);
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
            var response = await _client.GetProtectedAsync2<PersonTelecomUpdateGet>($"{_configuration["APIUrl"]}api/PersonTelecom/Update/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PersonTelecom/Edit", token);
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
        public async Task<IActionResult> Edit(PersonTelecomUpdateGet PersonTelecom)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PersonTelecomUpdateGetWithErrorMessage = await _client.PostProtectedAsync<PersonTelecomUpdateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/PersonTelecom/Update", PersonTelecom, token);
            if (PersonTelecomUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
                AllStuff.ErrorMessages = PersonTelecomUpdateGetWithErrorMessage.ErrorMessages;
                ViewBag.AllStuff = AllStuff;
                //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PersonTelecom/Edit", token);
                //ViewBag.Env = _hostingEnv.EnvironmentName;

                //ViewBag.ErrorMessages = PersonTelecomUpdateGetWithErrorMessage.ErrorMessages;
                return View(PersonTelecomUpdateGetWithErrorMessage.PersonTelecom);
            }

            return RedirectToAction("Index", new { id = PersonTelecom.PersonId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PersonTelecomDeleteGet>($"{_configuration["APIUrl"]}api/PersonTelecom/Delete/" + id, token);
            ViewBag.AllStuff = await _loadViewBagModel.ViewBagLoad(this.ControllerContext.RouteData.Values["controller"].ToString(), this.ControllerContext.RouteData.Values["action"].ToString(), token, _hostingEnv.EnvironmentName, _configuration, false, 0, "");
            //ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            //ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            //ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/PersonTelecom/Delete", token);
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
        public async Task<IActionResult> Delete(PersonTelecomDeleteGet PersonTelecom)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PersonTelecomDeleteGet>($"{_configuration["APIUrl"]}api/PersonTelecom/Delete", PersonTelecom, token);

            return RedirectToAction("Index", new { id = PersonTelecom.PersonId });
        }


    }
}