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
    public class PropertyController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        public PropertyController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }

        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PropertyCreateGet>($"{_baseUrl}api/Property/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Property/Create", token);
            ViewBag.UITerms = UITerms;
            if(response.Item2==true)
            { 
            return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Menu","Admin");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Create(PropertyCreateGet Property)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PropertyCreateGetWithErrorMessage = await _client.PostProtectedAsync<PropertyCreateGetWithErrorMessages>($"{_baseUrl}api/Property/Create", Property, token);
            if (PropertyCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Property/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PropertyCreateGetWithErrorMessage.ErrorMessages;
                return View(PropertyCreateGetWithErrorMessage.Property);
            }


            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<PropertyIndexGet>>($"{_baseUrl}api/Property/Index", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Property/Index", token);
            ViewBag.UITerms = UITerms;
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
            var response = await _client.GetProtectedAsync2<PropertyUpdateGet>($"{_baseUrl}api/Property/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Property/Edit", token);
            ViewBag.UITerms = UITerms;
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

//            string HtmlString = string.Empty;
            if (UploadFiles != null)
            {
                foreach (var file in UploadFiles)
                {
                    //Below is the code for Saving the image to Azure Blob Storage
                    //string blobstorageconnection = _configuration.GetValue<string>("blobstorage");
                    //byte[] dataFiles;
                    //CloudStorageAccount cloudStorageAccount = CloudStorageAccount.Parse(blobstorageconnection);
                    //CloudBlobClient cloudBlobClient = cloudStorageAccount.CreateCloudBlobClient();
                    //CloudBlobContainer cloudBlobContainer = cloudBlobClient.GetContainerReference("filescontainers");

                    //BlobContainerPermissions permissions = new BlobContainerPermissions
                    //{
                    //    PublicAccess = BlobContainerPublicAccessType.Blob
                    //};
                    //string systemFileName = file.FileName;
                    //cloudBlobContainer.SetPermissionsAsync(permissions);
                    //using (var target = new MemoryStream())
                    //{
                    //    file.CopyTo(target);
                    //    dataFiles = target.ToArray();
                    //}
                    string filename2 = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                    string filename = _hostingEnv.WebRootPath + "\\images" + $@"\{filename2}";
                    if (!System.IO.File.Exists(filename))
                    {

                        using FileStream fs = System.IO.File.Create(filename);
                        await _client.PostProtectedAsyncImage<FileStream>($"{_baseUrl}api/Image/UploadFile", fs, token, filename2);


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
        public async Task<IActionResult> Edit(PropertyUpdateGet Property)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PropertyUpdateGetWithErrorMessage = await _client.PostProtectedAsync<PropertyUpdateGetWithErrorMessages>($"{_baseUrl}api/Property/Update", Property, token);
            if (PropertyUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Property/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PropertyUpdateGetWithErrorMessage.ErrorMessages;
                return View(PropertyUpdateGetWithErrorMessage.Property);
            }

            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PropertyDeleteGet>($"{_baseUrl}api/Property/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Property/Delete", token);
            ViewBag.UITerms = UITerms;
            if(response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Menu", "Admin");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Delete(PropertyDeleteGet Page)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PropertyDeleteGet>($"{_baseUrl}api/Property/Delete", Page, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }

        //public async Task<IActionResult> LanguageIndex(int id)
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    var response = await _client.GetProtectedAsync<List<PropertyLanguageIndexGet>>($"{_baseUrl}api/Property/LanguageIndex/" + id, token);
        //    var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Property/LanguageIndex", token);
        //    ViewBag.UITerms = UITerms;
        //    ViewBag.Id = id;
        //    return View(response);

        //}

        //[HttpGet]
        //public async Task<IActionResult> LanguageEdit(int id)
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    var response = await _client.GetProtectedAsync<PropertyLanguageIndexGet>($"{_baseUrl}api/Property/LanguageUpdate/" + id, token);
        //    var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Property/LanguageEdit", token);
        //    ViewBag.UITerms = UITerms;
        //    return View(response);
        //}

        //[HttpGet]
        //public async Task<IActionResult> LanguageCreate(int id)
        //{
        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    var response = await _client.GetProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/Property/LanguageCreate/" + id, token);
        //    var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Property/LanguageCreate", token);
        //    ViewBag.UITerms = UITerms;
        //    response.ObjectId = id;
        //    return View(response);
        //}

        //[HttpPost]
        //public async Task<IActionResult> LanguageCreate(ObjectLanguageCreateGet PropertyLanguage)
        //{

        //    var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
        //    await _client.PostProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/Property/LanguageCreate", PropertyLanguage, token);

        //    return RedirectToAction("LanguageIndex", new { id = PropertyLanguage.ObjectId });
        //}
    }
}