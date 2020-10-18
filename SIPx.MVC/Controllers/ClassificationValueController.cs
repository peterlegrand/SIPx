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
    public class ClassificationValueController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id, int ParentId = 0)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            ClassificationValueCreateGet response = new ClassificationValueCreateGet();
            if (ParentId == 0)
            {
                response = await _client.GetProtectedAsync<ClassificationValueCreateGet>($"{_baseUrl}api/ClassificationValue/Create/" + Id, token);
            }
            else
            {
                response = await _client.GetProtectedAsync<ClassificationValueCreateGet>($"{_baseUrl}api/ClassificationValue/Create/" + Id + "?ParentId=" + ParentId, token);
            }
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(ClassificationValueCreateGet ClassificationValue)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ClassificationValueCreateGet>($"{_baseUrl}api/ClassificationValue/Create", ClassificationValue, token);

            return RedirectToAction("Index", new { id = ClassificationValue.ClassificationId });
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ClassificationValueIndexGet>>($"{_baseUrl}api/ClassificationValue/Index/" + id,token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/Index", token);
            ViewBag.UITerms = x;
            ViewBag.Id = id;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ClassificationValueUpdateGet>($"{_baseUrl}api/ClassificationValue/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/Edit", token);
            ViewBag.UITerms = x;
            ViewBag.Id = id;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(ClassificationValueUpdateGet ClassificationValue)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ClassificationValueUpdateGet>($"{_baseUrl}api/ClassificationValue/Update", ClassificationValue, token);

            return RedirectToAction("Index", new { id = ClassificationValue.ClassificationId });
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ClassificationValueDeleteGet>($"{_baseUrl}api/ClassificationValue/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(ClassificationValueDeleteGet ClassificationValue)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ClassificationValueDeleteGet>($"{_baseUrl}api/ClassificationValue/Delete", ClassificationValue, token);

            return RedirectToAction("Index", new { id = ClassificationValue.ClassificationId});
           
        }

        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ClassificationValueLanguageIndexGet>>($"{_baseUrl}api/ClassificationValue/LanguageIndex/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/LanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }

        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ClassificationValueLanguageIndexGet>($"{_baseUrl}api/ClassificationValue/LanguageUpdate/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/LanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
    }
}