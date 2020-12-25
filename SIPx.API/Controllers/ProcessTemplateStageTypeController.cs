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
    public class ProcessTemplateStageTypeController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProcessTemplateStageTypeProvider _processTemplateStageTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectProvider _ProjectProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateStageTypeController(ICheckProvider checkProvider, IMasterListProvider masterListProvider, IProcessTemplateStageTypeProvider ProcessTemplateStageTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProjectProvider ProjectProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _processTemplateStageTypeProvider = ProcessTemplateStageTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _ProjectProvider = ProjectProvider;
            _userManager = userManager;
        }

        private async Task<ProcessTemplateStageTypeCreateGet> CreateAddDropDownBoxes(ProcessTemplateStageTypeCreateGet ProcessTemplateStageType, string UserId)
        {
            var icons = await _masterListProvider.IconList(UserId);
            ProcessTemplateStageType.Icons = icons;
            return ProcessTemplateStageType;
        }

        private async Task<ProcessTemplateStageTypeUpdateGet> UpdateAddDropDownBoxes(ProcessTemplateStageTypeUpdateGet ProcessTemplateStageType, string UserId)
        {
            var icons = await _masterListProvider.IconList(UserId);
            ProcessTemplateStageType.Icons = icons;
            return ProcessTemplateStageType;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTemplateStageType = new ProcessTemplateStageTypeCreateGet();
                ProcessTemplateStageType = await CreateAddDropDownBoxes(ProcessTemplateStageType, CurrentUser.Id);
                return Ok(ProcessTemplateStageType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTemplateStageTypeCreateGet ProcessTemplateStageType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplateStageType.UserId= CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateStageTypeProvider.CreatePostCheck(ProcessTemplateStageType);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateStageType = await CreateAddDropDownBoxes(ProcessTemplateStageType, CurrentUser.Id);
                }
                else
                {
                    _processTemplateStageTypeProvider.CreatePost(ProcessTemplateStageType);
                }
                ProcessTemplateStageTypeCreateGetWithErrorMessages ProcessTemplateStageTypeWithErrorMessage = new ProcessTemplateStageTypeCreateGetWithErrorMessages { ProcessTemplateStageType = ProcessTemplateStageType, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateStageTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateStageTypeCreateGetWithErrorMessages ProcessTemplateStageTypeWithNoRights = new ProcessTemplateStageTypeCreateGetWithErrorMessages { ProcessTemplateStageType = ProcessTemplateStageType, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateStageTypeWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateStageTypeProvider.IndexGet(CurrentUser.Id));
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
                var ProcessTemplateStageType = await _processTemplateStageTypeProvider.UpdateGet(CurrentUser.Id, Id);

                ProcessTemplateStageType = await UpdateAddDropDownBoxes(ProcessTemplateStageType, CurrentUser.Id);
                return Ok(ProcessTemplateStageType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateStageTypeUpdateGet ProcessTemplateStageType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateStageTypeProvider.UpdatePostCheck(ProcessTemplateStageType);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateStageType = await UpdateAddDropDownBoxes(ProcessTemplateStageType, CurrentUser.Id);
                }
                else
                {
                    _processTemplateStageTypeProvider.UpdatePost(ProcessTemplateStageType);
                }
                ProcessTemplateStageTypeUpdateGetWithErrorMessages ProcessTemplateStageTypeWithErrorMessage = new ProcessTemplateStageTypeUpdateGetWithErrorMessages { ProcessTemplateStageType = ProcessTemplateStageType, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateStageTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateStageTypeUpdateGetWithErrorMessages ProcessTemplateStageTypeWithNoRights = new ProcessTemplateStageTypeUpdateGetWithErrorMessages { ProcessTemplateStageType = ProcessTemplateStageType, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateStageTypeWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTemplateStageTypes", "ProcessTemplateStageTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTemplateStageTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTemplateStageTypeDeleteGet ProcessTemplateStageType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessTemplateStageType.UserId= CurrentUser.Id;
                //var CheckString = await _ProcessTemplateStageTypeProvider.DeletePostCheck(ProcessTemplateStageType);
                //if (CheckString.Length == 0)
                //{
                _processTemplateStageTypeProvider.DeletePost(CurrentUser.Id, ProcessTemplateStageType.ProcessTemplateStageTypeId);
                return Ok(ProcessTemplateStageType);
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
                return Ok(await _processTemplateStageTypeProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTemplateStageTypeProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}