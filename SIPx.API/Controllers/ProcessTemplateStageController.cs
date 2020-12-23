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
    public class ProcessTemplateStageController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTemplateStageProvider _processTemplateStageProvider;
        private readonly IProcessTemplateStageTypeProvider _processTemplateStageTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateStageController(ICheckProvider checkProvider, IProcessTemplateStageProvider processTemplateStageProvider, IProcessTemplateStageTypeProvider processTemplateStageTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _processTemplateStageProvider = processTemplateStageProvider;
            _processTemplateStageTypeProvider = processTemplateStageTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
        }

        private async Task<ProcessTemplateStageCreateGet> CreateAddDropDownBoxes(ProcessTemplateStageCreateGet ProcessTemplateStage, string UserId, int ProcessTemplateId)
        {
            var ProcessTemplateStageTypes = await _processTemplateStageTypeProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ProcessTemplateStage.LanguageName = UserLanguage.Name;
            ProcessTemplateStage.ProcessTemplateStageTypes = ProcessTemplateStageTypes;
            ProcessTemplateStage.ProcessTemplateId = ProcessTemplateId;

            return ProcessTemplateStage;
        }

        private async Task<ProcessTemplateStageUpdateGet> UpdateAddDropDownBoxes(ProcessTemplateStageUpdateGet ProcessTemplateStage, string UserId)
        {
            var ProcessTemplateStageTypes = await _processTemplateStageTypeProvider.List(UserId);
            ProcessTemplateStage.ProcessTemplateStageTypes = ProcessTemplateStageTypes;
            return ProcessTemplateStage;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTemplateStage = new ProcessTemplateStageCreateGet();
                ProcessTemplateStage = await CreateAddDropDownBoxes(ProcessTemplateStage, CurrentUser.Id, Id);
                return Ok(ProcessTemplateStage);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTemplateStageCreateGet ProcessTemplateStage)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplateStage.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateStageProvider.CreatePostCheck(ProcessTemplateStage);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateStage = await CreateAddDropDownBoxes(ProcessTemplateStage, CurrentUser.Id, ProcessTemplateStage.ProcessTemplateId);
                }
                else
                {
                    _processTemplateStageProvider.CreatePost(ProcessTemplateStage);
                }
                ProcessTemplateStageCreateGetWithErrorMessages ProcessTemplateStageWithErrorMessage = new ProcessTemplateStageCreateGetWithErrorMessages { ProcessTemplateStage = ProcessTemplateStage, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateStageWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateStageCreateGetWithErrorMessages ProcessTemplateStageWithNoRights = new ProcessTemplateStageCreateGetWithErrorMessages { ProcessTemplateStage = ProcessTemplateStage, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateStageWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateStageProvider.IndexGet(CurrentUser.Id, Id));
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
                var ProcessTemplateStage = await _processTemplateStageProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTemplateStage = await UpdateAddDropDownBoxes(ProcessTemplateStage, CurrentUser.Id);
                return Ok(ProcessTemplateStage);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateStageUpdateGet ProcessTemplateStage)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateStageProvider.UpdatePostCheck(ProcessTemplateStage);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateStage = await UpdateAddDropDownBoxes(ProcessTemplateStage, CurrentUser.Id);
                }
                else
                {
                    _processTemplateStageProvider.UpdatePost(ProcessTemplateStage);
                }
                ProcessTemplateStageUpdateGetWithErrorMessages ProcessTemplateStageWithErrorMessage = new ProcessTemplateStageUpdateGetWithErrorMessages { ProcessTemplateStage = ProcessTemplateStage, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateStageWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateStageUpdateGetWithErrorMessages ProcessTemplateStageWithNoRights = new ProcessTemplateStageUpdateGetWithErrorMessages { ProcessTemplateStage = ProcessTemplateStage, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateStageWithNoRights);
            

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTemplateStages", "ProcessTemplateStageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTemplateStageProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTemplateStageDeleteGet ProcessTemplateStage)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessTemplateStage.UserId= CurrentUser.Id;
                //var CheckString = await _ProcessTemplateStageProvider.DeletePostCheck(ProcessTemplateStage);
                //if (CheckString.Length == 0)
                //{
                _processTemplateStageProvider.DeletePost(ProcessTemplateStage.ProcessTemplateStageId);
                return Ok(ProcessTemplateStage);
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
                return Ok(await _processTemplateStageProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTemplateStageProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}