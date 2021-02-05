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

namespace SIPx.MVC.Controllers
{
    public class ProcessTypeFlowPassController : Controller
    {

        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        public ProcessTypeFlowPassController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTypeFlowPassCreateGet>($"{_configuration["APIUrl"]}api/ProcessTypeFlowPass/Create/" + Id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProcessTypeFlowPass/Create", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;

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
        public async Task<IActionResult> Create(ProcessTypeFlowPassCreateGet ProcessTypeFlowPass)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTypeFlowPassCreateGet>($"{_configuration["APIUrl"]}api/ProcessTypeFlowPass/Create", ProcessTypeFlowPass, token);
            var ProcessTypeFlowPassCreateGetWithErrorMessage = await _client.PostProtectedAsync<ProcessTypeFlowPassCreateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/ProcessTypeFlowPass/Create", ProcessTypeFlowPass, token);
            if (ProcessTypeFlowPassCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProcessTypeFlowPass/Create", token);
                ViewBag.Env = _hostingEnv.EnvironmentName;

                ViewBag.ErrorMessages = ProcessTypeFlowPassCreateGetWithErrorMessage.ErrorMessages;
                return View(ProcessTypeFlowPassCreateGetWithErrorMessage.ProcessTypeFlowPass);
            }


            return RedirectToAction("Index", new { id = ProcessTypeFlowPass.ProcessTypeFlowId });
       
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<ProcessTypeFlowPassIndexGet>>($"{_configuration["APIUrl"]}api/ProcessTypeFlowPass/Index/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProcessTypeFlowPass/Index", token);
            var ProcessTypeId = await _client.GetProtectedAsync<int>($"{_configuration["APIUrl"]}api/ProcessTypeFlowPass/IndexGetProcessTypeId/" + id, token);
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
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTypeFlowPassUpdateGet>($"{_configuration["APIUrl"]}api/ProcessTypeFlowPass/Update/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProcessTypeFlowPass/Edit", token);
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
        public async Task<IActionResult> Edit(ProcessTypeFlowPassUpdateGet ProcessTypeFlowPass)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ProcessTypeFlowPassUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ProcessTypeFlowPassUpdateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/ProcessTypeFlowPass/Update", ProcessTypeFlowPass, token);
            if (ProcessTypeFlowPassUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProcessTypeFlowPass/Edit", token);
                ViewBag.Env = _hostingEnv.EnvironmentName;

                ViewBag.ErrorMessages = ProcessTypeFlowPassUpdateGetWithErrorMessage.ErrorMessages;
                return View(ProcessTypeFlowPassUpdateGetWithErrorMessage.ProcessTypeFlowPass);
            }

            return RedirectToAction("Index", new { id = ProcessTypeFlowPass.ProcessTypeFlowId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTypeFlowPassDeleteGet>($"{_configuration["APIUrl"]}api/ProcessTypeFlowPass/Delete/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProcessTypeFlowPass/Delete", token);
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
        public async Task<IActionResult> Delete(ProcessTypeFlowPassDeleteGet ProcessTypeFlowPass)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTypeFlowPassDeleteGet>($"{_configuration["APIUrl"]}api/ProcessTypeFlowPass/Delete", ProcessTypeFlowPass, token);

            return RedirectToAction("Index", new { id = ProcessTypeFlowPass.ProcessTypeFlowId });
        }
    }
}