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
    public class FrontOrganizationAddressController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<OrganizationAddressCreateGet>($"{_baseUrl}api/FrontOrganizationAddress/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganizationAddress/Create", token);
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
        public async Task<IActionResult> Create(OrganizationAddressCreateGet OrganizationAddress)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var OrganizationAddressCreateGetWithErrorMessage =await _client.PostProtectedAsync<OrganizationAddressCreateGetWithErrorMessages>($"{_baseUrl}api/FrontOrganizationAddress/Create", OrganizationAddress, token);
            if (OrganizationAddressCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganizationAddress/Create", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = OrganizationAddressCreateGetWithErrorMessage.ErrorMessages;
                return View(OrganizationAddressCreateGetWithErrorMessage.OrganizationAddress);
            }

            return RedirectToAction("Dashboard", "FrontOrganization", new { id = OrganizationAddress.OrganizationId });
        }


        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<OrganizationAddressUpdateGet>($"{_baseUrl}api/FrontOrganizationAddress/Update/" + id, token);
          //  var CountryList = await _client.GetProtectedAsync<List<CountryList>>($"{_baseUrl}api/Country/List", token);
            //response.Item1.Countries = CountryList;
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganizationAddress/Edit", token);
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
        public async Task<IActionResult> Edit(OrganizationAddressUpdateGet OrganizationAddress)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var OrganizationAddressUpdateGetWithErrorMessage = await _client.PostProtectedAsync<OrganizationAddressUpdateGetWithErrorMessages>($"{_baseUrl}api/FrontOrganizationAddress/Update", OrganizationAddress, token);
            if (OrganizationAddressUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganizationAddress/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = OrganizationAddressUpdateGetWithErrorMessage.ErrorMessages;
                return View(OrganizationAddressUpdateGetWithErrorMessage.OrganizationAddress);
            }

            return RedirectToAction("Dashboard", "FrontOrganization", new { id = OrganizationAddress.OrganizationId });
        }

        [HttpGet]
        public async Task<IActionResult> View(int id)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            var response = await _client.GetProtectedAsync2<OrganizationAddressDeleteGet>($"{_baseUrl}api/FrontOrganizationAddress/View/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganizationAddress/View", token);
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
            var response = await _client.GetProtectedAsync2<OrganizationAddressDeleteGet>($"{_baseUrl}api/FrontOrganizationAddress/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/FrontOrganizationAddress/Delete", token);
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
        public async Task<IActionResult> Delete(OrganizationAddressDeleteGet OrganizationAddress)
        {
            var token = HttpContext.Session.GetString("Token"); if (token == null) { return RedirectToAction("Login", "FrontAuth"); }
            await _client.PostProtectedAsync<OrganizationAddressDeleteGet>($"{_baseUrl}api/FrontOrganizationAddress/Delete", OrganizationAddress, token);

            return RedirectToAction("Dashboard","FrontOrganization", new { id = OrganizationAddress.OrganizationId });
        }


    }
}