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
    public class PageController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<PageIndexGet>>($"{_baseUrl}api/Page/Index",token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Page/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<PageUpdateGet>($"{_baseUrl}api/Page/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Page/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<PageCreateGet>($"{_baseUrl}api/Page/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Page/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(PageCreateGet Page)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<PageCreateGet>($"{_baseUrl}api/Page/Create", Page, token);

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<PageLanguageIndexGet>>($"{_baseUrl}api/Page/LanguageIndex/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Page/LanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<PageLanguageIndexGet>($"{_baseUrl}api/Page/LanguageUpdate/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Page/LanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
    }
}