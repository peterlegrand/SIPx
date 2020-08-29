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
using SIPx.Shared;
using SIPx.DataAccess;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class ContentTypeClassificationController : ControllerBase
    {
        private readonly IMasterListProvider _masterListProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IContentMasterProvider _contentMasterProvider;
        private readonly UserManager<SipUser> _userManager;

        public ContentTypeClassificationController(IMasterListProvider masterListProvider, ISecurityLevelProvider securityLevelProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IContentMasterProvider contentMasterProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterListProvider = masterListProvider;
            _securityLevelProvider = securityLevelProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _contentMasterProvider = contentMasterProvider;
            _userManager = userManager;
        }


        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _contentMasterProvider.ContentTypeClassificationIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _contentMasterProvider.ContentTypeClassificationUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        //[HttpGet("ContentTypeClassificationStatuses")]
        //public async Task<IActionResult> GetContentTypeClassificationStatuses()
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentMasterProvider.ContentTypeClassificationStatusIndexGet(CurrentUser.Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("ContentTypeClassificationStatus/{Id:int}")]
        //public async Task<IActionResult> GetContentTypeClassificationStatus(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _contentMasterProvider.ContentTypeClassificationStatusUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

      
    }
}