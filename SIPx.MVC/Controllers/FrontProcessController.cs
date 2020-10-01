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
            var response = await _client.GetProtectedAsync<List<NewProcessShowTemplateGroup>>($"{_baseUrl}api/FrontProcess/Template", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Index", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> ToDo()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<List<FrontProcessToDo>>($"{_baseUrl}api/FrontProcess/ToDo", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Index", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<FrontProcessNewProcessWithMaster>($"{_baseUrl}api/FrontProcess/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);

        }
        [HttpPost]
        public async Task<IActionResult> Create(FrontProcessNewProcessWithMaster Fields, string submit)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var x = await _client.PostProtectedAsync<FrontProcessNewProcessWithMaster>($"{_baseUrl}api/FrontProcess/Create", Fields, token);
            //if()
            //            var response = await _client.GetProtectedAsync<NewProcessWithMaster>($"{_baseUrl}api/FrontProcess/New/" , token);
            //          var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/New", token);
            //        ViewBag.UITerms = UITerms;
            //      return View(response);
            
            //PETER TODO if an error from API
            //if(x.ProcessTemplateId == 0)
            //{ return View(Fields);
            //}
            return RedirectToAction("Templates");

            //PETER TODO Add the button pressed to the pass

        }
        public async Task<IActionResult> Edit(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<FrontProcessUpdateGet>($"{_baseUrl}api/FrontProcess/Update/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/Edit", token);
            ViewBag.UITerms = UITerms;
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
            var response = await _client.GetProtectedAsync<FrontProcessView>($"{_baseUrl}api/FrontProcess/ViewGet/" + Id, token);
            //var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/New", token);
           // ViewBag.UITerms = UITerms;
            return View(response);

        }
        [HttpGet]
        public async Task<IActionResult> AdvancedSearch()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<ProcessAdvancedSearchPost>($"{_baseUrl}api/FrontProcess/AdvancedSearch/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/AdvancedSearch", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> AdvancedSearch(ProcessAdvancedSearchPost SearchData)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var result = await _client.PostProtectedAsync<List<ProcessAdvancedSearchResult>>($"{_baseUrl}api/FrontProcess/AdvancedSearch", SearchData, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProcess/SearchResult", token);
            ViewBag.UITerms = UITerms;
            return View("SearchResult", result);
        }

    }
}