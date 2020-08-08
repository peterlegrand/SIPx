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
    public class UserMenuController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<UserMenuIndexGet>>($"{_baseUrl}api/UserMenu/Index", token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenu/Index", token);
            ViewBag.UITerms = UITerms;
            ViewBag.Id = id;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<UserMenuCreateGet>($"{_baseUrl}api/UserMenu/Create/"+id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenu/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(UserMenuCreateGet UserMenu)
        {
            var token = HttpContext.Session.GetString("Token");
            await client.PostProtectedAsync<UserMenuCreateGet>($"{_baseUrl}api/UserMenu/Create", UserMenu, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<UserMenuUpdateGet>($"{_baseUrl}api/UserMenu/Update/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenu/Edit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
    }
}