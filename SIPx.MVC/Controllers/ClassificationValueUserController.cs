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
    public class ClassificationValueUserController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";

        ServiceClient client = new ServiceClient();
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<ClassificationValueUserEditGet>>($"{_baseUrl}api/ClassificationRelationValueUser/Index" + id,token);
           var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationRelationValueUser/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<ClassificationValueUserEditGet>($"{_baseUrl}api/ClassificationValueUser/Edit/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationRelationValueUser/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
    }
}