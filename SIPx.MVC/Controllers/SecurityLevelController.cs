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
    public class SecurityLevelController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        //public async Task<IActionResult> Index()
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    var response = await _client.GetProtectedAsync<List<SecurityLevelIndexGet>>($"{_baseUrl}api/SecurityLevel/Index",token);
        //   var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/SecurityLevel/Index", token);
        //    ViewBag.UITerms = x;
        //    return View(response);
        //    //return View();
        //}
        ////PETER TODO Check for objectViewGet to be replaced by editget
        //[HttpGet]
        //public async Task<IActionResult> Edit(int id)
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    var response = await _client.GetProtectedAsync<SecurityLevelUpdateGet>($"{_baseUrl}api/SecurityLevel/Update/" + id, token);
        //    var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/SecurityLevel/Edit", token);
        //    ViewBag.UITerms = x;
        //    return View(response);
        //}
    }
}