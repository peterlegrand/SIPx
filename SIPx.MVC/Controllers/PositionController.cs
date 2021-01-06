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
    public class PositionController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PositionCreateGet>($"{_baseUrl}api/Position/Create/", token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Position/Create", token);
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
        public async Task<IActionResult> Create(PositionCreateGet Position)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PositionCreateGetWithErrorMessage = await _client.PostProtectedAsync<PositionCreateGetWithErrorMessages>($"{_baseUrl}api/Position/Create", Position, token);
            if (PositionCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Position/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PositionCreateGetWithErrorMessage.ErrorMessages;
                return View(PositionCreateGetWithErrorMessage.Position);
            }

            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<PositionIndexGet>>($"{_baseUrl}api/Position/Index",token);
           var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Position/Index", token);
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
            var response = await _client.GetProtectedAsync2<PositionUpdateGet>($"{_baseUrl}api/Position/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Position/Edit", token);
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
        public async Task<IActionResult> Edit(PositionUpdateGet Position)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PositionUpdateGetWithErrorMessage = await _client.PostProtectedAsync<PositionUpdateGetWithErrorMessages>($"{_baseUrl}api/Position/Update", Position, token);
            if (PositionUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Position/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PositionUpdateGetWithErrorMessage.ErrorMessages;
                return View(PositionUpdateGetWithErrorMessage.Position);
            }

            return RedirectToAction("Index");
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PositionDeleteGet>($"{_baseUrl}api/Position/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/Position/Delete", token);
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
        public async Task<IActionResult> Delete(PositionDeleteGet Page)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PositionDeleteGet>($"{_baseUrl}api/Position/Delete", Page, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index");
        }


        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<PositionLanguageIndexGet>>($"{_baseUrl}api/ClassificationRelation/LanguageIndex/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationRelation/LanguageIndex", token);
            ViewBag.UITerms = UITerms;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<PositionLanguageIndexGet>($"{_baseUrl}api/ClassificationRelation/LanguageUpdate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ClassificationRelation/LanguageEdit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
    }
}