using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
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
    //[Authorize]
    public class ClassificationController : ControllerBase
    {
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationController(IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }
        [HttpGet]

        public async Task<IActionResult> Get()
        {
    
            var CurrentUser = await _userManager.GetUserAsync(User);

            if ( await _claimCheck.CheckClaim(CurrentUser, "ClassificationRead"))
            {
                return Ok(await _classificationProvider.GetClassifications(CurrentUser.LanguageID));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }
        [HttpGet("{Id:int}")]
        public async Task<ClassificationViewGet> Get(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);

            return await _classificationProvider.GetClassificationById(Id, CurrentUser.LanguageID);

        }
        [HttpPut]
        public ClassificationUpdatePut Put(ClassificationUpdatePut Classification)
        {
            
//            var CurrentUser = await _userManager.GetUserAsync(User);

             _classificationProvider.PutClassification(Classification);
            return Classification;
        }
    }
}