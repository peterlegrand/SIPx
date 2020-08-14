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
    public class RoleGroupController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<RoleGroupIndexGet>>($"{_baseUrl}api/RoleGroup/Index",token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleGroup/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<RoleGroupUpdateGet>($"{_baseUrl}api/RoleGroup/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleGroup/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<RoleGroupCreateGet>($"{_baseUrl}api/RoleGroup/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleGroup/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(RoleGroupCreateGet RoleGroup)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<RoleGroupCreateGet>($"{_baseUrl}api/RoleGroup/Create", RoleGroup, token);

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<RoleGroupLanguageIndexGet>>($"{_baseUrl}api/RoleGroup/LanguageIndex/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleGroup/LanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<RoleGroupLanguageIndexGet>($"{_baseUrl}api/RoleGroup/LanguageUpdate/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleGroup/LanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }

    }
}