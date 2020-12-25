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
    public class ProcessTemplateGroupController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTemplateGroupProvider _processTemplateGroupProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateGroupController(ICheckProvider checkProvider, IProcessTemplateGroupProvider processTemplateGroupProvider,  IMasterProvider masterProvider,  IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _processTemplateGroupProvider = processTemplateGroupProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTemplateGroupCreateGet> CreateAddDropDownBoxes(ProcessTemplateGroupCreateGet ProcessTemplateGroup, string UserId)
        {
            var ProcessTemplateGroupCreateGetSequences = await _processTemplateGroupProvider.CreateGetSequence(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            //ProcessTemplateGroupCreateGet.LanguageId = UserLanguage.LanguageId;
            ProcessTemplateGroup.LanguageName = UserLanguage.Name;
            ProcessTemplateGroup.Sequences = ProcessTemplateGroupCreateGetSequences;
            ProcessTemplateGroup.Sequences.Add(new SequenceList { Sequence = ProcessTemplateGroupCreateGetSequences.Count + 1, Name = "Add at the end" });


            return ProcessTemplateGroup;
        }

        private async Task<ProcessTemplateGroupUpdateGet> UpdateAddDropDownBoxes(ProcessTemplateGroupUpdateGet ProcessTemplateGroup, string UserId)
        {

            var Sequences = await _processTemplateGroupProvider.UpdateGetSequence(UserId);
            ProcessTemplateGroup.Sequences = Sequences;
            return ProcessTemplateGroup;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTemplateGroup = new ProcessTemplateGroupCreateGet();
                ProcessTemplateGroup = await CreateAddDropDownBoxes(ProcessTemplateGroup, CurrentUser.Id);
                return Ok(ProcessTemplateGroup);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTemplateGroupCreateGet ProcessTemplateGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplateGroup.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateGroupProvider.CreatePostCheck(ProcessTemplateGroup);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateGroup = await CreateAddDropDownBoxes(ProcessTemplateGroup, CurrentUser.Id);
                }
                else
                {
                    _processTemplateGroupProvider.CreatePost(ProcessTemplateGroup);
                }
                ProcessTemplateGroupCreateGetWithErrorMessages ProcessTemplateGroupWithErrorMessage = new ProcessTemplateGroupCreateGetWithErrorMessages { ProcessTemplateGroup = ProcessTemplateGroup, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateGroupWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateGroupCreateGetWithErrorMessages ProcessTemplateGroupWithNoRights = new ProcessTemplateGroupCreateGetWithErrorMessages { ProcessTemplateGroup = ProcessTemplateGroup, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateGroupWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateGroupProvider.IndexGet(CurrentUser.Id));
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
                var ProcessTemplateGroup = await _processTemplateGroupProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTemplateGroup = await UpdateAddDropDownBoxes(ProcessTemplateGroup, CurrentUser.Id);
                return Ok(ProcessTemplateGroup);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateGroupUpdateGet ProcessTemplateGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateGroupProvider.UpdatePostCheck(ProcessTemplateGroup);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateGroup = await UpdateAddDropDownBoxes(ProcessTemplateGroup, CurrentUser.Id);
                }
                else
                {
                    _processTemplateGroupProvider.UpdatePost(ProcessTemplateGroup);
                }
                ProcessTemplateGroupUpdateGetWithErrorMessages ProcessTemplateGroupWithErrorMessage = new ProcessTemplateGroupUpdateGetWithErrorMessages { ProcessTemplateGroup = ProcessTemplateGroup, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateGroupWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateGroupUpdateGetWithErrorMessages ProcessTemplateGroupWithNoRights = new ProcessTemplateGroupUpdateGetWithErrorMessages { ProcessTemplateGroup = ProcessTemplateGroup, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateGroupWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTemplateGroups", "ProcessTemplateGroupID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTemplateGroupProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTemplateGroupDeleteGet ProcessTemplateGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessTemplateGroup.UserId= CurrentUser.Id;
                //var CheckString = await _ProcessTemplateGroupProvider.DeletePostCheck(ProcessTemplateGroup);
                //if (CheckString.Length == 0)
                //{
                _processTemplateGroupProvider.DeletePost(CurrentUser.Id, ProcessTemplateGroup.ProcessTemplateGroupId);
                return Ok(ProcessTemplateGroup);
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
                return Ok(await _processTemplateGroupProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTemplateGroupProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}