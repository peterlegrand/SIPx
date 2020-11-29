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
    public class ClassificationValuePropertyController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> CreateProperty(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ClassificationValuePropertyCreateGet>($"{_baseUrl}api/ClassificationValueProperty/CreateProperty/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValueProperty/CreateProperty", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> CreateProperty(ClassificationValuePropertyCreateGet ClassificationValueProperty)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            await _client.PostProtectedAsync<ClassificationValuePropertyCreateGet>($"{_baseUrl}api/ClassificationValueProperty/Create", ClassificationValueProperty, token);
            ViewBag.ClassificationValueProperty = ClassificationValueProperty;
            return RedirectToAction("Create");
        }
        [HttpPost]
        public async Task<IActionResult> Create(ClassificationValuePropertyCreateGet ClassificationValueProperty)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            await _client.PostProtectedAsync<ClassificationValuePropertyCreateGet>($"{_baseUrl}api/ClassificationValueProperty/Create", ClassificationValueProperty, token);

            return RedirectToAction("Index", new { id = ClassificationValueProperty.ClassificationId });
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ClassificationValuePropertyIndexGet>>($"{_baseUrl}api/ClassificationValueProperty/Index/" + id,token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValueProperty/Index", token);
            ViewBag.UITerms = x;
            ViewBag.Id = id;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ClassificationValuePropertyUpdateGet>($"{_baseUrl}api/ClassificationValueProperty/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValueProperty/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(ClassificationValuePropertyUpdateGet ClassificationValueProperty)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ClassificationValuePropertyUpdateGet>($"{_baseUrl}api/ClassificationValueProperty/Update", ClassificationValueProperty, token);

            return RedirectToAction("Index", new { id = ClassificationValueProperty.ClassificationValueId });
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ClassificationValuePropertyDeleteGet>($"{_baseUrl}api/ClassificationValueProperty/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValueProperty/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(ClassificationValuePropertyDeleteGet ClassificationValueProperty)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ClassificationValuePropertyDeleteGet>($"{_baseUrl}api/ClassificationValueProperty/Delete", ClassificationValueProperty, token);

            return RedirectToAction("Index", new { id = ClassificationValueProperty.ClassificationValueId });
        }

    }
}