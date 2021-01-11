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
    public class SearchController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();

        //[HttpGet]
        //public async Task<IActionResult> General()
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    var response = await _client.GetProtectedAsync<ClassificationCreateGet>($"{_baseUrl}api/Classification/Create/", token);
        //    var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Create", token);
        //    
        //    return View(response);
        //}

        [HttpPost]
        public async Task<IActionResult> General(string Search)
        {

            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync<SearchGlobalPost>($"{_baseUrl}api/Search/Global/"+Search, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Search/Global", token);
            
            return View(response);


            //var x = new ClassificationUpdateGet();
            //x.Name = Search;
            //var token = HttpContext.Session.GetString("Token");
            //return View(x);
        }
    }
}