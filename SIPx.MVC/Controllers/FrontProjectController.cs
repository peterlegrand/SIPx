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
    public class FrontProjectController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Create(int Id = 0)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<ProjectCreateGet>($"{_baseUrl}api/FrontProject/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProject/Create", token);
             var ErrorMessage = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessage;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Index", "Front");
            }

        }
        [HttpPost]
        public async Task<IActionResult> Create(ProjectCreateGet Project)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            await _client.PostProtectedAsync<ProjectCreateGet>($"{_baseUrl}api/FrontProject/Create", Project, token);

            return RedirectToAction("AdvancedSearch");
        }
        [HttpGet]
        public async Task<IActionResult> AdvancedSearch()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<ProjectAdvancedSearchPost>($"{_baseUrl}api/FrontProject/AdvancedSearch/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProject/AdvancedSearch", token);
            
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> AdvancedSearch(ProjectAdvancedSearchPost SearchData)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var result = await _client.PostProtectedAsync<List<ProjectAdvancedSearchResult>>($"{_baseUrl}api/FrontProject/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProject/SearchResult", token);
            
            return View("SearchResult", result);
        }
        [HttpGet]
        public async Task<IActionResult> Dashboard(int Id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<FrontProjectIndexGet>($"{_baseUrl}api/FrontProject/Index/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProject/Dashboard", token);
            
            return View(response);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<ProjectUpdateGet>($"{_baseUrl}api/FrontProject/Update/" + id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProject/Edit", token);
            
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
        public async Task<IActionResult> Edit(ProjectUpdateGet Project)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var ProjectUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ProjectUpdateGetWithErrorMessages>($"{_baseUrl}api/FrontProject/Update", Project, token);
            if (ProjectUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProject/Edit", token);
                
                ViewBag.ErrorMessages = ProjectUpdateGetWithErrorMessage.ErrorMessages;
                return View(ProjectUpdateGetWithErrorMessage.Project);
            }

            return RedirectToAction("Index");
        }

    }

}
