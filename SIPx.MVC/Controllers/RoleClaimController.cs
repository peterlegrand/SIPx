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
    public class RoleClaimController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(string Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<RoleClaimCreateGet>($"{_baseUrl}api/RoleClaim/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleClaim/Create", token);
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
        public async Task<IActionResult> Create(RoleClaimCreateGet RoleClaim)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var RoleClaimCreateGetWithErrorMessage = await _client.PostProtectedAsync<RoleClaimCreateGetWithErrorMessages>($"{_baseUrl}api/RoleClaim/Create", RoleClaim, token);
            if (RoleClaimCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleClaim/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = RoleClaimCreateGetWithErrorMessage.ErrorMessages;
                return View(RoleClaimCreateGetWithErrorMessage.RoleClaim);
            }


            return RedirectToAction("Index", new { id = RoleClaim.RoleId });
        }
        [HttpGet]
        public async Task<IActionResult> Index(string Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<RoleClaimIndexGet>>($"{_baseUrl}api/RoleClaim/Index/"+Id,token);
           var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleClaim/Index", token);
            ViewBag.Id = Id;
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
            var response = await _client.GetProtectedAsync2<RoleClaimUpdateGet>($"{_baseUrl}api/RoleClaim/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleClaim/Edit", token);
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
        public async Task<IActionResult> Edit(RoleClaimUpdateGet RoleClaim)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var RoleClaimUpdateGetWithErrorMessage = await _client.PostProtectedAsync<RoleClaimUpdateGetWithErrorMessages>($"{_baseUrl}api/RoleClaim/Update", RoleClaim, token);
            if (RoleClaimUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleClaim/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = RoleClaimUpdateGetWithErrorMessage.ErrorMessages;
                return View(RoleClaimUpdateGetWithErrorMessage.RoleClaim);
            }

            return RedirectToAction("Index", new { id = RoleClaim.RoleId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<RoleClaimDeleteGet>($"{_baseUrl}api/RoleClaim/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/RoleClaim/Delete", token);
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
        public async Task<IActionResult> Delete(RoleClaimDeleteGet RoleClaim)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<RoleClaimDeleteGet>($"{_baseUrl}api/RoleClaim/Delete", RoleClaim, token);

            return RedirectToAction("Index", new { id = RoleClaim.RoleId });
        }


    }
}