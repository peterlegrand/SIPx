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
    public class FrontOrganizationController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> AdvancedSearch()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<OrganizationAdvancedSearchPost>($"{_baseUrl}api/FrontOrganization/AdvancedSearch/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganization/AdvancedSearch", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> AdvancedSearch(FrontOrganizationAdvancedSearchGet SearchData)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var result = await _client.PostProtectedAsync<List<OrganizationAdvancedSearchResult>>($"{_baseUrl}api/FrontOrganization/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganization/SearchResult", token);
            ViewBag.UITerms = UITerms;
            return View("SearchResult", result);
        }
        [HttpGet]
        public async Task<IActionResult> Dashboard(int Id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<FrontOrganizationDashboard>($"{_baseUrl}api/FrontOrganization/Dashboard/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganization/Dashboard", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create(int Id=0)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<FrontOrganizationCreateGet>($"{_baseUrl}api/FrontOrganization/Create/"+Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganization/Create", token);
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
        public async Task<IActionResult> Create(FrontOrganizationCreateGet Organization)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<FrontOrganizationCreateGet>($"{_baseUrl}api/FrontOrganization/Create", Organization, token);

            return RedirectToAction("AdvancedSearch");
        }
        [HttpGet]
        public async Task<IActionResult> QuickSearch([FromQuery(Name = "Search")] string Search)
        {
            var SearchData = new FrontOrganizationAdvancedSearchGet
            {
                OrganizationName = Search
            };
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var result = await _client.PostProtectedAsync<FrontOrganizationAdvancedSearchGet>($"{_baseUrl}api/FrontOrganization/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganization/SearchResult", token);
            ViewBag.UITerms = UITerms;
            return View("SearchResult", result);
        }

    }

}
