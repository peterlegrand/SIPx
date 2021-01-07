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
    public class PersonPositionController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PersonPositionCreateGet>($"{_baseUrl}api/PersonPosition/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonPosition/Create", token);
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
        public async Task<IActionResult> Create(PersonPositionCreateGet PersonPosition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PersonPositionCreateGetWithErrorMessage =await _client.PostProtectedAsync<PersonPositionCreateGetWithErrorMessages>($"{_baseUrl}api/PersonPosition/Create", PersonPosition, token);
            if (PersonPositionCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonPosition/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PersonPositionCreateGetWithErrorMessage.ErrorMessages;
                return View(PersonPositionCreateGetWithErrorMessage.PersonPosition);
            }

            return RedirectToAction("Index", new { id = PersonPosition.PersonId });
        }

        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<PersonPositionIndexGet>>($"{_baseUrl}api/PersonPosition/Index/" +id,token);
           var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonPosition/Index", token);
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
            var response = await _client.GetProtectedAsync2<PersonPositionUpdateGet>($"{_baseUrl}api/PersonPosition/Update/" + id, token);
  //          var CountryList = await _client.GetProtectedAsync<List<CountryList>>($"{_baseUrl}api/Country/List", token);
//            response.Item1.Countries = CountryList;
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonPosition/Edit", token);
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
        public async Task<IActionResult> Edit(PersonPositionUpdateGet PersonPosition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PersonPositionUpdateGetWithErrorMessage = await _client.PostProtectedAsync<PersonPositionUpdateGetWithErrorMessages>($"{_baseUrl}api/PersonPosition/Update", PersonPosition, token);
            if (PersonPositionUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonPosition/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PersonPositionUpdateGetWithErrorMessage.ErrorMessages;
                return View(PersonPositionUpdateGetWithErrorMessage.PersonPosition);
            }

            return RedirectToAction("Index", new { id = PersonPosition.PersonId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PersonPositionDeleteGet>($"{_baseUrl}api/PersonPosition/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PersonPosition/Delete", token);
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
        public async Task<IActionResult> Delete(PersonPositionDeleteGet PersonPosition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PersonPositionDeleteGet>($"{_baseUrl}api/PersonPosition/Delete", PersonPosition, token);

            return RedirectToAction("Index", new { id = PersonPosition.PersonId });
        }


    }
}