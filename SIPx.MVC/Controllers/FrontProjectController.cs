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
    public class FrontProjectController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Dashboard(int Id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<FrontProjectIndexGet>($"{_baseUrl}api/FrontProject/Index/"+Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontProject/Index", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
   
    [HttpGet]
    public async Task<IActionResult> Create()
    {
        var token = HttpContext.Session.GetString("Token");
        var response = await _client.GetProtectedAsync<ProjectCreateGet>($"{_baseUrl}api/Project/Create/", token);
        var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Project/Create", token);
        ViewBag.UITerms = UITerms;
        return View(response);
    }
    [HttpPost]
    public async Task<IActionResult> Create(ProjectCreateGet Project)
    {
        var token = HttpContext.Session.GetString("Token");
        await _client.PostProtectedAsync<ProjectCreateGet>($"{_baseUrl}api/Project/Create", Project, token);

        return RedirectToAction("Index");
        }
    }
}
