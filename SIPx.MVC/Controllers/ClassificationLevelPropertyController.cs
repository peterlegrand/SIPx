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
    public class ClassificationLevelPropertyController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";

        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ClassificationLevelPropertyCreateGet>($"{_baseUrl}api/ClassificationLevelProperty/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevelProperty/Create", token);
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
        public async Task<IActionResult> Create(ClassificationLevelPropertyCreateGet ClassificationLevelProperty)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ClassificationLevelPropertyCreateGetWithErrorMessage = await _client.PostProtectedAsync<ClassificationLevelPropertyCreateGetWithErrorMessages>($"{_baseUrl}api/ClassificationLevelProperty/Create", ClassificationLevelProperty, token);
            if (ClassificationLevelPropertyCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevel/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ClassificationLevelPropertyCreateGetWithErrorMessage.ErrorMessages;
                return View(ClassificationLevelPropertyCreateGetWithErrorMessage.ClassificationLevelProperty);
            }
            return RedirectToAction("Index", new { id = ClassificationLevelProperty.ClassificationLevelId });
        }

        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<ClassificationLevelPropertyIndexGet>>($"{_baseUrl}api/ClassificationLevelProperty/Index/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevelProperty/Index", token);
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
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ClassificationLevelPropertyUpdateGet>($"{_baseUrl}api/ClassificationLevelProperty/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevelProperty/Edit", token);
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
        public async Task<IActionResult> Edit(ClassificationLevelPropertyUpdateGet ClassificationLevelProperty)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ClassificationLevelPropertyUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ClassificationLevelPropertyUpdateGetWithErrorMessages>($"{_baseUrl}api/ClassificationLevelProperty/Update", ClassificationLevelProperty, token);
            if (ClassificationLevelPropertyUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevelProperty/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ClassificationLevelPropertyUpdateGetWithErrorMessage.ErrorMessages;
                return View(ClassificationLevelPropertyUpdateGetWithErrorMessage.ClassificationLevelProperty);
            }

            return RedirectToAction("Index", new { id = ClassificationLevelProperty.ClassificationLevelId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ClassificationLevelPropertyDeleteGet>($"{_baseUrl}api/ClassificationLevelProperty/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevelProperty/Delete", token);
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
        public async Task<IActionResult> Delete(ClassificationLevelPropertyDeleteGet ClassificationLevelProperty)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            await _client.PostProtectedAsync<ClassificationLevelPropertyDeleteGet>($"{_baseUrl}api/ClassificationLevelProperty/Delete", ClassificationLevelProperty, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index", new { id = ClassificationLevelProperty.ClassificationLevelId });
        }

    //    [HttpGet]
    //    public async Task<IActionResult> LanguageIndex(int id)
    //    {
    //        var token = HttpContext.Session.GetString("Token");
    //        if(token == null)
    //        { return RedirectToAction("Login","FrontAuth");
    //        }
    //        var response = await _client.GetProtectedAsync<List<ClassificationLevelPropertyLanguageIndexGet>>($"{_baseUrl}api/ClassificationLevelProperty/LanguageIndex/" + id, token);
    //        var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevelProperty/LanguageIndex", token);
    //        ViewBag.UITerms = UITerms;
    //        return View(response);
    //        //return View();
    //    }

    //    [HttpGet]
    //    public async Task<IActionResult> LanguageEdit(int id)
    //    {
    //        var token = HttpContext.Session.GetString("Token");
    //        if(token == null)
    //        { return RedirectToAction("Login","FrontAuth");
    //        }
    //        var response = await _client.GetProtectedAsync<ClassificationLevelPropertyLanguageIndexGet>($"{_baseUrl}api/ClassificationLevelProperty/LanguageUpdate/" + id, token);
    //        var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationLevelProperty/LanguageEdit", token);
    //        ViewBag.UITerms = UITerms;
    //        return View(response);
    //    }
    }
}