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
    public class UserMenuTemplateOptionController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<UserMenuTemplateOptionIndexGet>>($"{_baseUrl}api/UserMenuTemplateOption/Index/"+id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/Index", token);
            ViewBag.UITerms = UITerms;
            ViewBag.Id = id;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<UserMenuTemplateOptionCreateGet>($"{_baseUrl}api/UserMenuTemplateOption/Create/", token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(UserMenuTemplateOptionCreateGet UserMenuTemplateOption)
        {
            var token = HttpContext.Session.GetString("Token");
            await client.PostProtectedAsync<UserMenuTemplateOptionCreateGet>($"{_baseUrl}api/UserMenuTemplateOption/Create", UserMenuTemplateOption, token);

            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<UserMenuTemplateOptionUpdateGet>($"{_baseUrl}api/UserMenuTemplateOption/Update/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/Edit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<UserMenuTemplateOptionLanguageIndexGet>>($"{_baseUrl}api/UserMenuTemplateOption/LanguageIndex/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/LanguageIndex", token);
            ViewBag.UITerms = UITerms;
            ViewBag.Id = id;
            return View(response);

        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<UserMenuTemplateOptionLanguageIndexGet>($"{_baseUrl}api/UserMenuTemplateOption/LanguageUpdate/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/LanguageEdit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> LanguageCreate(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/UserMenuTemplateOption/LanguageCreate/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/LanguageCreate", token);
            ViewBag.UITerms = UITerms;
            response.ObjectId = id;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> LanguageCreate(ObjectLanguageCreateGet UserMenuTemplateOptionLanguage)
        {

            var token = HttpContext.Session.GetString("Token");
            await client.PostProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/UserMenuTemplateOption/LanguageCreate", UserMenuTemplateOptionLanguage, token);

            return RedirectToAction("LanguageIndex", new { id = UserMenuTemplateOptionLanguage.ObjectId });
        }
    }
}