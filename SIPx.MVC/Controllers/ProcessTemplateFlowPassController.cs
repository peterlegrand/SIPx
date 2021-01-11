using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SIPx.CallAPI;
using SIPx.Shared;

namespace SIPx.MVC.Controllers
{
    public class ProcessTemplateFlowPassController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTemplateFlowPassCreateGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Create/" + Id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowPass/Create", token);
            
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
        public async Task<IActionResult> Create(ProcessTemplateFlowPassCreateGet ProcessTemplateFlowPass)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateFlowPassCreateGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Create", ProcessTemplateFlowPass, token);
            var ProcessTemplateFlowPassCreateGetWithErrorMessage = await _client.PostProtectedAsync<ProcessTemplateFlowPassCreateGetWithErrorMessages>($"{_baseUrl}api/ProcessTemplateFlowPass/Create", ProcessTemplateFlowPass, token);
            if (ProcessTemplateFlowPassCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowPass/Create", token);
                
                ViewBag.ErrorMessages = ProcessTemplateFlowPassCreateGetWithErrorMessage.ErrorMessages;
                return View(ProcessTemplateFlowPassCreateGetWithErrorMessage.ProcessTemplateFlowPass);
            }


            return RedirectToAction("Index", new { id = ProcessTemplateFlowPass.ProcessTemplateFlowId });
       
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<ProcessTemplateFlowPassIndexGet>>($"{_baseUrl}api/ProcessTemplateFlowPass/Index/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowPass/Index", token);
            var ProcessTemplateId = await _client.GetProtectedAsync<int>($"{_baseUrl}api/ProcessTemplateFlowPass/IndexGetProcessTemplateId/" + id, token);
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
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTemplateFlowPassUpdateGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Update/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowPass/Edit", token);
            
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
        public async Task<IActionResult> Edit(ProcessTemplateFlowPassUpdateGet ProcessTemplateFlowPass)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ProcessTemplateFlowPassUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ProcessTemplateFlowPassUpdateGetWithErrorMessages>($"{_baseUrl}api/ProcessTemplateFlowPass/Update", ProcessTemplateFlowPass, token);
            if (ProcessTemplateFlowPassUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowPass/Edit", token);
                
                ViewBag.ErrorMessages = ProcessTemplateFlowPassUpdateGetWithErrorMessage.ErrorMessages;
                return View(ProcessTemplateFlowPassUpdateGetWithErrorMessage.ProcessTemplateFlowPass);
            }

            return RedirectToAction("Index", new { id = ProcessTemplateFlowPass.ProcessTemplateFlowId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTemplateFlowPassDeleteGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Delete/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowPass/Delete", token);
            
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
        public async Task<IActionResult> Delete(ProcessTemplateFlowPassDeleteGet ProcessTemplateFlowPass)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateFlowPassDeleteGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Delete", ProcessTemplateFlowPass, token);

            return RedirectToAction("Index", new { id = ProcessTemplateFlowPass.ProcessTemplateFlowId });
        }
    }
}