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
    public class PageSectionConditionController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<PageSectionConditionCreateGet>($"{_baseUrl}api/PageSectionCondition/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionCondition/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(PageSectionConditionCreateGet PageSectionCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PageSectionConditionCreateGet>($"{_baseUrl}api/PageSectionCondition/Create", PageSectionCondition, token);

            return RedirectToAction("Index", new { id = PageSectionCondition.PageSectionId });
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<PageSectionConditionIndexGet>>($"{_baseUrl}api/PageSectionCondition/Index/" +id,token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionCondition/Index", token);
            ViewBag.UITerms = x;
            ViewBag.Id = id;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<PageSectionConditionUpdateGet>($"{_baseUrl}api/PageSectionCondition/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionCondition/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(PageSectionConditionUpdateGet PageSectionCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PageSectionUpdateGet>($"{_baseUrl}api/PageSectionCondition/Update", PageSectionCondition, token);

            return RedirectToAction("Index", new { id = PageSectionCondition.PageSectionId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<PageSectionConditionDeleteGet>($"{_baseUrl}api/PageSectionCondition/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionCondition/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(PageSectionConditionDeleteGet PageSectionCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PageSectionConditionDeleteGet>($"{_baseUrl}api/PageSectionCondition/Delete", PageSectionCondition, token);

            return RedirectToAction("Index", new { id = PageSectionCondition.PageSectionId });
        }
        [HttpGet]
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<PageSectionLanguageIndexGet>>($"{_baseUrl}api/PageSection/LanguageIndex/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSection/LanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<PageSectionLanguageIndexGet>($"{_baseUrl}api/PageSection/LanguageUpdate/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSection/LanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }


    }
}