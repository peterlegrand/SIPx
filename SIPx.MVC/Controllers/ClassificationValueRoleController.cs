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
    public class ClassificationValueRoleController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ClassificationValueRoleCreateGet>($"{_baseUrl}api/ClassificationValueRole/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValueRole/Create", token);
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
        public async Task<IActionResult> Create(ClassificationValueRoleCreateGet ClassificationValueRole)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ClassificationValueRoleCreateGetWithErrorMessage =await _client.PostProtectedAsync<ClassificationValueRoleCreateGetWithErrorMessages>($"{_baseUrl}api/ClassificationValueRole/Create", ClassificationValueRole, token);
            if (ClassificationValueRoleCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValueRole/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ClassificationValueRoleCreateGetWithErrorMessage.ErrorMessages;
                return View(ClassificationValueRoleCreateGetWithErrorMessage.ClassificationValueRole);
            }

            return RedirectToAction("Index", new { id = ClassificationValueRole.ClassificationId });
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<ClassificationValueRoleIndexGet>>($"{_baseUrl}api/ClassificationValueRole/Index/" + id,token);
           var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValueRole/Index", token);
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
            var response = await _client.GetProtectedAsync2<ClassificationValueRoleUpdateGet>($"{_baseUrl}api/ClassificationValueRole/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValueRole/Edit", token);
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
        public async Task<IActionResult> Edit(ClassificationValueRoleUpdateGet ClassificationValueRole)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ClassificationValueRoleUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ClassificationValueRoleUpdateGetWithErrorMessages>($"{_baseUrl}api/ClassificationValueRole/Update", ClassificationValueRole, token);
            if (ClassificationValueRoleUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValueRole/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ClassificationValueRoleUpdateGetWithErrorMessage.ErrorMessages;
                return View(ClassificationValueRoleUpdateGetWithErrorMessage.ClassificationValueRole);
            }

            return RedirectToAction("Index", new { id = ClassificationValueRole.ClassificationValueId });
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ClassificationValueRoleDeleteGet>($"{_baseUrl}api/ClassificationValueRole/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationValueRole/Delete", token);
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
        public async Task<IActionResult> Delete(ClassificationValueRoleDeleteGet ClassificationValueRole)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ClassificationValueRoleDeleteGet>($"{_baseUrl}api/ClassificationValueRole/Delete", ClassificationValueRole, token);

            return RedirectToAction("Index", new { id = ClassificationValueRole.ClassificationValueId });
        }

    }
}