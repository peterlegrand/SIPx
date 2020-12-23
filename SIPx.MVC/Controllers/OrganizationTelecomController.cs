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
    public class OrganizationTelecomController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<OrganizationTelecomCreateGet>($"{_baseUrl}api/OrganizationTelecom/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationTelecom/Create", token);
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
        public async Task<IActionResult> Create(OrganizationTelecomCreateGet OrganizationTelecom)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var OrganizationTelecomCreateGetWithErrorMessage = await _client.PostProtectedAsync<OrganizationTelecomCreateGetWithErrorMessages>($"{_baseUrl}api/OrganizationTelecom/Create", OrganizationTelecom, token);
            if (OrganizationTelecomCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationTelecom/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = OrganizationTelecomCreateGetWithErrorMessage.ErrorMessages;
                return View(OrganizationTelecomCreateGetWithErrorMessage.OrganizationTelecom);
            }

            return RedirectToAction("Index", new { id = OrganizationTelecom.OrganizationId });
        }
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<OrganizationTelecomIndexGet>>($"{_baseUrl}api/OrganizationTelecom/Index/" + id, token);
           var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationTelecom/Index", token);
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
            var response = await _client.GetProtectedAsync2<OrganizationTelecomUpdateGet>($"{_baseUrl}api/OrganizationTelecom/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationTelecom/Edit", token);
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
        public async Task<IActionResult> Edit(OrganizationTelecomUpdateGet OrganizationTelecom)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var OrganizationTelecomUpdateGetWithErrorMessage = await _client.PostProtectedAsync<OrganizationTelecomUpdateGetWithErrorMessages>($"{_baseUrl}api/OrganizationTelecom/Update", OrganizationTelecom, token);
            if (OrganizationTelecomUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationTelecom/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = OrganizationTelecomUpdateGetWithErrorMessage.ErrorMessages;
                return View(OrganizationTelecomUpdateGetWithErrorMessage.OrganizationTelecom);
            }

            return RedirectToAction("Index", new { id = OrganizationTelecom.OrganizationId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<OrganizationTelecomDeleteGet>($"{_baseUrl}api/OrganizationTelecom/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationTelecom/Delete", token);
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
        public async Task<IActionResult> Delete(OrganizationTelecomDeleteGet OrganizationTelecom)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<OrganizationTelecomDeleteGet>($"{_baseUrl}api/OrganizationTelecom/Delete", OrganizationTelecom, token);

            return RedirectToAction("Index", new { id = OrganizationTelecom.OrganizationId });
        }


    }
}