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
    public class ProcessTemplateFieldController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTemplateFieldProvider _processTemplateFieldProvider;
        private readonly IProcessTemplateFieldTypeProvider _processTemplateFieldTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateFieldController(ICheckProvider checkProvider, IProcessTemplateFieldProvider processTemplateFieldProvider, IProcessTemplateFieldTypeProvider processTemplateFieldTypeProvider,  IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTemplateProvider processTemplateProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _processTemplateFieldProvider = processTemplateFieldProvider;
            _processTemplateFieldTypeProvider = processTemplateFieldTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTemplateProvider = processTemplateProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTemplateFieldCreateGet> CreateAddDropDownBoxes(ProcessTemplateFieldCreateGet ProcessTemplateField, string UserId, int ProcessTemplateId)
        {
            var ProcessTemplateFieldTypes = await _processTemplateFieldTypeProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ProcessTemplateField.LanguageId = UserLanguage.LanguageId;
            ProcessTemplateField.LanguageName = UserLanguage.Name;
            ProcessTemplateField.ProcessTemplateFieldTypes = ProcessTemplateFieldTypes;
            ProcessTemplateField.ProcessTemplateId = ProcessTemplateId;
            return ProcessTemplateField;
        }

        private async Task<ProcessTemplateFieldUpdateGet> UpdateAddDropDownBoxes(ProcessTemplateFieldUpdateGet ProcessTemplateField, string UserId)
        {
            var ProcessTemplateFieldTypes = await _processTemplateFieldTypeProvider.List(UserId);
            ProcessTemplateField.ProcessTemplateFieldTypes = ProcessTemplateFieldTypes;

            return ProcessTemplateField;
        }
        //[HttpGet("TypeIndex")]
        //public async Task<IActionResult> TypeIndex()
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        return Ok(await _processTemplateFieldTypeProvider.IndexGet(CurrentUser.Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessTemplateField = new ProcessTemplateFieldCreateGet();
                ProcessTemplateField = await CreateAddDropDownBoxes(ProcessTemplateField, CurrentUser.Id, Id);
                return Ok(ProcessTemplateField);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTemplateFieldCreateGet ProcessTemplateField)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplateField.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateFieldProvider.CreatePostCheck(ProcessTemplateField);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateField = await CreateAddDropDownBoxes(ProcessTemplateField, CurrentUser.Id, ProcessTemplateField.ProcessTemplateId);
                }
                else
                {
                    _processTemplateFieldProvider.CreatePost(ProcessTemplateField);
                }
                ProcessTemplateFieldCreateGetWithErrorMessages ProcessTemplateFieldWithErrorMessage = new ProcessTemplateFieldCreateGetWithErrorMessages { ProcessTemplateField = ProcessTemplateField, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateFieldWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateFieldCreateGetWithErrorMessages ProcessTemplateFieldWithNoRights = new ProcessTemplateFieldCreateGetWithErrorMessages { ProcessTemplateField = ProcessTemplateField, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateFieldWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateFieldProvider.IndexGet(CurrentUser.Id, Id));
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
                var ProcessTemplateField = await _processTemplateFieldProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTemplateField = await UpdateAddDropDownBoxes(ProcessTemplateField, CurrentUser.Id);
                return Ok(ProcessTemplateField);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateFieldUpdateGet ProcessTemplateField)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTemplateFieldProvider.UpdatePostCheck(ProcessTemplateField);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTemplateField = await UpdateAddDropDownBoxes(ProcessTemplateField, CurrentUser.Id);
                }
                else
                {
                    _processTemplateFieldProvider.UpdatePost(ProcessTemplateField);
                }
                ProcessTemplateFieldUpdateGetWithErrorMessages ProcessTemplateFieldWithErrorMessage = new ProcessTemplateFieldUpdateGetWithErrorMessages { ProcessTemplateField = ProcessTemplateField, ErrorMessages = ErrorMessages };
                return Ok(ProcessTemplateFieldWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTemplateFieldUpdateGetWithErrorMessages ProcessTemplateFieldWithNoRights = new ProcessTemplateFieldUpdateGetWithErrorMessages { ProcessTemplateField = ProcessTemplateField, ErrorMessages = ErrorMessages };
            return Ok(ProcessTemplateFieldWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTemplateFields", "ProcessTemplateFieldID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTemplateFieldProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTemplateFieldDeleteGet ProcessTemplateField)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessTemplateField.UserId= CurrentUser.Id;
                //var CheckString = await _ProcessTemplateFieldProvider.DeletePostCheck(ProcessTemplateField);
                //if (CheckString.Length == 0)
                //{
                _processTemplateFieldProvider.DeletePost(ProcessTemplateField.ProcessTemplateFieldId);
                return Ok(ProcessTemplateField);
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
        public async Task<IActionResult> FieldLanguageIndexGet(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateFieldProvider.LanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> FieldLanguageUpdateGet(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTemplateFieldProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}