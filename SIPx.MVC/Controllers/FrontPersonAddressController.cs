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
    public class FrontPersonAddressController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PersonAddressCreateGet>($"{_baseUrl}api/FrontPersonAddress/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPersonAddress/Create", token);
            ViewBag.UITerms = UITerms;
            var ErrorMessages = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessages;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Index", "Front");
            }
        }
        [HttpPost]
        public async Task<IActionResult> Create(PersonAddressCreateGet PersonAddress)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PersonAddressCreateGetWithErrorMessage = await _client.PostProtectedAsync<PersonAddressCreateGetWithErrorMessages>($"{_baseUrl}api/FrontPersonAddress/Create", PersonAddress, token);
            if (PersonAddressCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPersonAddress/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PersonAddressCreateGetWithErrorMessage.ErrorMessages;
                return View(PersonAddressCreateGetWithErrorMessage.PersonAddress);
            }
            return RedirectToAction("Dashboard","FrontPerson", new { id = PersonAddress.PersonId });
        }
        
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<PersonAddressUpdateGet>($"{_baseUrl}api/FrontPersonAddress/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPersonAddress/Edit", token);
            ViewBag.UITerms = UITerms;
            var ErrorMessage = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessage;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Index", "Front");
            }
        }
        [HttpPost]
        public async Task<IActionResult> Edit(PersonAddressUpdateGet PersonAddress)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PersonAddressUpdateGetWithErrorMessage = await _client.PostProtectedAsync<PersonAddressUpdateGetWithErrorMessages>($"{_baseUrl}api/FrontPersonAddress/Update", PersonAddress, token);
            if (PersonAddressUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPersonAddress/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PersonAddressUpdateGetWithErrorMessage.ErrorMessages;
                return View(PersonAddressUpdateGetWithErrorMessage.PersonAddress);
            }

            return RedirectToAction("Dashboard", "FrontPerson", new { id = PersonAddress.PersonId });
        }

        [HttpGet]
        public async Task<IActionResult> View(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<PersonAddressDeleteGet>($"{_baseUrl}api/FrontPersonAddress/View/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPersonAddress/View", token);
            ViewBag.UITerms = UITerms;
            var ErrorMessage = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessage;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Index", "Front");
            }
        }
        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<PersonAddressDeleteGet>($"{_baseUrl}api/FrontPersonAddress/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontPersonAddress/Delete", token);
            ViewBag.UITerms = UITerms;
            var ErrorMessage = new List<ErrorMessage>();
            ViewBag.ErrorMessages = ErrorMessage;
            if (response.Item2 == true)
            {
                return View(response.Item1);
            }
            else
            {
                return RedirectToAction("Index", "Front");
            }
        }

        [HttpPost]
        public async Task<IActionResult> Delete(PersonAddressDeleteGet PersonAddress)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<PersonAddressDeleteGet>($"{_baseUrl}api/FrontPersonAddress/Delete", PersonAddress, token);

            return RedirectToAction("Dashboard", "FrontPerson", new { id = PersonAddress.PersonId });
        }


    }
}