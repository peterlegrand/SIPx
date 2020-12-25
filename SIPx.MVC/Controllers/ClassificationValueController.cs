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
    public class ClassificationValueController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id, int ParentId = 0)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/Create", token);
            ViewBag.UITerms = UITerms;
            var ErrorMessages = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessages;

            if (ParentId == 0)
            {
                var Response = await _client.GetProtectedAsync2<ClassificationValueCreateGet>($"{_baseUrl}api/ClassificationValue/Create/" + Id, token);
                if (Response.Item2 == true)
                {
                    return View(Response.Item1);
                }
                else
                {
                    return RedirectToAction("Menu", "Admin");
                }
            }
            else
            {
                var Response = await _client.GetProtectedAsync2<ClassificationValueCreateGet>($"{_baseUrl}api/ClassificationValue/Create/" + Id + "?ParentId=" + ParentId, token);
                if (Response.Item2 == true)
                {
                    return View(Response.Item1);
                }
                else
                {
                    return RedirectToAction("Menu", "Admin");
                }
            }

        }
        [HttpPost]
        public async Task<IActionResult> Create(ClassificationValueCreateGet ClassificationValue)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
           var ClassificationValueCreateGetWithErrorMessage = await _client.PostProtectedAsync<ClassificationValueCreateGetWithErrorMessages>($"{_baseUrl}api/ClassificationValue/Create", ClassificationValue, token);
            if (ClassificationValueCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ClassificationValueCreateGetWithErrorMessage.ErrorMessages;
                return View(ClassificationValueCreateGetWithErrorMessage.ClassificationValue);
            }
            return RedirectToAction("Index", new { id = ClassificationValue.ClassificationId });
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<ClassificationValueIndexGet>>($"{_baseUrl}api/ClassificationValue/Index/" + id,token);
           var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/Index", token);
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
            var response = await _client.GetProtectedAsync2<ClassificationValueUpdateGet>($"{_baseUrl}api/ClassificationValue/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/Edit", token);
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
        [HttpPost]
        public async Task<IActionResult> Edit(ClassificationValueUpdateGet ClassificationValue)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ClassificationValueUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ClassificationValueUpdateGetWithErrorMessages>($"{_baseUrl}api/ClassificationValue/Update", ClassificationValue, token);
            if (ClassificationValueUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ClassificationValueUpdateGetWithErrorMessage.ErrorMessages;
                return View(ClassificationValueUpdateGetWithErrorMessage.ClassificationValue);
            }

            return RedirectToAction("Index", new { id = ClassificationValue.ClassificationId });
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ClassificationValueDeleteGet>($"{_baseUrl}api/ClassificationValue/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/Delete", token);
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
        public async Task<IActionResult> Delete(ClassificationValueDeleteGet ClassificationValue)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ClassificationValueDeleteGet>($"{_baseUrl}api/ClassificationValue/Delete", ClassificationValue, token);

            return RedirectToAction("Index", new { id = ClassificationValue.ClassificationId});
           
        }

        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ClassificationValueLanguageIndexGet>>($"{_baseUrl}api/ClassificationValue/LanguageIndex/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/LanguageIndex", token);
            ViewBag.UITerms = UITerms;
            return View(response);
            //return View();
        }

        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ClassificationValueLanguageIndexGet>($"{_baseUrl}api/ClassificationValue/LanguageUpdate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValue/LanguageEdit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
    }
}