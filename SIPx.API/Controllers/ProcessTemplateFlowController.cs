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
    public class ProcessTemplateFlowController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTemplateStageProvider _processTemplateStageProvider;
        private readonly IProcessTemplateFlowProvider _processTemplateFlowProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateFlowController(ICheckProvider checkProvider, IProcessTemplateStageProvider processTemplateStageProvider , IProcessTemplateFlowProvider processTemplateFlowProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _processTemplateStageProvider = processTemplateStageProvider;
            _processTemplateFlowProvider = processTemplateFlowProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTemplateFlowCreateGet> CreateAddDropDownBoxes(ProcessTemplateFlowCreateGet ProcessTemplateFlow, string UserId, int ProcessTemplateId)
        {
            var ProcessTemplateStages = await _processTemplateStageProvider.List(UserId, ProcessTemplateId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ProcessTemplateFlow.LanguageId = UserLanguage.LanguageId;
            ProcessTemplateFlow.LanguageName = UserLanguage.Name;
            ProcessTemplateFlow.ProcessTemplateStages = ProcessTemplateStages;
            ProcessTemplateFlow.ProcessTemplateId = ProcessTemplateId;
            return ProcessTemplateFlow;
        }

        private async Task<ProcessTemplateFlowUpdateGet> UpdateAddDropDownBoxes(ProcessTemplateFlowUpdateGet ProcessTemplateFlow, string UserId, int ProcessTemplateFlowId)
        {

            var Stages = await _processTemplateFlowProvider.UpdateGetStageList(UserId, ProcessTemplateFlowId);
            ProcessTemplateFlow.ProcessTemplateStages = Stages;
            return ProcessTemplateFlow;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTemplateFlow = new ProcessTemplateFlowCreateGet();
                ProcessTemplateFlow = await CreateAddDropDownBoxes(ProcessTemplateFlow, CurrentUser.Id, Id);
                return Ok(ProcessTemplateFlow);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTemplateFlowCreateGet ProcessTemplateFlow)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplateFlow.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateFlowProvider.CreatePostCheck(ProcessTemplateFlow);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateFlow = await CreateAddDropDownBoxes(ProcessTemplateFlow, CurrentUser.Id, ProcessTemplateFlow.ProcessTemplateId);
                }
                else
                {
                    _processTemplateFlowProvider.CreatePost(ProcessTemplateFlow);
                }
                ProcessTemplateFlowCreateGetWithErrorMessages ProcessTemplateFlowWithErrorMessage = new ProcessTemplateFlowCreateGetWithErrorMessages { ProcessTemplateFlow = ProcessTemplateFlow, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateFlowWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateFlowCreateGetWithErrorMessages ProcessTemplateFlowWithNoRights = new ProcessTemplateFlowCreateGetWithErrorMessages { ProcessTemplateFlow = ProcessTemplateFlow, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateFlowWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User); 
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateFlowProvider.IndexGet(CurrentUser.Id, Id));
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
                var ProcessTemplateFlow = await _processTemplateFlowProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTemplateFlow = await UpdateAddDropDownBoxes(ProcessTemplateFlow, CurrentUser.Id, Id);
                return Ok(ProcessTemplateFlow);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateFlowUpdateGet ProcessTemplateFlow)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateFlowProvider.UpdatePostCheck(ProcessTemplateFlow);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateFlow = await UpdateAddDropDownBoxes(ProcessTemplateFlow, CurrentUser.Id,ProcessTemplateFlow.ProcessTemplateFlowId);
                }
                else
                {
                    _processTemplateFlowProvider.UpdatePost(ProcessTemplateFlow);
                }
                ProcessTemplateFlowUpdateGetWithErrorMessages ProcessTemplateFlowWithErrorMessage = new ProcessTemplateFlowUpdateGetWithErrorMessages { ProcessTemplateFlow = ProcessTemplateFlow, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateFlowWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateFlowUpdateGetWithErrorMessages ProcessTemplateFlowWithNoRights = new ProcessTemplateFlowUpdateGetWithErrorMessages { ProcessTemplateFlow = ProcessTemplateFlow, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateFlowWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTemplateFlows", "ProcessTemplateFlowID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTemplateFlowProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTemplateFlowDeleteGet ProcessTemplateFlow)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
               // ProcessTemplateFlow.CreatorId = CurrentUser.Id;
                //var CheckString = await _ProcessTemplateFlowProvider.DeletePostCheck(ProcessTemplateFlow);
                //if (CheckString.Length == 0)
                //{
                _processTemplateFlowProvider.DeletePost(CurrentUser.Id, ProcessTemplateFlow.ProcessTemplateFlowId);
                return Ok(ProcessTemplateFlow);
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
                return Ok(await _processTemplateFlowProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTemplateFlowProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}