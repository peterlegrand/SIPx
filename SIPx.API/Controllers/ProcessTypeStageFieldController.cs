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
    public class ProcessTypeStageFieldController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IValueUpdateTypeProvider _valueUpdateTypeProvider;
        private readonly IProcessTypeStageProvider _processTypeStageProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProcessTypeFieldProvider _processTypeFieldProvider;
        private readonly IProcessTypeStageFieldStatusProvider _processTypeStageFieldStatusProvider;
        private readonly IProcessTypeStageFieldProvider _processTypeStageFieldProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTypeProvider _processTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTypeStageFieldController(ICheckProvider checkProvider, IValueUpdateTypeProvider valueUpdateTypeProvider, IProcessTypeStageProvider processTypeStageProvider, IMasterListProvider masterListProvider, IProcessTypeFieldProvider processTypeFieldProvider, IProcessTypeStageFieldStatusProvider processTypeStageFieldStatus, IProcessTypeStageFieldProvider processTypeStageFieldProvider, IClaimCheck claimCheck, IProcessTypeProvider processTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _valueUpdateTypeProvider = valueUpdateTypeProvider;
            _processTypeStageProvider = processTypeStageProvider;
            _masterListProvider = masterListProvider;
            _processTypeFieldProvider = processTypeFieldProvider;
            _processTypeStageFieldStatusProvider = processTypeStageFieldStatus;
            _processTypeStageFieldProvider = processTypeStageFieldProvider;
            _claimCheck = claimCheck;
            _processTypeProvider = processTypeProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTypeStageFieldUpdateGet> UpdateAddDropDownBoxes(ProcessTypeStageFieldUpdateGet ProcessTypeStageField, string UserId)
        {
            var status = await _processTypeStageFieldStatusProvider.List(UserId);
            var updateType = await _valueUpdateTypeProvider.List(UserId);
            var Sequence = await _processTypeStageFieldProvider.Sequence(UserId, ProcessTypeStageField.ProcessTypeStageId);
            ProcessTypeStageField.ValueUpdateTypes = await _masterListProvider.ValueUpdateTypeList(UserId);
            ProcessTypeStageField.ProcessTypeStageFieldStatuses = await _masterListProvider.ProcessTypeStageFieldStatusList(UserId);
         
            ProcessTypeStageField.ProcessTypeFields = Sequence;
            return ProcessTypeStageField;
        }
        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var StageInfo = new ProcessTypeStageFieldIndexGet();
                var x = await _processTypeStageProvider.UpdateGet(CurrentUser.Id, Id);
                StageInfo.ProcessTypeStageId = x.ProcessTypeStageId;
                StageInfo.ProcessTypeStageName = x.Name;
                var StageFields = await _processTypeStageFieldProvider.IndexGet(CurrentUser.Id, Id);
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
                var ProcessTypeStageField = await _processTypeStageFieldProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTypeStageField = await UpdateAddDropDownBoxes(ProcessTypeStageField, CurrentUser.Id);
                return Ok(ProcessTypeStageField);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTypeStageFieldUpdateGet ProcessTypeStageField)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeStageFieldProvider.UpdatePostCheck(ProcessTypeStageField);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeStageField = await UpdateAddDropDownBoxes(ProcessTypeStageField, CurrentUser.Id);
                }
                else
                {
                    _processTypeStageFieldProvider.UpdatePost(ProcessTypeStageField);
                }
                ProcessTypeStageFieldUpdateGetWithErrorMessages ProcessTypeStageFieldWithErrorMessage = new ProcessTypeStageFieldUpdateGetWithErrorMessages { ProcessTypeStageField = ProcessTypeStageField, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeStageFieldWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeStageFieldUpdateGetWithErrorMessages ProcessTypeStageFieldWithNoRights = new ProcessTypeStageFieldUpdateGetWithErrorMessages { ProcessTypeStageField = ProcessTypeStageField, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeStageFieldWithNoRights);
        }
    }
}