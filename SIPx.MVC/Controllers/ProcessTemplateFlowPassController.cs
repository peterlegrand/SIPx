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
    public class ProcessTemplateFlowPassController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient _client = new ServiceClient();
        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync2<ProcessTemplateFlowPassCreateGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Create/" + Id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowPass/Create", token);
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
        public async Task<IActionResult> Create(ProcessTemplateFlowPassCreateGet ProcessTemplateFlowPass)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateFlowPassCreateGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Create", ProcessTemplateFlowPass, token);

            return RedirectToAction("Index", new { id = ProcessTemplateFlowPass.ProcessTemplateFlowId });
       
        }
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<List<ProcessTemplateFlowPassIndexGet>>($"{_baseUrl}api/ProcessTemplateFlowPass/Index/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowPass/Index", token);
            var ProcessTemplateId = await _client.GetProtectedAsync<int>($"{_baseUrl}api/ProcessTemplateFlowPass/IndexGetProcessTemplateId/" + id, token);
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
            var response = await _client.GetProtectedAsync<ProcessTemplateFlowPassUpdateGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Update/" + id, token);
            var x = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowPass/Edit", token);
            ViewBag.UITerms = x;
            return View(response);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(ProcessTemplateFlowPassUpdateGet ProcessTemplateFlowPass)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateFlowPassUpdateGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Update", ProcessTemplateFlowPass, token);

            return RedirectToAction("Index", new { id = ProcessTemplateFlowPass.ProcessTemplateFlowId });
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            var response = await _client.GetProtectedAsync<ProcessTemplateFlowPassDeleteGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Delete/" + id, token);
            var UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/MVC/ProcessTemplateFlowPass/Delete", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(ProcessTemplateFlowPassDeleteGet ProcessTemplateFlowPass)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProcessTemplateFlowPassDeleteGet>($"{_baseUrl}api/ProcessTemplateFlowPass/Delete", ProcessTemplateFlowPass, token);

            return RedirectToAction("Index", new { id = ProcessTemplateFlowPass.ProcessTemplateFlowId });
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