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
    public class ProcessTypeStageController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTypeStageProvider _processTypeStageProvider;
        private readonly IProcessTypeStageTypeProvider _processTypeStageTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTypeProvider _processTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTypeStageController(ICheckProvider checkProvider, IProcessTypeStageProvider processTypeStageProvider, IProcessTypeStageTypeProvider processTypeStageTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTypeProvider processTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _processTypeStageProvider = processTypeStageProvider;
            _processTypeStageTypeProvider = processTypeStageTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTypeProvider = processTypeProvider;
            _userManager = userManager;
        }

        private async Task<ProcessTypeStageCreateGet> CreateAddDropDownBoxes(ProcessTypeStageCreateGet ProcessTypeStage, string UserId, int ProcessTypeId)
        {
            var ProcessTypeStageTypes = await _processTypeStageTypeProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ProcessTypeStage.LanguageName = UserLanguage.Name;
            ProcessTypeStage.ProcessTypeStageTypes = ProcessTypeStageTypes;
            ProcessTypeStage.ProcessTypeId = ProcessTypeId;

            return ProcessTypeStage;
        }

        private async Task<ProcessTypeStageUpdateGet> UpdateAddDropDownBoxes(ProcessTypeStageUpdateGet ProcessTypeStage, string UserId)
        {
            var ProcessTypeStageTypes = await _processTypeStageTypeProvider.List(UserId);
            ProcessTypeStage.ProcessTypeStageTypes = ProcessTypeStageTypes;
            return ProcessTypeStage;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTypeStage = new ProcessTypeStageCreateGet();
                ProcessTypeStage = await CreateAddDropDownBoxes(ProcessTypeStage, CurrentUser.Id, Id);
                return Ok(ProcessTypeStage);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTypeStageCreateGet ProcessTypeStage)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTypeStage.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeStageProvider.CreatePostCheck(ProcessTypeStage);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeStage = await CreateAddDropDownBoxes(ProcessTypeStage, CurrentUser.Id, ProcessTypeStage.ProcessTypeId);
                }
                else
                {
                    _processTypeStageProvider.CreatePost(ProcessTypeStage);
                }
                ProcessTypeStageCreateGetWithErrorMessages ProcessTypeStageWithErrorMessage = new ProcessTypeStageCreateGetWithErrorMessages { ProcessTypeStage = ProcessTypeStage, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeStageWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeStageCreateGetWithErrorMessages ProcessTypeStageWithNoRights = new ProcessTypeStageCreateGetWithErrorMessages { ProcessTypeStage = ProcessTypeStage, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeStageWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTypeStageProvider.IndexGet(CurrentUser.Id, Id));
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
                var ProcessTypeStage = await _processTypeStageProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTypeStage = await UpdateAddDropDownBoxes(ProcessTypeStage, CurrentUser.Id);
                return Ok(ProcessTypeStage);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTypeStageUpdateGet ProcessTypeStage)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeStageProvider.UpdatePostCheck(ProcessTypeStage);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeStage = await UpdateAddDropDownBoxes(ProcessTypeStage, CurrentUser.Id);
                }
                else
                {
                    _processTypeStageProvider.UpdatePost(ProcessTypeStage);
                }
                ProcessTypeStageUpdateGetWithErrorMessages ProcessTypeStageWithErrorMessage = new ProcessTypeStageUpdateGetWithErrorMessages { ProcessTypeStage = ProcessTypeStage, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeStageWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeStageUpdateGetWithErrorMessages ProcessTypeStageWithNoRights = new ProcessTypeStageUpdateGetWithErrorMessages { ProcessTypeStage = ProcessTypeStage, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeStageWithNoRights);
            

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTypeStages", "ProcessTypeStageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTypeStageProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTypeStageDeleteGet ProcessTypeStage)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessTypeStage.UserId= CurrentUser.Id;
                //var CheckString = await _ProcessTypeStageProvider.DeletePostCheck(ProcessTypeStage);
                //if (CheckString.Length == 0)
                //{
                _processTypeStageProvider.DeletePost(CurrentUser.Id,ProcessTypeStage.ProcessTypeStageId);
                return Ok(ProcessTypeStage);
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
                return Ok(await _processTypeStageProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTypeStageProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}