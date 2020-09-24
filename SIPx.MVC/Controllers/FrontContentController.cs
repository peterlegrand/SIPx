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
    public class FrontContentController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> ContentType()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<FrontContentContentTypeGroup>>($"{_baseUrl}api/FrontContent/ContentType", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/ContentType", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> ContentNew(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<FrontContentContentNew>($"{_baseUrl}api/FrontContent/ContentNew/" + Id, token);
            //var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/ContentType", token);
            //   ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> ShowContent(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<FrontContentShowContent>($"{_baseUrl}api/FrontContent/ShowContent/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/ShowContent", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> ContentNew(FrontContentContentNew Content)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<FrontContentContentNew>($"{_baseUrl}api/FrontContent/ContentNew", Content, token);

            return RedirectToAction("Index", "Front");
        }
        [HttpGet]
        public async Task<IActionResult> AdvancedSearch()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<ContentAdvancedSearchPost>($"{_baseUrl}api/FrontContent/AdvancedSearch/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/AdvancedSearch", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> AdvancedSearch(ContentAdvancedSearchPost SearchData)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var result = await _client.PostProtectedAsync<List<ContentAdvancedSearchResult>>($"{_baseUrl}api/FrontContent/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontContent/SearchResult", token);
            ViewBag.UITerms = UITerms;
            return View("SearchResult", result);
        }


    }
}
