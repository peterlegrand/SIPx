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
    public class ProcessTemplateFlowConditionController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTemplateFlowConditionCreateGet>($"{_baseUrl}api/ProcessTemplateFlowCondition/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowCondition/Create", token);
            ViewBag.UITerms = UITerms;
            var x = new List<ErrorMessage>();
            ViewBag.ErrorMessages = x;
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
        public async Task<IActionResult> Create(ProcessTemplateFlowConditionCreateGet ProcessTemplateFlowCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateFlowConditionCreateGet>($"{_baseUrl}api/ProcessTemplateFlowCondition/Create", ProcessTemplateFlowCondition, token);

            return RedirectToAction("Index", new { id = ProcessTemplateFlowCondition.ProcessTemplateFlowId });
       
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ProcessTemplateFlowConditionIndexGet>>($"{_baseUrl}api/ProcessTemplateFlowCondition/Index/" + id, token);
           var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowCondition/Index", token);
            ViewBag.UITerms = x;
            ViewBag.Id = id;
            return View(response);
            //return View();
        }
        //PETER TODO Check for objectViewGet to be replaced by editget
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ProcessTemplateFlowConditionUpdateGet>($"{_baseUrl}api/ProcessTemplateFlowCondition/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowCondition/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(ProcessTemplateFlowConditionUpdateGet ProcessTemplateFlowCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateFlowConditionUpdateGet>($"{_baseUrl}api/ProcessTemplateFlowCondition/Update", ProcessTemplateFlowCondition, token);

            return RedirectToAction("Index", new { id = ProcessTemplateFlowCondition.ProcessTemplateFlowId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ProcessTemplateFlowConditionDeleteGet>($"{_baseUrl}api/ProcessTemplateFlowCondition/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowCondition/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(ProcessTemplateFlowConditionDeleteGet ProcessTemplateFlowCondition)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateFlowConditionDeleteGet>($"{_baseUrl}api/ProcessTemplateFlowCondition/Delete", ProcessTemplateFlowCondition, token);

            return RedirectToAction("Index", new { id = ProcessTemplateFlowCondition.ProcessTemplateFlowId });
        }

        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ProcessTemplateLanguageIndexGet>>($"{_baseUrl}api/ProcessTemplate/LanguageIndex/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplate/LanguageIndex", token);
            ViewBag.UITerms = x;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ProcessTemplateLanguageIndexGet>($"{_baseUrl}api/ProcessTemplate/LanguageUpdate/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplate/LanguageEdit", token);
            ViewBag.UITerms = x;
            return View(response);
        }


    }
}