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
    public class FrontPersonController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> AdvancedSearch()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<PersonAdvancedSearchPost>($"{_baseUrl}api/FrontPerson/AdvancedSearch/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPerson/AdvancedSearch", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> AdvancedSearch(PersonAdvancedSearchPost SearchData)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var result = await _client.PostProtectedAsync<List<PersonAdvancedSearchResult>>($"{_baseUrl}api/FrontPerson/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPerson/SearchResult", token);
            ViewBag.UITerms = UITerms;
            return View("SearchResult", result);
        }
        [HttpGet]
        public async Task<IActionResult> QuickSearch([FromQuery(Name = "Search")] string Search)
        {
            var SearchData = new FrontPersonAdvancedSearchGet
            {
                FirstName = Search,
                ToAge = 120
            };
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var result = await _client.PostProtectedAsync<FrontPersonAdvancedSearchGet>($"{_baseUrl}api/FrontPerson/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPerson/SearchResult", token);
            ViewBag.UITerms = UITerms;
            return View("SearchResult", result);
        }

        [HttpGet]
        public async Task<IActionResult> Dashboard(int Id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<FrontUserIndexGet>($"{_baseUrl}api/FrontPerson/Dashboard/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPerson/Dashboard", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
    }

}
