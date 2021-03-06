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
    public class ProjectMatrixTypeController : Controller
    {

        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        public ProjectMatrixTypeController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }

        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }

            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectMatrixType/Create", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;

            var response = await _client.GetProtectedAsync2<ProjectMatrixTypeCreateGet>($"{_configuration["APIUrl"]}api/ProjectMatrixType/Create/", token);
            var ErrorMessage = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessage;
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
        public async Task<IActionResult> Create(ProjectMatrixTypeCreateGet ProjectMatrixType)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ProjectMatrixTypeCreateGetWithErrorMessage = await _client.PostProtectedAsync<ProjectMatrixTypeCreateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/ProjectMatrixType/Create", ProjectMatrixType, token);
            if (ProjectMatrixTypeCreateGetWithErrorMessage.ErrorMessages.Count>0)
            {
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectMatrixType/Create", token);
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.Env = _hostingEnv.EnvironmentName;

                ViewBag.ErrorMessages = ProjectMatrixTypeCreateGetWithErrorMessage.ErrorMessages;
                return View(ProjectMatrixTypeCreateGetWithErrorMessage.ProjectMatrixType);
            }
            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<ProjectMatrixTypeIndexGet>>($"{_configuration["APIUrl"]}api/ProjectMatrixType/Index", token);

            var x = new LogParameters() { ActionName = "Index", ControllerName = "ProjectMatrixType", IsIntRecordId = true, IntRecordId = 0, StringRecordId = "" };
            ViewBag.ReadLogView = await _client.PostProtectedAsync<List<ReadLogGet>>($"{_configuration["APIUrl"]}api/Log/ReadLogView", x, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectMatrixType/Index", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;

            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Menu", "Admin");
            }
        }

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProjectMatrixTypeUpdateGet>($"{_configuration["APIUrl"]}api/ProjectMatrixType/Update/" + id, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectMatrixType/Edit", token);
            var x = new LogParameters() { ActionName = "Edit", ControllerName = "ProjectMatrixType", IsIntRecordId = true, IntRecordId = id, StringRecordId = "" };
            ViewBag.ReadLogView = await _client.PostProtectedAsync<List<ReadLogGet>>($"{_configuration["APIUrl"]}api/Log/ReadLogView" ,x, token);
            ViewBag.ChangeLogView = await _client.PostProtectedAsync<List<ChangeLogGet>>($"{_configuration["APIUrl"]}api/Log/ChangeLogView", x, token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;
            ViewBag.ErrorMessages = new List<ErrorMessage>();
            var tool = new
            {
                tooltipText = "Multiple Image upload",
                template = "<button type='button' class='e-tbar-btn e-btn' tabindex='-1' id='custom_tbar'  style='width:100%'><div class='e-tbar-btn-text rtecustomtool' style='font-weight: 500;'>Multiple upload</div></button>" 
            };

            ViewBag.items = new object[] { "Bold", "Italic", "Underline","Formats", "Alignments", "OrderedList", "UnorderedList",
                 "Image", "|", tool, "SourceCode", "Undo", "Redo" };
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
        public async Task<ActionResult> SaveFile(IList<IFormFile> UploadFiles)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }

            if (UploadFiles != null)
            {
                foreach (var file in UploadFiles)
                {
                   
                    string filename2 = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    string filename = _hostingEnv.WebRootPath + "\\images" + $@"\{filename2}";
                    if (!System.IO.File.Exists(filename))
                    {

                        using FileStream fs = System.IO.File.Create(filename);
                        await _client.PostProtectedAsyncImage<FileStream>($"{_configuration["APIUrl"]}api/Image/UploadFile", fs, token, filename2);


                        file.CopyTo(fs);
                        fs.Flush();
                    }
                    else
                    {
                        Response.Clear();
                        Response.StatusCode = 204;
                        Response.HttpContext.Features.Get<IHttpResponseFeature>().ReasonPhrase = "File already exists.";
                    }
                }
            }
            return Content("");
        }

        [HttpPost]
        public async Task<IActionResult> Edit(ProjectMatrixTypeUpdateGet ProjectMatrixType)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ProjectMatrixTypeUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ProjectMatrixTypeUpdateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/ProjectMatrixType/Update", ProjectMatrixType, token);
            if (ProjectMatrixTypeUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectMatrixType/Edit", token);
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.ErrorMessages = ProjectMatrixTypeUpdateGetWithErrorMessage.ErrorMessages;
                ViewBag.Env = _hostingEnv.EnvironmentName;
                return View(ProjectMatrixTypeUpdateGetWithErrorMessage.ProjectMatrixType);
            }
            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProjectMatrixTypeDeleteGet>($"{_configuration["APIUrl"]}api/ProjectMatrixType/Delete/" + id, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectMatrixType/Delete", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.ErrorMessages = new List<ErrorMessage>();
            ViewBag.Env = _hostingEnv.EnvironmentName;
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
        public async Task<IActionResult> Delete(ProjectMatrixTypeDeleteGet Page)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProjectMatrixTypeDeleteGet>($"{_configuration["APIUrl"]}api/ProjectMatrixType/Delete", Page, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }
    }
}