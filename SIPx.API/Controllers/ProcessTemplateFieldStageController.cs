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
    public class ProcessTemplateFieldStageController : ControllerBase
    {
        private readonly ProcessTemplateStageFieldProvider _processTemplateStageFieldProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateFieldStageController(ProcessTemplateStageFieldProvider processTemplateStageFieldProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _processTemplateStageFieldProvider = processTemplateStageFieldProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> SFUpdate(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _processTemplateStageFieldProvider.UpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> FSIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _processTemplateStageFieldProvider.IndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        //    [HttpGet("StatusIndex")]
        //    public async Task<IActionResult> StatusIndex()
        //    {
        //        var CurrentUser = await _userManager.GetUserAsync(User);
        //        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //        {
        //            return Ok(await _processTemplateProvider.ProcessTemplateStageFieldStatusIndexGet(CurrentUser.Id));
        //        }
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            Message = "No rights",
        //        });
        //    }
        //    [HttpGet("StatusUpdate/{Id:int}")]
        //    public async Task<IActionResult> StatusUpdate(int Id)
        //    {
        //        var CurrentUser = await _userManager.GetUserAsync(User);
        //        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //        {
        //            return Ok(await _processTemplateProvider.ProcessTemplateStageFieldStatusUpdateGet(CurrentUser.Id, Id));
        //        }
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            Message = "No rights",
        //        });
        //    }
        //}
    }
}