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
    public class ProcessTypeFieldController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IProcessTypeFieldProvider _processTypeFieldProvider;
        private readonly IProcessTypeFieldTypeProvider _processTypeFieldTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessTypeProvider _processTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTypeFieldController(ICheckProvider checkProvider, IProcessTypeFieldProvider processTypeFieldProvider, IProcessTypeFieldTypeProvider processTypeFieldTypeProvider,  IMasterProvider masterProvider, IClaimCheck claimCheck, IProcessTypeProvider processTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _processTypeFieldProvider = processTypeFieldProvider;
            _processTypeFieldTypeProvider = processTypeFieldTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _processTypeProvider = processTypeProvider;
            _userManager = userManager;
        }
        private async Task<ProcessTypeFieldCreateGet> CreateAddDropDownBoxes(ProcessTypeFieldCreateGet ProcessTypeField, string UserId, int ProcessTypeId)
        {
            var ProcessTypeFieldTypes = await _processTypeFieldTypeProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ProcessTypeField.LanguageId = UserLanguage.LanguageId;
            ProcessTypeField.LanguageName = UserLanguage.Name;
            ProcessTypeField.ProcessTypeFieldTypes = ProcessTypeFieldTypes;
            ProcessTypeField.ProcessTypeId = ProcessTypeId;
            return ProcessTypeField;
        }

        private async Task<ProcessTypeFieldUpdateGet> UpdateAddDropDownBoxes(ProcessTypeFieldUpdateGet ProcessTypeField, string UserId)
        {
            var ProcessTypeFieldTypes = await _processTypeFieldTypeProvider.List(UserId);
            ProcessTypeField.ProcessTypeFieldTypes = ProcessTypeFieldTypes;

            return ProcessTypeField;
        }
        //[HttpGet("TypeIndex")]
        //public async Task<IActionResult> TypeIndex()
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        return Ok(await _processTypeFieldTypeProvider.IndexGet(CurrentUser.Id));
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
                var ProcessTypeField = new ProcessTypeFieldCreateGet();
                ProcessTypeField = await CreateAddDropDownBoxes(ProcessTypeField, CurrentUser.Id, Id);
                return Ok(ProcessTypeField);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTypeFieldCreateGet ProcessTypeField)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTypeField.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeFieldProvider.CreatePostCheck(ProcessTypeField);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeField = await CreateAddDropDownBoxes(ProcessTypeField, CurrentUser.Id, ProcessTypeField.ProcessTypeId);
                }
                else
                {
                    _processTypeFieldProvider.CreatePost(ProcessTypeField);
                }
                ProcessTypeFieldCreateGetWithErrorMessages ProcessTypeFieldWithErrorMessage = new ProcessTypeFieldCreateGetWithErrorMessages { ProcessTypeField = ProcessTypeField, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeFieldWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeFieldCreateGetWithErrorMessages ProcessTypeFieldWithNoRights = new ProcessTypeFieldCreateGetWithErrorMessages { ProcessTypeField = ProcessTypeField, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeFieldWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _processTypeFieldProvider.IndexGet(CurrentUser.Id, Id));
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
                var ProcessTypeField = await _processTypeFieldProvider.UpdateGet(CurrentUser.Id, Id);
                ProcessTypeField = await UpdateAddDropDownBoxes(ProcessTypeField, CurrentUser.Id);
                return Ok(ProcessTypeField);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTypeFieldUpdateGet ProcessTypeField)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _processTypeFieldProvider.UpdatePostCheck(ProcessTypeField);
                if (ErrorMessages.Count > 0)
                {
                    ProcessTypeField = await UpdateAddDropDownBoxes(ProcessTypeField, CurrentUser.Id);
                }
                else
                {
                    _processTypeFieldProvider.UpdatePost(ProcessTypeField);
                }
                ProcessTypeFieldUpdateGetWithErrorMessages ProcessTypeFieldWithErrorMessage = new ProcessTypeFieldUpdateGetWithErrorMessages { ProcessTypeField = ProcessTypeField, ErrorMessages = ErrorMessages };
                return Ok(ProcessTypeFieldWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProcessTypeFieldUpdateGetWithErrorMessages ProcessTypeFieldWithNoRights = new ProcessTypeFieldUpdateGetWithErrorMessages { ProcessTypeField = ProcessTypeField, ErrorMessages = ErrorMessages };
            return Ok(ProcessTypeFieldWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProcessTypeFields", "ProcessTypeFieldID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTypeFieldProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTypeFieldDeleteGet ProcessTypeField)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProcessTypeField.UserId= CurrentUser.Id;
                //var CheckString = await _ProcessTypeFieldProvider.DeletePostCheck(ProcessTypeField);
                //if (CheckString.Length == 0)
                //{
                _processTypeFieldProvider.DeletePost(CurrentUser.Id, ProcessTypeField.ProcessTypeFieldId);
                return Ok(ProcessTypeField);
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
                return Ok(await _processTypeFieldProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _processTypeFieldProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}