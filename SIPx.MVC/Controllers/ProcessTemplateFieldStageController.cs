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
    public class ProcessTemplateFieldStageController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTemplateFieldStageIndexGet>($"{_baseUrl}api/ProcessTemplateFieldStage/Index/" + id, token);
           var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFieldStage/Index", token);
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
            var response = await _client.GetProtectedAsync2<ProcessTemplateFieldStageUpdateGet>($"{_baseUrl}api/ProcessTemplateFieldStage/Update/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFieldStage/Edit", token);
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
        public async Task<IActionResult> Edit(ProcessTemplateFieldStageUpdateGet ProcessTemplateFieldStage)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var ProcessTemplateFieldStageUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ProcessTemplateFieldStageUpdateGetWithErrorMessages>($"{_baseUrl}api/ProcessTemplateFieldStage/Update", ProcessTemplateFieldStage, token);
            if (ProcessTemplateFieldStageUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFieldStage/Edit", token);
                ViewBag.UITerms = UITerms;
                ViewBag.ErrorMessages = ProcessTemplateFieldStageUpdateGetWithErrorMessage.ErrorMessages;
                return View(ProcessTemplateFieldStageUpdateGetWithErrorMessage.ProcessTemplateFieldStage);
            }

            return RedirectToAction("Index", new { id = ProcessTemplateFieldStage.ProcessTemplateFieldId });
        }


    }
}