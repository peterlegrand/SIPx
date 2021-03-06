﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SIPx.Shared;

namespace SIPx.MVC.Controllers
{
    public class FrontAuthController : Controller
    {
        //public IActionResult Index()
        //{
        //    //PETER TODO Delete this including view
        //    ViewBag.Session = HttpContext.Session.GetString("Token");
        //    return View();
        //}
        [HttpGet]
        public IActionResult Login()
        {
            var model = new LoginViewModel() { Email = "eplegrand@gmail.com", Password = "Sip!2021" };
            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            HttpClient client = new HttpClient();

            var jsonData = JsonConvert.SerializeObject(model);

            var content = new StringContent(jsonData, Encoding.UTF8, "application/json");

            var response = await client.PostAsync("https://localhost:44393/api/auth/login", content);

            var responseBody = await response.Content.ReadAsStringAsync();

            var responseObject = JsonConvert.DeserializeObject<UserManagerResponse>(responseBody);

            if (responseObject.IsSuccess)
            {
                HttpContext.Session.SetString("Token", responseObject.Message);
                return RedirectToAction("Index", "Front");
            }
            else
            {
                return RedirectToAction(  "Index");
                    }
        }
    }
}