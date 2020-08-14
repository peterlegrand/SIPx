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
    public class ClassificationController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<ClassificationIndexGet>>($"{_baseUrl}api/Classification/Index", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Index", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ClassificationCreateGet>($"{_baseUrl}api/Classification/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(ClassificationCreateGet Classification)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<ClassificationCreateGet>($"{_baseUrl}api/Classification/Create", Classification, token);

            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ClassificationUpdateGet>($"{_baseUrl}api/Classification/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Edit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<ClassificationLanguageIndexGet>>($"{_baseUrl}api/Classification/LanguageIndex/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/LanguageIndex", token);
            ViewBag.UITerms = UITerms;
            ViewBag.Id = id;
            return View(response);

        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ClassificationLanguageIndexGet>($"{_baseUrl}api/Classification/LanguageUpdate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/LanguageEdit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> LanguageCreate(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/Classification/LanguageCreate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/LanguageCreate", token);
            ViewBag.UITerms = UITerms;
            response.ObjectId = id;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> LanguageCreate(ObjectLanguageCreateGet ClassificationLanguage)
        {

            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/Classification/LanguageCreate", ClassificationLanguage, token);

            return RedirectToAction("LanguageIndex", new { id = ClassificationLanguage.ObjectId });
        }
    }
}