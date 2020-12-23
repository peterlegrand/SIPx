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
    public class ProcessTemplateController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTemplateGroupProvider _processTemplateGroupProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateController( ICheckProvider checkProvider, IProcessTemplateGroupProvider processTemplateGroupProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _processTemplateGroupProvider = processTemplateGroupProvider;
            _masterListProvider = masterListProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTemplateCreateGet> CreateAddDropDownBoxes(ProcessTemplateCreateGet ProcessTemplate, string UserId)
        {
            var Sequences = await _processTemplateProvider.CreateGetSequence(UserId);
            var Icons = await _masterListProvider.IconList(UserId);
            var ProcessTemplateGroups = await _processTemplateGroupProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ProcessTemplate.LanguageId = UserLanguage.LanguageId;
            ProcessTemplate.LanguageName = UserLanguage.Name;
            ProcessTemplate.Icons = Icons;
            ProcessTemplate.ProcessTemplates = Sequences;
            ProcessTemplate.ProcessTemplates.Add(new SequenceList { Sequence = Sequences.Count + 1, Name = "Add at the end" });
            ProcessTemplate.ProcessTemplateGroups = ProcessTemplateGroups;
            return ProcessTemplate;
        }

        private async Task<ProcessTemplateUpdateGet> UpdateAddDropDownBoxes(ProcessTemplateUpdateGet ProcessTemplate, string UserId)
        {
            var icons = await _masterListProvider.IconList(UserId);

            var Sequences = await _processTemplateProvider.CreateGetSequence(UserId);
            var ProcessTemplateGroups = await _processTemplateGroupProvider.List(UserId);
            ProcessTemplate.Icons = icons;
            ProcessTemplate.Sequences = Sequences;
            ProcessTemplate.ProcessTemplateGroups = ProcessTemplateGroups;
            return ProcessTemplate;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTemplate = new ProcessTemplateCreateGet();
                ProcessTemplate = await CreateAddDropDownBoxes(ProcessTemplate, CurrentUser.Id);
                return Ok(ProcessTemplate);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTemplateCreateGet ProcessTemplate)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplate.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateProvider.CreatePostCheck(ProcessTemplate);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplate = await CreateAddDropDownBoxes(ProcessTemplate, CurrentUser.Id);
                }
                else
                {
                    _processTemplateProvider.CreatePost(ProcessTemplate);
                }
                ProcessTemplateCreateGetWithErrorMessages ProcessTemplateWithErrorMessage = new ProcessTemplateCreateGetWithErrorMessages { ProcessTemplate = ProcessTemplate, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateCreateGetWithErrorMessages ProcessTemplateWithNoRights = new ProcessTemplateCreateGetWithErrorMessages { ProcessTemplate = ProcessTemplate, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateProvider.IndexGet(CurrentUser.Id));
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
                var ProcessTemplate = await _processTemplateProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTemplate = await UpdateAddDropDownBoxes(ProcessTemplate, CurrentUser.Id);
                return Ok(ProcessTemplate);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateUpdateGet ProcessTemplate)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateProvider.UpdatePostCheck(ProcessTemplate);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplate = await UpdateAddDropDownBoxes(ProcessTemplate, CurrentUser.Id);
                }
                else
                {
                    _processTemplateProvider.UpdatePost(ProcessTemplate);
                }
                ProcessTemplateUpdateGetWithErrorMessages ProcessTemplateWithErrorMessage = new ProcessTemplateUpdateGetWithErrorMessages { ProcessTemplate = ProcessTemplate, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateUpdateGetWithErrorMessages ProcessTemplateWithNoRights = new ProcessTemplateUpdateGetWithErrorMessages { ProcessTemplate = ProcessTemplate, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTemplates", "ProcessTemplateID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTemplateProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTemplateDeleteGet ProcessTemplate)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessTemplate.UserId= CurrentUser.Id;
                //var CheckString = await _ProcessTemplateProvider.DeletePostCheck(ProcessTemplate);
                //if (CheckString.Length == 0)
                //{
                _processTemplateProvider.DeletePost(ProcessTemplate.ProcessTemplateId);
                return Ok(ProcessTemplate);
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
                return Ok(await _processTemplateProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTemplateProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}