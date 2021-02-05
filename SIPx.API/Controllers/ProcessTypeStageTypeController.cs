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
    public class ProcessTypeStageTypeController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProcessTypeStageTypeProvider _processTypeStageTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectProvider _ProjectProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTypeStageTypeController(ICheckProvider checkProvider, IMasterListProvider masterListProvider, IProcessTypeStageTypeProvider ProcessTypeStageTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProjectProvider ProjectProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _processTypeStageTypeProvider = ProcessTypeStageTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _ProjectProvider = ProjectProvider;
            _userManager = userManager;
        }

        private async Task<ProcessTypeStageTypeCreateGet> CreateAddDropDownBoxes(ProcessTypeStageTypeCreateGet ProcessTypeStageType, string UserId)
        {
            var icons = await _masterListProvider.IconList(UserId);
            ProcessTypeStageType.Icons = icons;
            return ProcessTypeStageType;
        }

        private async Task<ProcessTypeStageTypeUpdateGet> UpdateAddDropDownBoxes(ProcessTypeStageTypeUpdateGet ProcessTypeStageType, string UserId)
        {
            var icons = await _masterListProvider.IconList(UserId);
            ProcessTypeStageType.Icons = icons;
            return ProcessTypeStageType;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTypeStageType = new ProcessTypeStageTypeCreateGet();
                ProcessTypeStageType = await CreateAddDropDownBoxes(ProcessTypeStageType, CurrentUser.Id);
                return Ok(ProcessTypeStageType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTypeStageTypeCreateGet ProcessTypeStageType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTypeStageType.UserId= CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeStageTypeProvider.CreatePostCheck(ProcessTypeStageType);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeStageType = await CreateAddDropDownBoxes(ProcessTypeStageType, CurrentUser.Id);
                }
                else
                {
                    _processTypeStageTypeProvider.CreatePost(ProcessTypeStageType);
                }
                ProcessTypeStageTypeCreateGetWithErrorMessages ProcessTypeStageTypeWithErrorMessage = new ProcessTypeStageTypeCreateGetWithErrorMessages { ProcessTypeStageType = ProcessTypeStageType, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeStageTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeStageTypeCreateGetWithErrorMessages ProcessTypeStageTypeWithNoRights = new ProcessTypeStageTypeCreateGetWithErrorMessages { ProcessTypeStageType = ProcessTypeStageType, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeStageTypeWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTypeStageTypeProvider.IndexGet(CurrentUser.Id));
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
                var ProcessTypeStageType = await _processTypeStageTypeProvider.UpdateGet(CurrentUser.Id, Id);

                ProcessTypeStageType = await UpdateAddDropDownBoxes(ProcessTypeStageType, CurrentUser.Id);
                return Ok(ProcessTypeStageType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTypeStageTypeUpdateGet ProcessTypeStageType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeStageTypeProvider.UpdatePostCheck(ProcessTypeStageType);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeStageType = await UpdateAddDropDownBoxes(ProcessTypeStageType, CurrentUser.Id);
                }
                else
                {
                    _processTypeStageTypeProvider.UpdatePost(ProcessTypeStageType);
                }
                ProcessTypeStageTypeUpdateGetWithErrorMessages ProcessTypeStageTypeWithErrorMessage = new ProcessTypeStageTypeUpdateGetWithErrorMessages { ProcessTypeStageType = ProcessTypeStageType, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeStageTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeStageTypeUpdateGetWithErrorMessages ProcessTypeStageTypeWithNoRights = new ProcessTypeStageTypeUpdateGetWithErrorMessages { ProcessTypeStageType = ProcessTypeStageType, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeStageTypeWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTypeStageTypes", "ProcessTypeStageTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTypeStageTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTypeStageTypeDeleteGet ProcessTypeStageType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessTypeStageType.UserId= CurrentUser.Id;
                //var CheckString = await _ProcessTypeStageTypeProvider.DeletePostCheck(ProcessTypeStageType);
                //if (CheckString.Length == 0)
                //{
                _processTypeStageTypeProvider.DeletePost(CurrentUser.Id, ProcessTypeStageType.ProcessTypeStageTypeId);
                return Ok(ProcessTypeStageType);
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
                return Ok(await _processTypeStageTypeProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTypeStageTypeProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}