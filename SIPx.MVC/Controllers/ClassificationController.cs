using System;
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
    public class ClassificationController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        public ClassificationController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }

    


        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }

            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Create", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);

            var response = await _client.GetProtectedAsync2<ClassificationCreateGet>($"{_baseUrl}api/Classification/Create/", token);
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
        public async Task<IActionResult> Create(ClassificationCreateGet Classification)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ClassificationCreateGetWithErrorMessage = await _client.PostProtectedAsync<ClassificationCreateGetWithErrorMessages>($"{_baseUrl}api/Classification/Create", Classification, token);
            if (ClassificationCreateGetWithErrorMessage.ErrorMessages.Count>0)
            {
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Create", token);
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);

                ViewBag.ErrorMessages = ClassificationCreateGetWithErrorMessage.ErrorMessages;
                return View(ClassificationCreateGetWithErrorMessage.Classification);
            }
            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<ClassificationIndexGet>>($"{_baseUrl}api/Classification/Index", token);

            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Index", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);

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
            var response = await _client.GetProtectedAsync2<ClassificationUpdateGet>($"{_baseUrl}api/Classification/Update/" + id, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Edit", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
            var ErrorMessage = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessage;
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
        public async Task<IActionResult> Edit(ClassificationUpdateGet Classification)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ClassificationUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ClassificationUpdateGetWithErrorMessages>($"{_baseUrl}api/Classification/Update", Classification, token);
            if (ClassificationUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Edit", token);
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
                ViewBag.ErrorMessages = ClassificationUpdateGetWithErrorMessage.ErrorMessages;
                return View(ClassificationUpdateGetWithErrorMessage.Classification);
            }
            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ClassificationDeleteGet>($"{_baseUrl}api/Classification/Delete/" + id, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/Delete", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_baseUrl}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_baseUrl}api/MVCFavorite/GroupList", token);
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
        public async Task<IActionResult> Delete(ClassificationDeleteGet Page)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ClassificationDeleteGet>($"{_baseUrl}api/Classification/Delete", Page, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ClassificationLanguageIndexGet>>($"{_baseUrl}api/Classification/LanguageIndex/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/LanguageIndex", token);
            
            ViewBag.Id = id;
            return View(response);

        }

        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ClassificationLanguageIndexGet>($"{_baseUrl}api/Classification/LanguageUpdate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/LanguageEdit", token);
            
            return View(response);
        }

        [HttpGet]
        public async Task<IActionResult> LanguageCreate(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/Classification/LanguageCreate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Classification/LanguageCreate", token);
            
            response.ObjectId = id;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> LanguageCreate(ObjectLanguageCreateGet ClassificationLanguage)
        {

            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/Classification/LanguageCreate", ClassificationLanguage, token);

            return RedirectToAction("LanguageIndex", new { id = ClassificationLanguage.ObjectId });
        }
    }
}