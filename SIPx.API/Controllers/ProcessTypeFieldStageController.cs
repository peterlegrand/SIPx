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
    public class ProcessTypeFieldStageController : ControllerBase
    {
        private readonly IProcessTypeFieldStageProvider _processTypeFieldStageProvider;
        private readonly IProcessTypeStageFieldStatusProvider _processTypeStageFieldStatusProvider;
        private readonly IProcessTypeStageProvider _processTypeStageProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProcessTypeFieldProvider _processTypeFieldProvider;
        private readonly IProcessTypeStageFieldProvider _processTypeStageFieldProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTypeProvider _processTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTypeFieldStageController(IProcessTypeFieldStageProvider processTypeFieldStageProvider, IProcessTypeStageFieldStatusProvider processTypeStageFieldStatusProvider, IProcessTypeStageProvider processTypeStageProvider, IMasterListProvider masterListProvider, IProcessTypeFieldProvider processTypeFieldProvider, IProcessTypeStageFieldProvider processTypeStageFieldProvider, IClaimCheck claimCheck, IProcessTypeProvider processTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _processTypeFieldStageProvider = processTypeFieldStageProvider;
            _processTypeStageFieldStatusProvider = processTypeStageFieldStatusProvider;
            _processTypeStageProvider = processTypeStageProvider;
            _masterListProvider = masterListProvider;
            _processTypeFieldProvider = processTypeFieldProvider;
            _processTypeStageFieldProvider = processTypeStageFieldProvider;
            _claimCheck = claimCheck;
            _processTypeProvider = processTypeProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTypeFieldStageUpdateGet> UpdateAddDropDownBoxes(ProcessTypeFieldStageUpdateGet ProcessTypeFieldStage, string UserId)
        {
            ProcessTypeFieldStage.ValueUpdateTypes = await _masterListProvider.ValueUpdateTypeList(UserId);
            ProcessTypeFieldStage.ProcessTypeStageFieldStatuses = await _masterListProvider.ProcessTypeStageFieldStatusList(UserId);

            return ProcessTypeFieldStage;
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {

                var FieldInfo = new ProcessTypeFieldStageIndexGet();
                var x = await _processTypeFieldProvider.UpdateGet(CurrentUser.Id, Id);
                FieldInfo.ProcessTypeFieldId = x.ProcessTypeFieldId;
                FieldInfo.ProcessTypeFieldName = x.Name;
                var FieldStages = await _processTypeFieldStageProvider.IndexGet(CurrentUser.Id, Id);
                FieldInfo.Stages = FieldStages;
                return Ok(FieldInfo);


               // return Ok(await _processTypeStageFieldProvider.IndexGet(CurrentUser.Id, Id));
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
                var ProcessTypeFieldStage = await _processTypeFieldStageProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTypeFieldStage = await UpdateAddDropDownBoxes(ProcessTypeFieldStage, CurrentUser.Id);
                    return Ok(ProcessTypeFieldStage);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTypeFieldStageUpdateGet ProcessTypeFieldStage)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessTypeFieldStage.ModifierId = CurrentUser.Id;
                //var CheckString = await _PersonProvider.UpdatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _processTypeFieldStageProvider.UpdatePost(ProcessTypeFieldStage);
                return Ok(ProcessTypeFieldStage);
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