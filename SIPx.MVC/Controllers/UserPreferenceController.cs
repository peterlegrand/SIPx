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
    public class UserPreferenceController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient client = new ServiceClient();
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<UserPreferenceIndexGet>>($"{_baseUrl}api/UserPreference/Index/" ,token);
           var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserPreference/Index", token);
            ViewBag.UITerms = x;
            return View(response);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<UserPreferenceUpdateGet>($"{_baseUrl}api/UserPreference/Update/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserPreference/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(UserPreferenceUpdateGet UserPreference)
        {
            var token = HttpContext.Session.GetString("Token");
            await client.PostProtectedAsync<UserPreferenceUpdateGet>($"{_baseUrl}api/UserPreference/Update", UserPreference, token);

            return RedirectToAction("Index");
        }
    }
}