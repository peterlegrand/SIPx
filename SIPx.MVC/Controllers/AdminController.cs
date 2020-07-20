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
    public class AdminController : Controller
    {
        //private readonly string _baseUrl = "https://localhost:44393/";
        //readonly ServiceClient client = new ServiceClient();

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }
   }
}