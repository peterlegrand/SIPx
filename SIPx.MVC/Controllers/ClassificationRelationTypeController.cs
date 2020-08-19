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
    public class ClassificationRelationTypeController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ClassificationRelationTypeCreateGet>($"{_baseUrl}api/ClassificationRelationType/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationRelationType/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(ClassificationRelationTypeCreateGet ClassificationRelationType)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<ClassificationRelationTypeCreateGet>($"{_baseUrl}api/ClassificationRelationType/Create", ClassificationRelationType, token);

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<ClassificationRelationTypeIndexGet>>($"{_baseUrl}api/ClassificationRelationType/Index",token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationRelationType/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ClassificationRelationTypeUpdateGet>($"{_baseUrl}api/ClassificationRelationType/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationRelationType/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(ClassificationRelationTypeUpdateGet ClassificationRelationType)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<ClassificationRelationTypeUpdateGet>($"{_baseUrl}api/ClassificationRelationType/Update", ClassificationRelationType, token);

            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ClassificationRelationTypeDeleteGet>($"{_baseUrl}api/ClassificationRelationType/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationRelationType/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(ClassificationRelationTypeDeleteGet Page)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<ClassificationRelationTypeDeleteGet>($"{_baseUrl}api/ClassificationRelationType/Delete", Page, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }


        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<ClassificationRelationTypeLanguageIndexGet>>($"{_baseUrl}api/ClassificationRelation/LanguageIndex/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationRelation/LanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<ClassificationRelationTypeLanguageIndexGet>($"{_baseUrl}api/ClassificationRelation/LanguageUpdate/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationRelation/LanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
    }
}