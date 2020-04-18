using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Models;
using SIPx.DataAccess;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ClassificationController : ControllerBase
    {
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationController(IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }
        [HttpGet]
        public async Task<List<AdminClassificationDetails>> Get()
        {
           //var UserId = Request.Headers["UserId"]; 
            var CurrentUser = await _userManager.GetUserAsync(User);
            return await _classificationProvider.GetClassifications(CurrentUser.LanguageID);

        }
        [HttpGet("{Id:int}")]
        public async Task<AdminClassificationDetails> Get(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);

            return await _classificationProvider.GetClassificationById(Id, CurrentUser.LanguageID);

        }
        [HttpPut]
        public AdminClassificationUpdate Put(AdminClassificationUpdate Classification)
        {
//            var CurrentUser = await _userManager.GetUserAsync(User);

             _classificationProvider.PutClassification(Classification);
            return Classification;
        }
    }
}