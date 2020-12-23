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
    public class PropertyValueController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";

        //PETER TODO put base url somewhere central
        readonly ServiceClient _client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");            
                    }
            var response = await _client.GetProtectedAsync2<PropertyValueCreateGet>($"{_baseUrl}api/PropertyValue/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PropertyValue/Create", token);
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
        public async Task<IActionResult> Create(PropertyValueCreateGet PropertyValue)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PropertyValueCreateGetWithErrorMessage = await _client.PostProtectedAsync<PropertyValueCreateGetWithErrorMessages>($"{_baseUrl}api/PropertyValue/Create", PropertyValue, token);
            if (PropertyValueCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PropertyValue/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PropertyValueCreateGetWithErrorMessage.ErrorMessages;
                return View(PropertyValueCreateGetWithErrorMessage.PropertyValue);
            }


            return RedirectToAction("Index", new { id = PropertyValue.PropertyId });
        }

        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<List<PropertyValueIndexGet>>($"{_baseUrl}api/PropertyValue/Index/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PropertyValue/Index", token);
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
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<PropertyValueUpdateGet>($"{_baseUrl}api/PropertyValue/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PropertyValue/Edit", token);
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
        public async Task<IActionResult> Edit(PropertyValueUpdateGet PropertyValue)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var PropertyValueUpdateGetWithErrorMessage = await _client.PostProtectedAsync<PropertyValueUpdateGetWithErrorMessages>($"{_baseUrl}api/PropertyValue/Update", PropertyValue, token);
            if (PropertyValueUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PropertyValue/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = PropertyValueUpdateGetWithErrorMessage.ErrorMessages;
                return View(PropertyValueUpdateGetWithErrorMessage.PropertyValue);
            }

            return RedirectToAction("Index", new { id = PropertyValue.PropertyId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<PropertyValueDeleteGet>($"{_baseUrl}api/PropertyValue/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PropertyValue/Delete", token);
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
        public async Task<IActionResult> Delete(PropertyValueDeleteGet PropertyValue)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            await _client.PostProtectedAsync<PropertyValueDeleteGet>($"{_baseUrl}api/PropertyValue/Delete", PropertyValue, token);

            //return RedirectToAction("Index", new { id = UserMenu.UserMenuTemplateId });
            return RedirectToAction("Index", new { id = PropertyValue.PropertyId });
        }

        //[HttpGet]
        //public async Task<IActionResult> LanguageIndex(int id)
        //{
        //    var token = HttpContext.Session.GetString("Token");
        //    if(token == null)
        //    { return RedirectToAction("Login","FrontAuth");
        //    }
        //    var response = await _client.GetProtectedAsync<List<PropertyValueLanguageIndexGet>>($"{_baseUrl}api/PropertyValue/LanguageIndex/" + id, token);
        //    var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PropertyValue/LanguageIndex", token);
        //    ViewBag.UITerms = UITerms;
        //    return View(response);
        //    //return View();
        //}

        //[HttpGet]
        //public async Task<IActionResult> LanguageEdit(int id)
        //{
        //    var token = HttpContext.Session.GetString("Token");
        //    if(token == null)
        //    { return RedirectToAction("Login","FrontAuth");
        //    }
        //    var response = await _client.GetProtectedAsync<PropertyValueLanguageIndexGet>($"{_baseUrl}api/PropertyValue/LanguageUpdate/" + id, token);
        //    var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/PropertyValue/LanguageEdit", token);
        //    ViewBag.UITerms = UITerms;
        //    return View(response);
        //}
    }
}