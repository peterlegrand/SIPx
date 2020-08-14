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
    public class ProjectController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<ProjectIndexGet>>($"{_baseUrl}api/Project/Index",token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Project/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ProjectUpdateGet>($"{_baseUrl}api/Project/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Project/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ProjectCreateGet>($"{_baseUrl}api/Project/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Project/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(ProjectCreateGet Project)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<ProjectCreateGet>($"{_baseUrl}api/Project/Create", Project, token);

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<ProjectLanguageIndexGet>>($"{_baseUrl}api/Project/LanguageIndex/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Project/LanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ProjectLanguageIndexGet>($"{_baseUrl}api/Project/LanguageUpdate/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Project/LanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }

    }
}