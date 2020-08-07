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
    public class UserMenuTemplateController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<UserMenuTemplateIndexGet>>($"{_baseUrl}api/UserMenuTemplate/Index", token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplate/Index", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<UserMenuTemplateCreateGet>($"{_baseUrl}api/UserMenuTemplate/Create/", token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplate/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(UserMenuTemplateCreateGet UserMenuTemplate)
        {
            var token = HttpContext.Session.GetString("Token");
            await client.PostProtectedAsync<UserMenuTemplateCreateGet>($"{_baseUrl}api/UserMenuTemplate/Create", UserMenuTemplate, token);

            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<UserMenuTemplateUpdateGet>($"{_baseUrl}api/UserMenuTemplate/Update/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplate/Edit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<UserMenuTemplateLanguageIndexGet>>($"{_baseUrl}api/UserMenuTemplate/LanguageIndex/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplate/LanguageIndex", token);
            ViewBag.UITerms = UITerms;
            ViewBag.Id = id;
            return View(response);

        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<UserMenuTemplateLanguageIndexGet>($"{_baseUrl}api/UserMenuTemplate/LanguageUpdate/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplate/LanguageEdit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> LanguageCreate(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/UserMenuTemplate/LanguageCreate/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplate/LanguageCreate", token);
            ViewBag.UITerms = UITerms;
            response.ObjectId = id;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> LanguageCreate(ObjectLanguageCreateGet UserMenuTemplateLanguage)
        {

            var token = HttpContext.Session.GetString("Token");
            await client.PostProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/UserMenuTemplate/LanguageCreate", UserMenuTemplateLanguage, token);

            return RedirectToAction("LanguageIndex", new { id = UserMenuTemplateLanguage.ObjectId });
        }
    }
}