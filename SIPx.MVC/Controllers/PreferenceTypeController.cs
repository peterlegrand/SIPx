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
    public class PreferenceTypeController : Controller
    {
////        private readonly string _baseUrl = "https://localhost:44393/";
  ////      readonly ServiceClient _client = new ServiceClient();
        //public async Task<IActionResult> Index()
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    var response = await _client.GetProtectedAsync<List<PreferenceTypeUpdateGet>>($"{_baseUrl}api/PreferenceType/Index",token);
        //   var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PreferenceType/Index", token);
        //    
        //    return View(response);
        //    //return View();
        //}
        //
        //[HttpGet]
        //public async Task<IActionResult> Edit(int id)
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    var response = await _client.GetProtectedAsync<PreferenceTypeUpdateGet>($"{_baseUrl}api/PreferenceType/Update/" + id, token);
        //    var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PreferenceType/Edit", token);
        //    
        //    return View(response);
        //}
    }
}