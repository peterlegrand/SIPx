using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class ContentController : ControllerBase
    {
        private  IClaimCheck _claimCheck;
        private readonly IContentProvider _contentProvider;
        private readonly UserManager<SipUser> _userManager;

        public ContentController(IClaimCheck claimCheck, IContentProvider ContentProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _claimCheck = claimCheck;
            _contentProvider = ContentProvider;
            _userManager = userManager;
        }
        [HttpGet]

        public async Task<IActionResult> Get()
        {

            var CurrentUser = await _userManager.GetUserAsync(User);

            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "5"))
            {
                //TOFIX PETER
                return Ok(await _contentProvider.GetContents(CurrentUser.Id));// CurrentUser.LanguageID));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }
        [HttpGet("ContentType")]
        public async Task<IActionResult> ContentType()
        {

            var CurrentUser = await _userManager.GetUserAsync(User);

            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "5"))
            {
                //TOFIX PETER
                return Ok(await _contentProvider.GetContentTypes(CurrentUser.Id));// CurrentUser.LanguageID));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }
        
        
        //        [HttpGet("{Id:int}")]
        //        public async Task<ClassificationViewGet> Get(int Id)
        //        {
        //            var CurrentUser = await _userManager.GetUserAsync(User);

        //            return await _classificationProvider.GetClassificationById(Id, 1);// CurrentUser.LanguageID));

        //        }
        //        [HttpPut]
        //        public ClassificationUpdatePut Put(ClassificationUpdatePut Classification)
        //        {

        ////            var CurrentUser = await _userManager.GetUserAsync(User);

        //             _classificationProvider.PutClassification(Classification);
        //            return Classification;
        //        }
    }
}