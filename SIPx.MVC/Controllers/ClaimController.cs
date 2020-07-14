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
    public class ClaimController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";

        ServiceClient client = new ServiceClient();

        //[HttpGet("Index")]
        //public async Task<IActionResult> Edit(int id)
        //{
        //    var token = HttpContext.Session.GetString("Token");
        //    var response = await client.GetProtectedAsync<ClaimIndexGet>($"{_baseUrl}api/Claim/Update/" + id, token);
        //    var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/Claim/Edit", token);
        //    ViewBag.UITerms = x;
        //    return View(response);
        //}
    }
}