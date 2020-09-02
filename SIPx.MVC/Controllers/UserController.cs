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
    public class UserController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<UserIndexGet>>($"{_baseUrl}api/User/Index",token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/User/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<UserUpdateGet>($"{_baseUrl}api/User/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/User/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<UserCreateGet>($"{_baseUrl}api/User/Create/", token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/User/Create", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(UserCreateGet User)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            await _client.PostProtectedAsync<UserCreateGet>($"{_baseUrl}api/User/Create", User, token);

            return RedirectToAction("Index");
        }
        [HttpPost]
        public async Task<IActionResult> Edit(UserUpdateGet User)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            await _client.PostProtectedAsync<UserUpdateGet>($"{_baseUrl}api/User/Update", User, token);

            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<UserDeleteGet>($"{_baseUrl}api/User/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/User/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(UserDeleteGet UserPerson)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            await _client.PostProtectedAsync<UserDeleteGet>($"{_baseUrl}api/User/Delete", UserPerson, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }
    }
}