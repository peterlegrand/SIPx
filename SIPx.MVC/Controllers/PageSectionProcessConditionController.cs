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
    public class PageSectionProcessConditionController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<PageSectionProcessConditionCreateGet>($"{_baseUrl}api/PageSectionProcessCondition/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionProcessCondition/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(PageSectionProcessConditionCreateGet PageSectionProcessCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PageSectionProcessConditionCreateGet>($"{_baseUrl}api/PageSectionProcessCondition/Create", PageSectionProcessCondition, token);

            return RedirectToAction("Index", new { id = PageSectionProcessCondition.PageSectionId });
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<PageSectionProcessConditionIndexGet>>($"{_baseUrl}api/PageSectionProcessCondition/Index/" +id,token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionProcessCondition/Index", token);
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
            var response = await _client.GetProtectedAsync<PageSectionProcessConditionUpdateGet>($"{_baseUrl}api/PageSectionProcessCondition/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionProcessCondition/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(PageSectionProcessConditionUpdateGet PageSectionProcessCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PageSectionUpdateGet>($"{_baseUrl}api/PageSectionProcessCondition/Update", PageSectionProcessCondition, token);

            return RedirectToAction("Index", new { id = PageSectionProcessCondition.PageSectionId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<PageSectionProcessConditionDeleteGet>($"{_baseUrl}api/PageSectionProcessCondition/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionProcessCondition/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(PageSectionProcessConditionDeleteGet PageSectionProcessCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PageSectionProcessConditionDeleteGet>($"{_baseUrl}api/PageSectionProcessCondition/Delete", PageSectionProcessCondition, token);

            return RedirectToAction("Index", new { id = PageSectionProcessCondition.PageSectionId });
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