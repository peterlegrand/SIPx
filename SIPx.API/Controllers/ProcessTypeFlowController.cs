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
    public class ProcessTypeFlowController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTypeStageProvider _processTypeStageProvider;
        private readonly IProcessTypeFlowProvider _processTypeFlowProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTypeProvider _processTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTypeFlowController(ICheckProvider checkProvider, IProcessTypeStageProvider processTypeStageProvider , IProcessTypeFlowProvider processTypeFlowProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTypeProvider processTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _processTypeStageProvider = processTypeStageProvider;
            _processTypeFlowProvider = processTypeFlowProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTypeProvider = processTypeProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTypeFlowCreateGet> CreateAddDropDownBoxes(ProcessTypeFlowCreateGet ProcessTypeFlow, string UserId, int ProcessTypeId)
        {
            var ProcessTypeStages = await _processTypeStageProvider.List(UserId, ProcessTypeId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ProcessTypeFlow.LanguageId = UserLanguage.LanguageId;
            ProcessTypeFlow.LanguageName = UserLanguage.Name;
            ProcessTypeFlow.ProcessTypeStages = ProcessTypeStages;
            ProcessTypeFlow.ProcessTypeId = ProcessTypeId;
            return ProcessTypeFlow;
        }

        private async Task<ProcessTypeFlowUpdateGet> UpdateAddDropDownBoxes(ProcessTypeFlowUpdateGet ProcessTypeFlow, string UserId, int ProcessTypeFlowId)
        {

            var Stages = await _processTypeFlowProvider.UpdateGetStageList(UserId, ProcessTypeFlowId);
            ProcessTypeFlow.ProcessTypeStages = Stages;
            return ProcessTypeFlow;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTypeFlow = new ProcessTypeFlowCreateGet();
                ProcessTypeFlow = await CreateAddDropDownBoxes(ProcessTypeFlow, CurrentUser.Id, Id);
                return Ok(ProcessTypeFlow);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTypeFlowCreateGet ProcessTypeFlow)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTypeFlow.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeFlowProvider.CreatePostCheck(ProcessTypeFlow);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeFlow = await CreateAddDropDownBoxes(ProcessTypeFlow, CurrentUser.Id, ProcessTypeFlow.ProcessTypeId);
                }
                else
                {
                    _processTypeFlowProvider.CreatePost(ProcessTypeFlow);
                }
                ProcessTypeFlowCreateGetWithErrorMessages ProcessTypeFlowWithErrorMessage = new ProcessTypeFlowCreateGetWithErrorMessages { ProcessTypeFlow = ProcessTypeFlow, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeFlowWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeFlowCreateGetWithErrorMessages ProcessTypeFlowWithNoRights = new ProcessTypeFlowCreateGetWithErrorMessages { ProcessTypeFlow = ProcessTypeFlow, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeFlowWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User); 
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTypeFlowProvider.IndexGet(CurrentUser.Id, Id));
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
                var ProcessTypeFlow = await _processTypeFlowProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTypeFlow = await UpdateAddDropDownBoxes(ProcessTypeFlow, CurrentUser.Id, Id);
                return Ok(ProcessTypeFlow);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTypeFlowUpdateGet ProcessTypeFlow)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeFlowProvider.UpdatePostCheck(ProcessTypeFlow);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeFlow = await UpdateAddDropDownBoxes(ProcessTypeFlow, CurrentUser.Id,ProcessTypeFlow.ProcessTypeFlowId);
                }
                else
                {
                    _processTypeFlowProvider.UpdatePost(ProcessTypeFlow);
                }
                ProcessTypeFlowUpdateGetWithErrorMessages ProcessTypeFlowWithErrorMessage = new ProcessTypeFlowUpdateGetWithErrorMessages { ProcessTypeFlow = ProcessTypeFlow, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeFlowWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeFlowUpdateGetWithErrorMessages ProcessTypeFlowWithNoRights = new ProcessTypeFlowUpdateGetWithErrorMessages { ProcessTypeFlow = ProcessTypeFlow, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeFlowWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTypeFlows", "ProcessTypeFlowID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTypeFlowProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTypeFlowDeleteGet ProcessTypeFlow)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
               // ProcessTypeFlow.CreatorId = CurrentUser.Id;
                //var CheckString = await _ProcessTypeFlowProvider.DeletePostCheck(ProcessTypeFlow);
                //if (CheckString.Length == 0)
                //{
                _processTypeFlowProvider.DeletePost(CurrentUser.Id, ProcessTypeFlow.ProcessTypeFlowId);
                return Ok(ProcessTypeFlow);
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

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> LanguageIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTypeFlowProvider.LanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> LanguageUpdate(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTypeFlowProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}