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
    public class PersonAddressController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient client = new ServiceClient();
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<PersonAddressIndexGet>>($"{_baseUrl}api/PersonAddress/Index/"+id,token);
           var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonAddress/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<PersonAddressUpdateGet>($"{_baseUrl}api/PersonAddress/Update/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonAddress/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
    }
}