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
    public class ProcessTemplateStageFieldController : ControllerBase
    {
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProcessTemplateFieldProvider _processTemplateFieldProvider;
        private readonly IProcessTemplateStageFieldStatusProvider _processTemplateStageFieldStatus;
        private readonly IProcessTemplateStageFieldProvider _processTemplateStageFieldProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateStageFieldController(IMasterListProvider masterListProvider, IProcessTemplateFieldProvider processTemplateFieldProvider, IProcessTemplateStageFieldStatusProvider processTemplateStageFieldStatus, IProcessTemplateStageFieldProvider processTemplateStageFieldProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterListProvider = masterListProvider;
            _processTemplateFieldProvider = processTemplateFieldProvider;
            _processTemplateStageFieldStatus = processTemplateStageFieldStatus;
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
                return Ok(await _processTemplateStageFieldProvider.IndexGet(CurrentUser.Id, Id));
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
                var x = await _processTemplateStageFieldProvider.UpdateGet(CurrentUser.Id, Id);

                //PETER TODO this need to be active again to fill dropdowns
                //var status = await _processTemplateStageFieldStatus.List(CurrentUser.Id);
                //var updateType = await _processTemplateStageFieldProvider.UpdateGetValueUpdateTypeList(CurrentUser.Id);
                var Sequence = await _processTemplateFieldProvider.List(CurrentUser.Id, x.ProcessTemplateId);
                x.ValueUpdateTypes = await _masterListProvider.ValueUpdateTypeList(CurrentUser.Id);
                x.ProcessTemplateStageFieldStatuses= await _masterListProvider.ProcessTemplateStageFieldStatusList(CurrentUser.Id);
                //x.ProcessTemplateStageFieldStatuses = status;
                //x.ValueUpdateTypes = updateType;
                x.ProcessTemplateFields = Sequence;
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateStageFieldUpdateGet ProcessTemplateStageField)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ProcessTemplateStageField.UserId = CurrentUser.Id;
                //var CheckString = await _PersonProvider.UpdatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _processTemplateStageFieldProvider.UpdatePost(ProcessTemplateStageField);
                return Ok(ProcessTemplateStageField);
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