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
        private readonly IProcessTemplateFieldStageProvider _processTemplateFieldStageProvider;
        private readonly IProcessTemplateStageFieldStatusProvider _processTemplateStageFieldStatusProvider;
        private readonly IProcessTemplateStageProvider _processTemplateStageProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProcessTemplateFieldProvider _processTemplateFieldProvider;
        private readonly IProcessTemplateStageFieldProvider _processTemplateStageFieldProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateFieldStageController(IProcessTemplateFieldStageProvider processTemplateFieldStageProvider, IProcessTemplateStageFieldStatusProvider processTemplateStageFieldStatusProvider, IProcessTemplateStageProvider processTemplateStageProvider, IMasterListProvider masterListProvider, IProcessTemplateFieldProvider processTemplateFieldProvider, IProcessTemplateStageFieldProvider processTemplateStageFieldProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _processTemplateFieldStageProvider = processTemplateFieldStageProvider;
            _processTemplateStageFieldStatusProvider = processTemplateStageFieldStatusProvider;
            _processTemplateStageProvider = processTemplateStageProvider;
            _masterListProvider = masterListProvider;
            _processTemplateFieldProvider = processTemplateFieldProvider;
            _processTemplateStageFieldProvider = processTemplateStageFieldProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {

                var FieldInfo = new ProcessTemplateFieldStageIndexGet();
                var x = await _processTemplateFieldProvider.UpdateGet(CurrentUser.Id, Id);
                FieldInfo.ProcessTemplateFieldId = x.ProcessTemplateFieldId;
                FieldInfo.ProcessTemplateFieldName = x.Name;
                var FieldStages = await _processTemplateFieldStageProvider.IndexGet(CurrentUser.Id, Id);
                FieldInfo.Stages = FieldStages;
                return Ok(FieldInfo);


               // return Ok(await _processTemplateStageFieldProvider.IndexGet(CurrentUser.Id, Id));
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
                var x = await _processTemplateFieldStageProvider.UpdateGet(CurrentUser.Id, Id);
                x.ValueUpdateTypes = await _masterListProvider.ValueUpdateTypeList(CurrentUser.Id);
                x.ProcessTemplateStageFieldStatuses = await _masterListProvider.ProcessTemplateStageFieldStatusList(CurrentUser.Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateFieldStageUpdateGet ProcessTemplateFieldStage)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ProcessTemplateFieldStage.ModifierId = CurrentUser.Id;
                //var CheckString = await _PersonProvider.UpdatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _processTemplateFieldStageProvider.UpdatePost(ProcessTemplateFieldStage);
                return Ok(ProcessTemplateFieldStage);
                //}
                return BadRequest(new
                {
                    IsSuccess = false,
                    //Message = CheckString,
                });

            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

    }
}