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
    public class ClassificationController : Controller
    {
        private readonly string _baseUrl = "https://localhost:44393/";
        readonly ServiceClient client = new ServiceClient();

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<ClassificationIndexGet>>($"{_baseUrl}api/Classification/Index", token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/Classification/Index", token);
            ViewBag.UITerms = UITerms;
            return View(response);
            //return View();
        }
        [HttpGet]
        public async Task<IActionResult> Create()
        {
            var token = HttpContext.Session.GetString("Token");
            var ClassificationCreate = new ClassificationCreateGet();

            var statusList = await client.GetProtectedAsync<List<StatusList>>($"{_baseUrl}api/Classification", token);
            var sequenceList = await client.GetProtectedAsync<List<ClassificationCreateGetSequence>>($"{_baseUrl}api/Classification", token);
            ClassificationCreate.Sequences = sequenceList;
            ClassificationCreate.Statuses = statusList;
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/Classification/Index", token);
            ViewBag.UITerms = UITerms;
            return View(ClassificationCreate);
        }
        [HttpPost]
        public async Task<IActionResult> Create(ClassificationCreateGet Classification)
        {
          //  var token = HttpContext.Session.GetString("Token");
            await client.PostProtectedAsync< ClassificationCreateGet>($"{_baseUrl}api/Classification", Classification);
            //(.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/Classification/Index", token);
           
            return View();
        }
        [HttpGet]
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<ClassificationUpdateGet>($"{_baseUrl}api/Classification/Update/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/Classification/Edit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
        public async Task<IActionResult> LanguageIndex(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<List<ClassificationLanguageIndexGet>>($"{_baseUrl}api/Classification/LanguageIndex/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/Classification/LanguageIndex", token);
            ViewBag.UITerms = UITerms;
            return View(response);

        }
        [HttpGet]
        public async Task<IActionResult> LanguageEdit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            var response = await client.GetProtectedAsync<ClassificationLanguageIndexGet>($"{_baseUrl}api/Classification/LanguageUpdate/" + id, token);
            var UITerms = await client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_baseUrl}api/UITerm/MVC/Classification/LanguageEdit", token);
            ViewBag.UITerms = UITerms;
            return View(response);
        }
    }
}