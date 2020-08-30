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
    public class LanguageController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<LanguageIndexGet>>($"{_baseUrl}api/Language/Index/" ,token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Language/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<OrganizationAddressUpdateGet>($"{_baseUrl}api/OrganizationAddress/Update/" + id, token);
            var CountryList = await _client.GetProtectedAsync<List<CountryList>>($"{_baseUrl}api/Country/List", token);
            response.Countries = CountryList;
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationAddress/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(LanguageUpdateGet Language)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<LanguageUpdateGet>($"{_baseUrl}api/Language/Update", Language, token);

            return RedirectToAction("Index");
        }
        //[HttpGet]
        //public async Task<IActionResult> Create(int Id)
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    var response = await _client.GetProtectedAsync<OrganizationAddressCreateGet>($"{_baseUrl}api/OrganizationAddress/Create/"+Id, token);
        //    var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationAddress/Create", token);
        //    ViewBag.UITerms = UITerms;
        //    return View(response);
        //}
        //[HttpPost]
        //public async Task<IActionResult> Create(OrganizationAddressCreateGet OrganizationAddress)
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    await _client.PostProtectedAsync<OrganizationAddressCreateGet>($"{_baseUrl}api/OrganizationAddress/Create", OrganizationAddress, token);

        //    return RedirectToAction("Index", new { id = OrganizationAddress.OrganizationId });
        //}

    }
}