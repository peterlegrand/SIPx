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
    public class FrontProcessController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Templates()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<List<NewProcessShowTemplateGroup>>($"{_baseUrl}api/FrontProcess/Templates", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/Templates", token);
            
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
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<FrontProcessNewProcessWithMaster>($"{_baseUrl}api/FrontProcess/Create/" + Id, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/Create", token);
            
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
        public async Task<IActionResult> Create(FrontProcessNewProcessWithMaster Fields, string submit)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
              await _client.PostProtectedAsync<FrontProcessNewProcessWithMaster>($"{_baseUrl}api/FrontProcess/Create", Fields, token);
            return RedirectToAction("Templates");


        }
        [HttpGet]
        public async Task<IActionResult> ToDo()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<List<FrontProcessToDo>>($"{_baseUrl}api/FrontProcess/ToDo", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/ToDo", token);
            
            return View(response);
        }
        public async Task<IActionResult> Edit(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<FrontProcessUpdateGet>($"{_baseUrl}api/FrontProcess/Update/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/Edit", token);
            
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(FrontProcessUpdateGet Process)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<FrontProcessUpdateGet>($"{_baseUrl}api/FrontProcess/Update", Process, token);

            return RedirectToAction("ToDo");
        }
        [HttpGet]
        public async Task<IActionResult> View(int Id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<FrontProcessView>($"{_baseUrl}api/FrontProcess/View/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/View", token);
             
            var ErrorMessage = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessage;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Menu", "Admin");
                //PETER TODO This might need to be redirected somewhere else like home
            }
        }

    
        [HttpGet]
        public async Task<IActionResult> AdvancedSearch()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<ProcessAdvancedSearchPost>($"{_baseUrl}api/FrontProcess/AdvancedSearch/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/AdvancedSearch", token);
            
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> AdvancedSearch(ProcessAdvancedSearchPost SearchData)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var result = await _client.PostProtectedAsync<List<ProcessAdvancedSearchResult>>($"{_baseUrl}api/FrontProcess/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/SearchResult", token);
            
            return View("SearchResult", result);
        }

    }
}