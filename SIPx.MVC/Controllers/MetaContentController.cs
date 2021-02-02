using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SIPx.CallAPI;
using SIPx.Shared;

namespace SIPx.MVC.Controllers
{
    public class MetaContentController : Controller
    {


        //PETER TODO put base url somewhere central
        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        public MetaContentController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }

        [HttpGet]
        public async Task<IActionResult> Create(int Id, [FromQuery(Name = "MetaTypeId")] int MetaTypeId)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");            
                    }
            var response = await _client.GetProtectedAsync2<MetaContentCreateGet>($"{_configuration["APIUrl"]}api/MetaContent/Create/" + Id + "?MetaTypeId=" + MetaTypeId, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/MetaContent/Create", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;
            ViewBag.ErrorMessages = new List<ErrorMessage>(); ;
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
        public async Task<IActionResult> Create(MetaContentCreateGet MetaContent)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var MetaContentCreateGetWithErrorMessages = await _client.PostProtectedAsync<MetaContentCreateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/MetaContent/Create", MetaContent, token);
            if (MetaContentCreateGetWithErrorMessages.ErrorMessages.Count > 0)
            {
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/MetaContent/Create", token);
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.ErrorMessages = MetaContentCreateGetWithErrorMessages.ErrorMessages;
                ViewBag.Env = _hostingEnv.EnvironmentName;
                return View(MetaContentCreateGetWithErrorMessages.MetaContent);
            }
            return RedirectToAction("Index", new { id = MetaContent.MetaRecordId , MetaTypeId = MetaContent.MetaTypeId });

        }

        [HttpGet]
        public async Task<IActionResult> Index(int id, [FromQuery(Name = "MetaTypeId")] int MetaTypeId)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<MetaContentIndexGet>($"{_configuration["APIUrl"]}api/MetaContent/Index/" + id + "?MetaTypeId="+ MetaTypeId, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/MetaContent/Index", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;
            ViewBag.Id = id;
            ViewBag.ErrorMessages = new List<ErrorMessage>();
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
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<MetaContentDeleteGet>($"{_configuration["APIUrl"]}api/MetaContent/Delete/" + id, token);
            ViewBag.UITerms  = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/MetaContent/Delete", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.Env = _hostingEnv.EnvironmentName;
            ViewBag.ErrorMessages = new List<ErrorMessage>();
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
        public async Task<IActionResult> Delete(MetaContentDeleteGet MetaContent)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<MetaContentDeleteGet>($"{_configuration["APIUrl"]}api/MetaContent/Delete", MetaContent, token);
            return RedirectToAction("Index", new { id = MetaContent.MetaContentId, MetaTypeId = MetaContent.MetaTypeId });
        }
    }
}