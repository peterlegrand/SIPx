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
    public class UserMenuTemplateOptionController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<UserMenuTemplateOptionCreateGet>($"{_baseUrl}api/UserMenuTemplateOption/Create/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/Create", token);
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
        public async Task<IActionResult> Create(UserMenuTemplateOptionCreateGet UserMenuTemplateOption)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var UserMenuTemplateOptionCreateGetWithErrorMessage = await _client.PostProtectedAsync<UserMenuTemplateOptionCreateGetWithErrorMessages>($"{_baseUrl}api/UserMenuTemplateOption/Create", UserMenuTemplateOption, token);
            if (UserMenuTemplateOptionCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = UserMenuTemplateOptionCreateGetWithErrorMessage.ErrorMessages;
                return View(UserMenuTemplateOptionCreateGetWithErrorMessage.UserMenuTemplateOption);
            }


            return RedirectToAction("Index", new { id = UserMenuTemplateOption.UserMenuTemplateId });
        }

        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<UserMenuTemplateOptionIndexGet>>($"{_baseUrl}api/UserMenuTemplateOption/Index/"+id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/Index", token);
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
            var response = await _client.GetProtectedAsync2<UserMenuTemplateOptionUpdateGet>($"{_baseUrl}api/UserMenuTemplateOption/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/Edit", token);
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
        public async Task<IActionResult> Edit(UserMenuTemplateOptionUpdateGet UserMenuTemplateOption)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var UserMenuTemplateOptionUpdateGetWithErrorMessage = await _client.PostProtectedAsync<UserMenuTemplateOptionUpdateGetWithErrorMessages>($"{_baseUrl}api/UserMenuTemplateOption/Update", UserMenuTemplateOption, token);
            if (UserMenuTemplateOptionUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = UserMenuTemplateOptionUpdateGetWithErrorMessage.ErrorMessages;
                return View(UserMenuTemplateOptionUpdateGetWithErrorMessage.UserMenuTemplateOption);
            }

            return RedirectToAction("Index", new { id = UserMenuTemplateOption.UserMenuTemplateId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<UserMenuTemplateOptionDeleteGet>($"{_baseUrl}api/UserMenuTemplateOption/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/Delete", token);
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
        public async Task<IActionResult> Delete(UserMenuTemplateOptionDeleteGet UserMenuTemplateOption)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<UserMenuTemplateOptionDeleteGet>($"{_baseUrl}api/UserMenuTemplateOption/Delete", UserMenuTemplateOption, token);

            return RedirectToAction("Index", new { id = UserMenuTemplateOption.UserMenuTemplateId });
        }
        [HttpGet]
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<UserMenuTemplateOptionLanguageIndexGet>>($"{_baseUrl}api/UserMenuTemplateOption/LanguageIndex/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/LanguageIndex", token);
            ViewBag.UITerms = UITerms;
            ViewBag.Id = id;
            return View(response);

        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<UserMenuTemplateOptionLanguageIndexGet>($"{_baseUrl}api/UserMenuTemplateOption/LanguageUpdate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/LanguageEdit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        [HttpGet]
        public async Task<IActionResult> LanguageCreate(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/UserMenuTemplateOption/LanguageCreate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/UserMenuTemplateOption/LanguageCreate", token);
            ViewBag.UITerms = UITerms;
            response.ObjectId = id;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> LanguageCreate(ObjectLanguageCreateGet UserMenuTemplateOptionLanguage)
        {

            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ObjectLanguageCreateGet>($"{_baseUrl}api/UserMenuTemplateOption/LanguageCreate", UserMenuTemplateOptionLanguage, token);

            return RedirectToAction("LanguageIndex", new { id = UserMenuTemplateOptionLanguage.ObjectId });
        }


    }
}