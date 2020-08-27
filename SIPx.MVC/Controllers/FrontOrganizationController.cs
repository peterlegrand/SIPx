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
        public async Task<IActionResult> Dashboard(int Id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<FrontOrganizationIndexGet>($"{_baseUrl}api/FrontOrganization/Index/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganization/Dashboard", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> AdvancedSearch()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<FrontOrganizationAdvancedSearchGet>($"{_baseUrl}api/FrontOrganization/AdvancedSearch/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganization/AdvancedSearch", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> AdvancedSearch(FrontOrganizationAdvancedSearchGet SearchData)
        {
            var token = HttpContext.Session.GetString("Token");
            var result = await _client.PostProtectedAsync<FrontOrganizationAdvancedSearchGet>($"{_baseUrl}api/FrontOrganization/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganization/SearchResult", token);
            ViewBag.UITerms = UITerms;
            return View("SearchResult", result);
        }

        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<OrganizationCreateGet>($"{_baseUrl}api/Organization/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Organization/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(OrganizationCreateGet Organization)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<OrganizationCreateGet>($"{_baseUrl}api/Organization/Create", Organization, token);

            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> QuickSearch([FromQuery(Name = "Search")] string Search)
        {
            var SearchData = new FrontOrganizationAdvancedSearchGet();
            SearchData.OrganizationName = Search;
            var token = HttpContext.Session.GetString("Token");
            var result = await _client.PostProtectedAsync<FrontOrganizationAdvancedSearchGet>($"{_baseUrl}api/FrontOrganization/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganization/SearchResult", token);
            ViewBag.UITerms = UITerms;
            return View("SearchResult", result);
        }

    }

}
