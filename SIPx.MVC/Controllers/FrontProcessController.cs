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
    public class FrontProcessController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> New()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<NewProcessShowTemplateGroup>>($"{_baseUrl}api/FrontProcess/New", token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Index", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
   }
}