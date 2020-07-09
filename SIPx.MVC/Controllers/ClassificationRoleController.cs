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
    public class ClassificationRoleController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";

        ServiceClient client = new ServiceClient();
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<ClassificationRoleUpdateGet>>($"{_baseUrl}api/ClassificationRelationRole/Index" + id,token);
           var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationRelationRole/Index", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<ClassificationRoleUpdateGet>($"{_baseUrl}api/ClassificationRole/Edit/" + id, token);
            var x = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/ClassificationRelationRole/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
    }
}