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
    public class ProcessTypeController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTypeGroupProvider _processTypeGroupProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTypeProvider _processTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTypeController( ICheckProvider checkProvider, IProcessTypeGroupProvider processTypeGroupProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTypeProvider processTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _processTypeGroupProvider = processTypeGroupProvider;
            _masterListProvider = masterListProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTypeProvider = processTypeProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTypeCreateGet> CreateAddDropDownBoxes(ProcessTypeCreateGet ProcessType, string UserId)
        {
            var Sequences = await _processTypeProvider.CreateGetSequence(UserId);
            var Icons = await _masterListProvider.IconList(UserId);
            var ProcessTypeGroups = await _processTypeGroupProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ProcessType.LanguageId = UserLanguage.LanguageId;
            ProcessType.LanguageName = UserLanguage.Name;
            ProcessType.Icons = Icons;
            ProcessType.ProcessTypes = Sequences;
            ProcessType.ProcessTypes.Add(new SequenceList { Sequence = Sequences.Count + 1, Name = "Add at the end" });
            ProcessType.ProcessTypeGroups = ProcessTypeGroups;
            return ProcessType;
        }

        private async Task<ProcessTypeUpdateGet> UpdateAddDropDownBoxes(ProcessTypeUpdateGet ProcessType, string UserId)
        {
            var icons = await _masterListProvider.IconList(UserId);

            var Sequences = await _processTypeProvider.CreateGetSequence(UserId);
            var ProcessTypeGroups = await _processTypeGroupProvider.List(UserId);
            ProcessType.Icons = icons;
            ProcessType.Sequences = Sequences;
            ProcessType.ProcessTypeGroups = ProcessTypeGroups;
            return ProcessType;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessType = new ProcessTypeCreateGet();
                ProcessType = await CreateAddDropDownBoxes(ProcessType, CurrentUser.Id);
                return Ok(ProcessType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTypeCreateGet ProcessType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessType.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeProvider.CreatePostCheck(ProcessType);
                if (ErrorMessages.Count > 0)
                {
                    ProcessType = await CreateAddDropDownBoxes(ProcessType, CurrentUser.Id);
                }
                else
                {
                    _processTypeProvider.CreatePost(ProcessType);
                }
                ProcessTypeCreateGetWithErrorMessages ProcessTypeWithErrorMessage = new ProcessTypeCreateGetWithErrorMessages { ProcessType = ProcessType, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeCreateGetWithErrorMessages ProcessTypeWithNoRights = new ProcessTypeCreateGetWithErrorMessages { ProcessType = ProcessType, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTypeProvider.IndexGet(CurrentUser.Id));
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
                var ProcessType = await _processTypeProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessType = await UpdateAddDropDownBoxes(ProcessType, CurrentUser.Id);
                return Ok(ProcessType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTypeUpdateGet ProcessType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeProvider.UpdatePostCheck(ProcessType);
                if (ErrorMessages.Count > 0)
                {
                    ProcessType = await UpdateAddDropDownBoxes(ProcessType, CurrentUser.Id);
                }
                else
                {
                    _processTypeProvider.UpdatePost(ProcessType);
                }
                ProcessTypeUpdateGetWithErrorMessages ProcessTypeWithErrorMessage = new ProcessTypeUpdateGetWithErrorMessages { ProcessType = ProcessType, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeUpdateGetWithErrorMessages ProcessTypeWithNoRights = new ProcessTypeUpdateGetWithErrorMessages { ProcessType = ProcessType, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTypes", "ProcessTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTypeDeleteGet ProcessType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessType.UserId= CurrentUser.Id;
                //var CheckString = await _ProcessTypeProvider.DeletePostCheck(ProcessType);
                //if (CheckString.Length == 0)
                //{
                _processTypeProvider.DeletePost(CurrentUser.Id, ProcessType.ProcessTypeId);
                return Ok(ProcessType);
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
                return Ok(await _processTypeProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTypeProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}