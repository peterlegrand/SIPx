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
    public class ProcessTemplateFlowController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTemplateFlowCreateGet>($"{_baseUrl}api/ProcessTemplateFlow/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlow/Create", token);
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
        public async Task<IActionResult> Create(ProcessTemplateFlowCreateGet ProcessTemplateFlow)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ProcessTemplateFlowCreateGetWithErrorMessage = await _client.PostProtectedAsync<ProcessTemplateFlowCreateGetWithErrorMessages>($"{_baseUrl}api/ProcessTemplateFlow/Create", ProcessTemplateFlow, token);
            if (ProcessTemplateFlowCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlow/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ProcessTemplateFlowCreateGetWithErrorMessage.ErrorMessages;
                return View(ProcessTemplateFlowCreateGetWithErrorMessage.ProcessTemplateFlow);
            }


            return RedirectToAction("Index", new { id = ProcessTemplateFlow.ProcessTemplateId });
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<List<ProcessTemplateFlowIndexGet>>($"{_baseUrl}api/ProcessTemplateFlow/Index/" + id, token);
           var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlow/Index", token);
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
            var response = await _client.GetProtectedAsync2<ProcessTemplateFlowUpdateGet>($"{_baseUrl}api/ProcessTemplateFlow/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlow/Edit", token);
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
        public async Task<IActionResult> Edit(ProcessTemplateFlowUpdateGet ProcessTemplateFlow)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ProcessTemplateFlowUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ProcessTemplateFlowUpdateGetWithErrorMessages>($"{_baseUrl}api/ProcessTemplateFlow/Update", ProcessTemplateFlow, token);
            if (ProcessTemplateFlowUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlow/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ProcessTemplateFlowUpdateGetWithErrorMessage.ErrorMessages;
                return View(ProcessTemplateFlowUpdateGetWithErrorMessage.ProcessTemplateFlow);
            }

            return RedirectToAction("Index", new { id = ProcessTemplateFlow.ProcessTemplateId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTemplateFlowDeleteGet>($"{_baseUrl}api/ProcessTemplateFlow/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlow/Delete", token);
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
        public async Task<IActionResult> Delete(ProcessTemplateFlowDeleteGet ProcessTemplateFlow)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateFlowDeleteGet>($"{_baseUrl}api/ProcessTemplateFlow/Delete", ProcessTemplateFlow, token);

            return RedirectToAction("Index", new { id = ProcessTemplateFlow.ProcessTemplateId });
        }
        [HttpGet]
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ProcessTemplateFlowLanguageIndexGet>>($"{_baseUrl}api/ProcessTemplateFlow/LanguageIndex/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlow/LanguageIndex", token);
            ViewBag.UITerms = UITerms;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ProcessTemplateFlowLanguageIndexGet>($"{_baseUrl}api/ProcessTemplateFlow/LanguageUpdate/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlow/LanguageEdit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }


    }
}