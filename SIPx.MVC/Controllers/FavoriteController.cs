﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SIPx.CallAPI;
using SIPx.Shared;



namespace SIPx.MVC.Controllers
{
    public class FavoriteController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        public FavoriteController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }

        
        [HttpPost]
        public async Task<IActionResult> Add(FavoritesAdd Favorite)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            Favorite = await _client.PostProtectedAsync<FavoritesAdd>($"{_baseUrl}api/Favorite/Add", Favorite, token);
            //if (ClassificationCreateGetWithErrorMessage.ErrorMessages.Count>0)
            //{
//                var UITerms = await _client.GetProtectedAsync<List<FavoritesAdd>>($"{_baseUrl}api/MVC/Favorite/Add", token);
            //ViewBag.UITerms = UITerms;
            //ViewBag.ErrorMessages = ClassificationCreateGetWithErrorMessage.ErrorMessages;
            //return View(ClassificationCreateGetWithErrorMessage.Classification);
            return Ok(Favorite);
        }
    }
}