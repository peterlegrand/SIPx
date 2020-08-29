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
    public class ProcessTemplateStageTypeController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ProcessTemplateStageTypeCreateGet>($"{_baseUrl}api/ProcessTemplateStageType/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateStageType/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(ProcessTemplateStageTypeCreateGet ProcessTemplateStageType)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<ProcessTemplateStageTypeCreateGet>($"{_baseUrl}api/ProcessTemplateStageType/Create", ProcessTemplateStageType, token);

            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<ProcessTemplateStageTypeIndexGet>>($"{_baseUrl}api/ProcessTemplateStageType/Index",token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateStageType/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ProcessTemplateStageTypeUpdateGet>($"{_baseUrl}api/ProcessTemplateStageType/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateStageType/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(ProcessTemplateStageTypeUpdateGet ProcessTemplateStageType)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<ProcessTemplateStageTypeUpdateGet>($"{_baseUrl}api/ProcessTemplateStageType/Update", ProcessTemplateStageType, token);

            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ProcessTemplateStageTypeDeleteGet>($"{_baseUrl}api/ProcessTemplateStageType/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateStageType/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(ProcessTemplateStageTypeDeleteGet Page)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<ProcessTemplateStageTypeDeleteGet>($"{_baseUrl}api/ProcessTemplateStageType/Delete", Page, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<ProcessTemplateStageTypeLanguageIndexGet>>($"{_baseUrl}api/ProcessTemplateStageType/LanguageIndex/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateStageType/LanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ProcessTemplateStageTypeLanguageIndexGet>($"{_baseUrl}api/ProcessTemplateStageType/LanguageUpdate/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateStageType/LanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }


    }
}