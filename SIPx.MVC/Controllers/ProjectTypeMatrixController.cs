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
    public class ProjectTypeMatrixController : Controller
    {


        //PETER TODO put base url somewhere central
        readonly ServiceClient _client = new ServiceClient();
        private readonly IConfiguration _configuration;
        private readonly IWebHostEnvironment _hostingEnv;
        public ProjectTypeMatrixController(IWebHostEnvironment env, IConfiguration configuration)
        {
            _configuration = configuration;
            _hostingEnv = env;
        }

        [HttpGet]
        public async Task<IActionResult> Create(int Id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");            
                    }
            var response = await _client.GetProtectedAsync2<ProjectTypeMatrixCreateGet>($"{_configuration["APIUrl"]}api/ProjectTypeMatrix/Create/" + Id, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectTypeMatrix/Create", token);
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
        public async Task<IActionResult> Create(ProjectTypeMatrixCreateGet ProjectTypeMatrix)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var ProjectTypeMatrixCreateGetWithErrorMessage = await _client.PostProtectedAsync<ProjectTypeMatrixCreateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/ProjectTypeMatrix/Create", ProjectTypeMatrix, token);
            if (ProjectTypeMatrixCreateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectTypeMatrix/Create", token);
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.ErrorMessages = ProjectTypeMatrixCreateGetWithErrorMessage.ErrorMessages;
                ViewBag.Env = _hostingEnv.EnvironmentName;
                return View(ProjectTypeMatrixCreateGetWithErrorMessage.ProjectTypeMatrix);
            }
                return RedirectToAction("Index", new { id = ProjectTypeMatrix.FromProjectTypeId });
        }

        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<ProjectTypeMatrixIndexGet>($"{_configuration["APIUrl"]}api/ProjectTypeMatrix/Index/" + id, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectTypeMatrix/Index", token);
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
        public async Task<IActionResult> Edit(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<ProjectTypeMatrixUpdateGet>($"{_configuration["APIUrl"]}api/ProjectTypeMatrix/Update/" + id, token);
            ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectTypeMatrix/Edit", token);
            ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBag.ErrorMessages = new List<ErrorMessage>();
            ViewBag.Env = _hostingEnv.EnvironmentName;
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
        public async Task<IActionResult> Edit(ProjectTypeMatrixUpdateGet ProjectTypeMatrix)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var ProjectTypeMatrixUpdateGetWithErrorMessage = await _client.PostProtectedAsync<ProjectTypeMatrixUpdateGetWithErrorMessages>($"{_configuration["APIUrl"]}api/ProjectTypeMatrix/Update", ProjectTypeMatrix, token);
            if (ProjectTypeMatrixUpdateGetWithErrorMessage.ErrorMessages.Count > 0)
            {
                ViewBag.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectTypeMatrix/Edit", token);
                ViewBag.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{_configuration["APIUrl"]}api/MVCFavorite/Menu", token);
                ViewBag.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{_configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
                ViewBag.ErrorMessages = ProjectTypeMatrixUpdateGetWithErrorMessage.ErrorMessages;
                ViewBag.Env = _hostingEnv.EnvironmentName;
                return View(ProjectTypeMatrixUpdateGetWithErrorMessage.ProjectTypeMatrix);
            }
            if (ProjectTypeMatrix.IsFrom)
            {
                return RedirectToAction("Index", new { id = ProjectTypeMatrix.FromProjectTypeId });
            }
            else
            {
                return RedirectToAction("Index", new { id = ProjectTypeMatrix.ToProjectTypeId });
            }
        }

        [HttpGet]
        public async Task<IActionResult> Delete(int id)
        {
            var token = HttpContext.Session.GetString("Token");
            if(token == null)
            { return RedirectToAction("Login","FrontAuth");
            }
            var response = await _client.GetProtectedAsync2<ProjectTypeMatrixDeleteGet>($"{_configuration["APIUrl"]}api/ProjectTypeMatrix/Delete/" + id, token);
            ViewBag.UITerms  = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{_configuration["APIUrl"]}api/MVC/ProjectTypeMatrix/Delete", token);
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
        public async Task<IActionResult> Delete(ProjectTypeMatrixDeleteGet ProjectTypeMatrix)
        {
            var token = HttpContext.Session.GetString("Token");if(token == null){ return RedirectToAction("Login","FrontAuth");}
            await _client.PostProtectedAsync<ProjectTypeMatrixDeleteGet>($"{_configuration["APIUrl"]}api/ProjectTypeMatrix/Delete", ProjectTypeMatrix, token);
            if (ProjectTypeMatrix.IsFrom)
            {
                return RedirectToAction("Index", new { id = ProjectTypeMatrix.FromProjectTypeId });
            }
            else
            {
                return RedirectToAction("Index", new { id = ProjectTypeMatrix.ToProjectTypeId });
            }

        }
    }
}