﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SIPx.CallAPI;
using SIPx.Shared;

namespace SIPx.MVC.Controllers
{
    public class ProcessTemplateGroupController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTemplateGroupCreateGet>($"{_baseUrl}api/ProcessTemplateGroup/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateGroup/Create", token);
            ViewBag.UITerms = UITerms;
            var x = new List<ErrorMessage>();
            ViewBag.ErrorMessages = x;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Menu", "Admin");
            }
        }
        [HttpPost]
        public async Task<IActionResult> Create(ProcessTemplateGroupCreateGet ProcessTemplateGroup)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateGroupCreateGet>($"{_baseUrl}api/ProcessTemplateGroup/Create", ProcessTemplateGroup, token);

            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ProcessTemplateGroupIndexGet>>($"{_baseUrl}api/ProcessTemplateGroup/Index",token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateGroup/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ProcessTemplateGroupUpdateGet>($"{_baseUrl}api/ProcessTemplateGroup/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateGroup/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(ProcessTemplateGroupUpdateGet ProcessTemplateGroup)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateGroupUpdateGet>($"{_baseUrl}api/ProcessTemplateGroup/Update", ProcessTemplateGroup, token);

            return RedirectToAction("Index");
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ProcessTemplateGroupDeleteGet>($"{_baseUrl}api/ProcessTemplateGroup/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateGroup/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(ProcessTemplateGroupDeleteGet Page)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateGroupDeleteGet>($"{_baseUrl}api/ProcessTemplateGroup/Delete", Page, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ProcessTemplateGroupLanguageIndexGet>>($"{_baseUrl}api/ProcessTemplateGroup/LanguageIndex/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateGroup/LanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ProcessTemplateGroupLanguageIndexGet>($"{_baseUrl}api/ProcessTemplateGroup/LanguageUpdate/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateGroup/LanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }


    }
}