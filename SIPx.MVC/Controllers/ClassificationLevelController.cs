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
    public class ClassificationLevelController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";

        //PETER TODO put base url somewhere central
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");            
                    }
            var response = await _client.GetProtectedAsync2<ClassificationLevelCreateGet>($"{_baseUrl}api/ClassificationLevel/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevel/Create", token);
            ViewBag.UITerms = UITerms;
            var ErrorMessages = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessages;
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
        public async Task<IActionResult> Create(ClassificationLevelCreateGet ClassificationLevel)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var ClassificationLevelCreateGetWithErrorMessage = await _client.PostProtectedAsync<ClassificationLevelCreateGetWithErrorMessages>($"{_baseUrl}api/ClassificationLevel/Create", ClassificationLevel, token);
            if (ClassificationLevelCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevel/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ClassificationLevelCreateGetWithErrorMessage.ErrorMessages;
                return View(ClassificationLevelCreateGetWithErrorMessage.ClassificationLevel);
            }
            return RedirectToAction("Index", new { id = ClassificationLevel.ClassificationId });

        }

        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<List<ClassificationLevelIndexGet>>($"{_baseUrl}api/ClassificationLevel/Index/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevel/Index", token);
            ViewBag.Id = id;
            ViewBag.UITerms = UITerms;
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

        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<ClassificationLevelUpdateGet>($"{_baseUrl}api/ClassificationLevel/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevel/Edit", token);
            ViewBag.UITerms = UITerms;
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
        public async Task<IActionResult> Edit(ClassificationLevelUpdateGet ClassificationLevel)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var ClassificationLevelUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ClassificationLevelUpdateGetWithErrorMessages>($"{_baseUrl}api/ClassificationLevel/Update", ClassificationLevel, token);
            if (ClassificationLevelUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevel/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ClassificationLevelUpdateGetWithErrorMessage.ErrorMessages;
                return View(ClassificationLevelUpdateGetWithErrorMessage.ClassificationLevel);
            }

            return RedirectToAction("Index", new { id = ClassificationLevel.ClassificationId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<ClassificationLevelDeleteGet>($"{_baseUrl}api/ClassificationLevel/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevel/Delete", token);
            ViewBag.UITerms = UITerms;
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
        public async Task<IActionResult> Delete(ClassificationLevelDeleteGet ClassificationLevel)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ClassificationLevelDeleteGet>($"{_baseUrl}api/ClassificationLevel/Delete", ClassificationLevel, token);
            return RedirectToAction("Index", new { id = ClassificationLevel.ClassificationId });
        }

        [HttpGet]
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync<List<ClassificationLevelLanguageIndexGet>>($"{_baseUrl}api/ClassificationLevel/LanguageIndex/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevel/LanguageIndex", token);
            ViewBag.UITerms = UITerms;
            return View(response);
            //return View();
        }

        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync<ClassificationLevelLanguageIndexGet>($"{_baseUrl}api/ClassificationLevel/LanguageUpdate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevel/LanguageEdit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
    }
}