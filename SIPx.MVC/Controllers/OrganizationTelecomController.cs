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
    public class OrganizationTelecomController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient client = new ServiceClient();
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<OrganizationTelecomIndexGet>>($"{_baseUrl}api/OrganizationTelecom/Index/" + id, token);
           var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationTelecom/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<OrganizationTelecomUpdateGet>($"{_baseUrl}api/OrganizationTelecom/Update/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationTelecom/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<OrganizationTelecomCreateGet>($"{_baseUrl}api/OrganizationTelecom/Create/"+Id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationTelecom/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(OrganizationTelecomCreateGet OrganizationTelecom)
        {
            var token = HttpContext.Session.GetString("Token");
            await client.PostProtectedAsync<OrganizationTelecomCreateGet>($"{_baseUrl}api/OrganizationTelecom/Create", OrganizationTelecom, token);

            return RedirectToAction("Index", new { id = OrganizationTelecom.OrganizationId });
        }

    }
}