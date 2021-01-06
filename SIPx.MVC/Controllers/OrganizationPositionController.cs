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
    public class OrganizationPositionController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<OrganizationPositionCreateGet>($"{_baseUrl}api/OrganizationPosition/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationPosition/Create", token);
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
        public async Task<IActionResult> Create(OrganizationPositionCreateGet OrganizationPosition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var OrganizationPositionCreateGetWithErrorMessage =await _client.PostProtectedAsync<OrganizationPositionCreateGetWithErrorMessages>($"{_baseUrl}api/OrganizationPosition/Create", OrganizationPosition, token);
            if (OrganizationPositionCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationPosition/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = OrganizationPositionCreateGetWithErrorMessage.ErrorMessages;
                return View(OrganizationPositionCreateGetWithErrorMessage.OrganizationPosition);
            }

            return RedirectToAction("Index", new { id = OrganizationPosition.OrganizationId });
        }

        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<OrganizationPositionIndexGet>>($"{_baseUrl}api/OrganizationPosition/Index/" +id,token);
           var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationPosition/Index", token);
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
            var response = await _client.GetProtectedAsync2<OrganizationPositionUpdateGet>($"{_baseUrl}api/OrganizationPosition/Update/" + id, token);
  //          var CountryList = await _client.GetProtectedAsync<List<CountryList>>($"{_baseUrl}api/Country/List", token);
//            response.Item1.Countries = CountryList;
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationPosition/Edit", token);
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
        public async Task<IActionResult> Edit(OrganizationPositionUpdateGet OrganizationPosition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var OrganizationPositionUpdateGetWithErrorMessage = await _client.PostProtectedAsync<OrganizationPositionUpdateGetWithErrorMessages>($"{_baseUrl}api/OrganizationPosition/Update", OrganizationPosition, token);
            if (OrganizationPositionUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationPosition/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = OrganizationPositionUpdateGetWithErrorMessage.ErrorMessages;
                return View(OrganizationPositionUpdateGetWithErrorMessage.OrganizationPosition);
            }

            return RedirectToAction("Index", new { id = OrganizationPosition.OrganizationId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<OrganizationPositionDeleteGet>($"{_baseUrl}api/OrganizationPosition/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/OrganizationPosition/Delete", token);
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
        public async Task<IActionResult> Delete(OrganizationPositionDeleteGet OrganizationPosition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<OrganizationPositionDeleteGet>($"{_baseUrl}api/OrganizationPosition/Delete", OrganizationPosition, token);

            return RedirectToAction("Index", new { id = OrganizationPosition.OrganizationId });
        }


    }
}