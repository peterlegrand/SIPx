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
    public class PersonRelationTypeController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<PersonRelationTypeIndexGet>>($"{_baseUrl}api/PersonRelationType/Index/" + id,token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonRelationType/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<PersonRelationTypeUpdateGet>($"{_baseUrl}api/PersonRelationType/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonRelationType/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<PersonRelationTypeCreateGet>($"{_baseUrl}api/PersonRelationType/Create/" +Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonRelationType/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(PersonRelationTypeCreateGet PersonRelationType)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<PersonRelationTypeCreateGet>($"{_baseUrl}api/PersonTelecom/Create", PersonRelationType, token);

            return RedirectToAction("Index");
        }

    }
}