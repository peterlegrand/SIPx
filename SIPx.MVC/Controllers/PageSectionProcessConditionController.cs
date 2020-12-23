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
    public class PageSectionProcessConditionController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PageSectionProcessConditionCreateGet>($"{_baseUrl}api/PageSectionProcessCondition/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionProcessCondition/Create", token);
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
        public async Task<IActionResult> Create(PageSectionProcessConditionCreateGet PageSectionProcessCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PageSectionProcessConditionCreateGet>($"{_baseUrl}api/PageSectionProcessCondition/Create", PageSectionProcessCondition, token);
            var PageSectionProcessConditionCreateGetWithErrorMessage = await _client.PostProtectedAsync<PageSectionProcessConditionCreateGetWithErrorMessages>($"{_baseUrl}api/PageSectionProcessCondition/Create", PageSectionProcessCondition, token);
            if (PageSectionProcessConditionCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionProcessCondition/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PageSectionProcessConditionCreateGetWithErrorMessage.ErrorMessages;
                return View(PageSectionProcessConditionCreateGetWithErrorMessage.PageSectionProcessCondition);
            }

            return RedirectToAction("Index", new { id = PageSectionProcessCondition.PageSectionId });
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<PageSectionProcessConditionIndexGet>>($"{_baseUrl}api/PageSectionProcessCondition/Index/" +id,token);
           var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionProcessCondition/Index", token);
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
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PageSectionProcessConditionUpdateGet>($"{_baseUrl}api/PageSectionProcessCondition/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionProcessCondition/Edit", token);
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
        public async Task<IActionResult> Edit(PageSectionProcessConditionUpdateGet PageSectionProcessCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PageSectionProcessConditionUpdateGetWithErrorMessage = await _client.PostProtectedAsync<PageSectionProcessConditionUpdateGetWithErrorMessages>($"{_baseUrl}api/PageSectionProcessCondition/Update", PageSectionProcessCondition, token);
            if (PageSectionProcessConditionUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionProcessCondition/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PageSectionProcessConditionUpdateGetWithErrorMessage.ErrorMessages;
                return View(PageSectionProcessConditionUpdateGetWithErrorMessage.PageSectionProcessCondition);
            }

            return RedirectToAction("Index", new { id = PageSectionProcessCondition.PageSectionId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PageSectionProcessConditionDeleteGet>($"{_baseUrl}api/PageSectionProcessCondition/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSectionProcessCondition/Delete", token);
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
        public async Task<IActionResult> Delete(PageSectionProcessConditionDeleteGet PageSectionProcessCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PageSectionProcessConditionDeleteGet>($"{_baseUrl}api/PageSectionProcessCondition/Delete", PageSectionProcessCondition, token);

            return RedirectToAction("Index", new { id = PageSectionProcessCondition.PageSectionId });
        }
        [HttpGet]
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<PageSectionLanguageIndexGet>>($"{_baseUrl}api/PageSection/LanguageIndex/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSection/LanguageIndex", token);
            ViewBag.UITerms = UITerms;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<PageSectionLanguageIndexGet>($"{_baseUrl}api/PageSection/LanguageUpdate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PageSection/LanguageEdit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }


    }
}