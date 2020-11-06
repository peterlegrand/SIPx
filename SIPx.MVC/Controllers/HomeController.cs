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
    public class HomeController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var response = await _client.GetAsync<FrontIndexGetDashboard>($"{_baseUrl}api/Home/Index/");
            var UITerms = await _client.GetAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Home/Index");
            ViewBag.UITerms = UITerms;
            return View(response);
        }
    }
}
