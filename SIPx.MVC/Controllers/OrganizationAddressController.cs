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
    public class OrganizationAddressController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<OrganizationAddressCreateGet>($"{_baseUrl}api/OrganizationAddress/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationAddress/Create", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Create(OrganizationAddressCreateGet OrganizationAddress)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<OrganizationAddressCreateGet>($"{_baseUrl}api/OrganizationAddress/Create", OrganizationAddress, token);

            return RedirectToAction("Index", new { id = OrganizationAddress.OrganizationId });
        }

        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<List<OrganizationAddressIndexGet>>($"{_baseUrl}api/OrganizationAddress/Index/" +id,token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationAddress/Index", token);
            ViewBag.UITerms = x;
            ViewBag.Id = id;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<OrganizationAddressUpdateGet>($"{_baseUrl}api/OrganizationAddress/Update/" + id, token);
            var CountryList = await _client.GetProtectedAsync<List<CountryList>>($"{_baseUrl}api/Country/List", token);
            response.Countries = CountryList;
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationAddress/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(OrganizationAddressUpdateGet OrganizationAddress)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<OrganizationAddressUpdateGet>($"{_baseUrl}api/OrganizationAddress/Update", OrganizationAddress, token);

            return RedirectToAction("Index/"+OrganizationAddress.OrganizationId);
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await _client.GetProtectedAsync<OrganizationAddressDeleteGet>($"{_baseUrl}api/OrganizationAddress/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationAddress/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(OrganizationAddressDeleteGet Page)
        {
            var token = HttpContext.Session.GetString("Token");
            await _client.PostProtectedAsync<OrganizationAddressDeleteGet>($"{_baseUrl}api/OrganizationAddress/Delete", Page, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }


    }
}