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
    public class ProcessTypeGroupController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTypeGroupProvider _processTypeGroupProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTypeProvider _processTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTypeGroupController(ICheckProvider checkProvider, IProcessTypeGroupProvider processTypeGroupProvider,  IMasterProvider masterProvider,  IClaimCheck claimCheck, IProcessTypeProvider processTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _processTypeGroupProvider = processTypeGroupProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTypeProvider = processTypeProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTypeGroupCreateGet> CreateAddDropDownBoxes(ProcessTypeGroupCreateGet ProcessTypeGroup, string UserId)
        {
            var ProcessTypeGroupCreateGetSequences = await _processTypeGroupProvider.CreateGetSequence(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            //ProcessTypeGroupCreateGet.LanguageId = UserLanguage.LanguageId;
            ProcessTypeGroup.LanguageName = UserLanguage.Name;
            ProcessTypeGroup.Sequences = ProcessTypeGroupCreateGetSequences;
            ProcessTypeGroup.Sequences.Add(new SequenceList { Sequence = ProcessTypeGroupCreateGetSequences.Count + 1, Name = "Add at the end" });


            return ProcessTypeGroup;
        }

        private async Task<ProcessTypeGroupUpdateGet> UpdateAddDropDownBoxes(ProcessTypeGroupUpdateGet ProcessTypeGroup, string UserId)
        {

            var Sequences = await _processTypeGroupProvider.UpdateGetSequence(UserId);
            ProcessTypeGroup.Sequences = Sequences;
            return ProcessTypeGroup;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTypeGroup = new ProcessTypeGroupCreateGet();
                ProcessTypeGroup = await CreateAddDropDownBoxes(ProcessTypeGroup, CurrentUser.Id);
                return Ok(ProcessTypeGroup);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTypeGroupCreateGet ProcessTypeGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTypeGroup.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeGroupProvider.CreatePostCheck(ProcessTypeGroup);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeGroup = await CreateAddDropDownBoxes(ProcessTypeGroup, CurrentUser.Id);
                }
                else
                {
                    _processTypeGroupProvider.CreatePost(ProcessTypeGroup);
                }
                ProcessTypeGroupCreateGetWithErrorMessages ProcessTypeGroupWithErrorMessage = new ProcessTypeGroupCreateGetWithErrorMessages { ProcessTypeGroup = ProcessTypeGroup, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeGroupWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeGroupCreateGetWithErrorMessages ProcessTypeGroupWithNoRights = new ProcessTypeGroupCreateGetWithErrorMessages { ProcessTypeGroup = ProcessTypeGroup, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeGroupWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTypeGroupProvider.IndexGet(CurrentUser.Id));
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
                var ProcessTypeGroup = await _processTypeGroupProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTypeGroup = await UpdateAddDropDownBoxes(ProcessTypeGroup, CurrentUser.Id);
                return Ok(ProcessTypeGroup);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTypeGroupUpdateGet ProcessTypeGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeGroupProvider.UpdatePostCheck(ProcessTypeGroup);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeGroup = await UpdateAddDropDownBoxes(ProcessTypeGroup, CurrentUser.Id);
                }
                else
                {
                    _processTypeGroupProvider.UpdatePost(ProcessTypeGroup);
                }
                ProcessTypeGroupUpdateGetWithErrorMessages ProcessTypeGroupWithErrorMessage = new ProcessTypeGroupUpdateGetWithErrorMessages { ProcessTypeGroup = ProcessTypeGroup, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeGroupWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeGroupUpdateGetWithErrorMessages ProcessTypeGroupWithNoRights = new ProcessTypeGroupUpdateGetWithErrorMessages { ProcessTypeGroup = ProcessTypeGroup, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeGroupWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTypeGroups", "ProcessTypeGroupID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTypeGroupProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTypeGroupDeleteGet ProcessTypeGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessTypeGroup.UserId= CurrentUser.Id;
                //var CheckString = await _ProcessTypeGroupProvider.DeletePostCheck(ProcessTypeGroup);
                //if (CheckString.Length == 0)
                //{
                _processTypeGroupProvider.DeletePost(CurrentUser.Id, ProcessTypeGroup.ProcessTypeGroupId);
                return Ok(ProcessTypeGroup);
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
                return Ok(await _processTypeGroupProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTypeGroupProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}