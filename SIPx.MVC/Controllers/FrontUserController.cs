using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SIPx.CallAPI;
using SIPx.Shared;
using Syncfusion.EJ2.QueryBuilder;

namespace SIPx.MVC.Controllers
{
    public class FrontUserController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();


        //public async Task<IActionResult> Create()
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    var response = await _client.GetProtectedAsync<UserCreateGet>($"{_baseUrl}api/User/Create/", token);
        //    var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/User/Create", token);
        //    
        //    return View(response);
        //}
        //[HttpPost]
        //public async Task<IActionResult> Create(UserCreateGet User)
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    await _client.PostProtectedAsync<UserCreateGet>($"{_baseUrl}api/User/Create", User, token);

        //    return RedirectToAction("Index");
        //}

    }

}
