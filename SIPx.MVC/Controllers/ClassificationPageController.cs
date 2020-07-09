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
    public class ClassificationPageController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient client = new ServiceClient();
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<ClassificationPageIndexGet>>($"{_baseUrl}api/ClassificationPage/Index/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationPage/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<ClassificationPageUpdateGet>($"{_baseUrl}api/ClassificationPage/Edit/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationPage/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        public async Task<IActionResult> SectionIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<ClassificationPageSectionIndexGet>>($"{_baseUrl}api/ClassificationPage/SectionIndex/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationPage/SectionIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> SectionEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<ClassificationPageSectionUpdateGet>($"{_baseUrl}api/ClassificationPage/SectionEdit/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationPage/SectionEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<ClassificationPageLanguageIndexGet>>($"{_baseUrl}api/ClassificationPage/LanguageIndex/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationPage/LanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<ClassificationPageLanguageIndexGet>($"{_baseUrl}api/ClassificationPage/LanguageEdit/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationPage/LanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        public async Task<IActionResult> SectionLanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<ClassificationPageSectionLanguageIndexGet>>($"{_baseUrl}api/ClassificationPage/SectionLanguageIndex/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationPage/SectionLanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> SectionLanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<ClassificationPageSectionLanguageIndexGet>($"{_baseUrl}api/ClassificationPage/SectionLanguageEdit/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationPage/SectionLanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
    }
}