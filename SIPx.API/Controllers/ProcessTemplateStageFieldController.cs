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
        private readonly ICheckProvider _checkProvider;
        private readonly IValueUpdateTypeProvider _valueUpdateTypeProvider;
        private readonly IProcessTemplateStageProvider _processTemplateStageProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProcessTemplateFieldProvider _processTemplateFieldProvider;
        private readonly IProcessTemplateStageFieldStatusProvider _processTemplateStageFieldStatusProvider;
        private readonly IProcessTemplateStageFieldProvider _processTemplateStageFieldProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateStageFieldController(ICheckProvider checkProvider, IValueUpdateTypeProvider valueUpdateTypeProvider, IProcessTemplateStageProvider processTemplateStageProvider, IMasterListProvider masterListProvider, IProcessTemplateFieldProvider processTemplateFieldProvider, IProcessTemplateStageFieldStatusProvider processTemplateStageFieldStatus, IProcessTemplateStageFieldProvider processTemplateStageFieldProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _valueUpdateTypeProvider = valueUpdateTypeProvider;
            _processTemplateStageProvider = processTemplateStageProvider;
            _masterListProvider = masterListProvider;
            _processTemplateFieldProvider = processTemplateFieldProvider;
            _processTemplateStageFieldStatusProvider = processTemplateStageFieldStatus;
            _processTemplateStageFieldProvider = processTemplateStageFieldProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTemplateStageFieldUpdateGet> UpdateAddDropDownBoxes(ProcessTemplateStageFieldUpdateGet ProcessTemplateStageField, string UserId)
        {
            var status = await _processTemplateStageFieldStatusProvider.List(UserId);
            var updateType = await _valueUpdateTypeProvider.List(UserId);
            var Sequence = await _processTemplateStageFieldProvider.Sequence(UserId, ProcessTemplateStageField.ProcessTemplateStageId);
            ProcessTemplateStageField.ValueUpdateTypes = await _masterListProvider.ValueUpdateTypeList(UserId);
            ProcessTemplateStageField.ProcessTemplateStageFieldStatuses = await _masterListProvider.ProcessTemplateStageFieldStatusList(UserId);
         
            ProcessTemplateStageField.ProcessTemplateFields = Sequence;
            return ProcessTemplateStageField;
        }
        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var StageInfo = new ProcessTemplateStageFieldIndexGet();
                var x = await _processTemplateStageProvider.UpdateGet(CurrentUser.Id, Id);
                StageInfo.ProcessTemplateStageId = x.ProcessTemplateStageId;
                StageInfo.ProcessTemplateStageName = x.Name;
                var StageFields = await _processTemplateStageFieldProvider.IndexGet(CurrentUser.Id, Id);
                StageInfo.Fields = StageFields;
                return Ok(StageInfo);
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTemplateStageField = await _processTemplateStageFieldProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTemplateStageField = await UpdateAddDropDownBoxes(ProcessTemplateStageField, CurrentUser.Id);
                return Ok(ProcessTemplateStageField);
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
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateStageFieldProvider.UpdatePostCheck(ProcessTemplateStageField);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateStageField = await UpdateAddDropDownBoxes(ProcessTemplateStageField, CurrentUser.Id);
                }
                else
                {
                    _processTemplateStageFieldProvider.UpdatePost(ProcessTemplateStageField);
                }
                ProcessTemplateStageFieldUpdateGetWithErrorMessages ProcessTemplateStageFieldWithErrorMessage = new ProcessTemplateStageFieldUpdateGetWithErrorMessages { ProcessTemplateStageField = ProcessTemplateStageField, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateStageFieldWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateStageFieldUpdateGetWithErrorMessages ProcessTemplateStageFieldWithNoRights = new ProcessTemplateStageFieldUpdateGetWithErrorMessages { ProcessTemplateStageField = ProcessTemplateStageField, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateStageFieldWithNoRights);
        }
    }
}