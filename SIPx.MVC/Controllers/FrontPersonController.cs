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
            var response = await _client.GetProtectedAsync<FrontPersonDashboard>($"{_baseUrl}api/FrontPerson/Dashboard/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPerson/Dashboard", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }


        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<FrontPersonUpdateGet>($"{_baseUrl}api/FrontPerson/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPerson/Edit", token);
            ViewBag.UITerms = UITerms;
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
        public async Task<IActionResult> Edit(FrontPersonUpdateGet Person)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var FrontPersonUpdateGetWithErrorMessage = await _client.PostProtectedAsync<FrontPersonUpdateGetWithErrorMessages>($"{_baseUrl}api/FrontPerson/Update", Person, token);
            if (FrontPersonUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPerson/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = FrontPersonUpdateGetWithErrorMessage.ErrorMessages;
                return View(FrontPersonUpdateGetWithErrorMessage.Person);
            }

            return RedirectToAction("Index", "Front");
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<FrontPersonCreateGet>($"{_baseUrl}api/FrontPerson/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPerson/Create", token);
            ViewBag.UITerms = UITerms;
            var ErrorMessages = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessages;
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
        public async Task<IActionResult> Create(FrontPersonCreateGet Person)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }

            var FrontPersonCreateGetWithErrorMessage = await _client.PostProtectedAsync<FrontPersonCreateGetWithErrorMessages>($"{_baseUrl}api/FrontPerson/Create", Person, token);
            if (FrontPersonCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPerson/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = FrontPersonCreateGetWithErrorMessage.ErrorMessages;
                return View(FrontPersonCreateGetWithErrorMessage.Person);
            }


            return RedirectToAction("Index", "Front");

        }
    }

}
