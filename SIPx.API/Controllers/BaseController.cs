using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class BaseController : ControllerBase
    {
        private readonly IBaseProvider _baseProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IMasterProvider _masterProvider;
        private readonly UserManager<SipUser> _userManager;

        public BaseController(  IBaseProvider baseProvider
            , ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , IMasterProvider masterProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _baseProvider = baseProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _masterProvider = masterProvider;
            _userManager = userManager;
        }

        private async Task<BaseLanguageCreateGet> CreateAddDropDownBoxes(BaseLanguageCreateGet BaseLanguage, string UserId)
        {
            var LanguageList = await _baseProvider.CreateGetLanguages(BaseLanguage.BaseId,BaseLanguage.BaseType, UserId);
            BaseLanguage.Languages= LanguageList;
            return BaseLanguage;
        }

        private async Task<BaseLanguageUpdateGet> UpdateAddDropDownBoxes(BaseLanguageUpdateGet BaseLanguage, string UserId)
        {
            var LanguageList = await _baseProvider.CreateGetLanguages(BaseLanguage.BaseLanguageId, BaseLanguage.BaseType, UserId);
            BaseLanguage.Languages = LanguageList;
            return BaseLanguage;
        }

        [HttpGet("LanguageCreate/{Id:int}")]
        public async Task<IActionResult> LanguageCreate(int Id, [FromQuery(Name = "BaseType")] string BaseType )
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight"
                , BaseType + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var BaseLanguage = new BaseLanguageCreateGet();
                BaseLanguage.BaseId = Id;
                BaseLanguage.BaseType= BaseType;
                BaseLanguage = await CreateAddDropDownBoxes(BaseLanguage, CurrentUser.Id);
                return Ok(BaseLanguage);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("LanguageCreate")]
        public async Task<IActionResult> LanguageCreate(BaseLanguageCreateGet BaseLanguage)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            BaseLanguage.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(
                CurrentUser
                , "ApplicationRight"
                , BaseLanguage.BaseType + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _baseProvider.CreatePostCheck(BaseLanguage);
                if (ErrorMessages.Count > 0)
                {
                    BaseLanguage = await CreateAddDropDownBoxes(BaseLanguage, CurrentUser.Id);
                }
                else
                {
                    _baseProvider.CreatePost(BaseLanguage);
                }
                BaseLanguageCreateGetWithErrorMessages BaseLanguageWithErrorMessage 
                    = new BaseLanguageCreateGetWithErrorMessages { BaseLanguage = BaseLanguage, ErrorMessages = ErrorMessages };
                return Ok(BaseLanguageWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            BaseLanguageCreateGetWithErrorMessages BaseLanguageWithNoRights = new BaseLanguageCreateGetWithErrorMessages { BaseLanguage = BaseLanguage, ErrorMessages = ErrorMessages };
            return Ok(BaseLanguageWithNoRights);
        }

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> LanguageIndex(int Id, [FromQuery(Name = "BaseType")] string BaseType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser
                , "ApplicationRight"
                , BaseType + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists($"{BaseType}+Languages", BaseType, Id) == 0)
//PETER TODO WHY this check, should return empty list. No error
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _baseProvider.IndexGet(BaseType, Id, CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> LanguageUpdate(int Id, [FromQuery(Name = "BaseType")] string BaseType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser
                , "ApplicationRight"
                , BaseType + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists($"{BaseType}+Languages", BaseType, Id) == 0)
                //PETER TODO WHY this check, should return empty list. No error
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _baseProvider.UpdateGet(BaseType, Id, CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("LanguageUpdate")]
        public async Task<IActionResult> LanguageUpdate(BaseLanguageUpdateGet BaseLanguage)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            BaseLanguage.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(
                CurrentUser
                , "ApplicationRight"
                , BaseLanguage.BaseType + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _baseProvider.UpdatePostCheck(BaseLanguage);
                if (ErrorMessages.Count > 0)
                {
                    BaseLanguage = await UpdateAddDropDownBoxes(BaseLanguage, CurrentUser.Id);
                }
                else
                {
                    _baseProvider.UpdatePost(BaseLanguage);
                }
                BaseLanguageUpdateGetWithErrorMessages BaseLanguageWithErrorMessage
                    = new BaseLanguageUpdateGetWithErrorMessages { BaseLanguage = BaseLanguage, ErrorMessages = ErrorMessages };
                return Ok(BaseLanguageWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            BaseLanguageUpdateGetWithErrorMessages BaseLanguageWithNoRights = new BaseLanguageUpdateGetWithErrorMessages { BaseLanguage = BaseLanguage, ErrorMessages = ErrorMessages };
            return Ok(BaseLanguageWithNoRights);
        }

    }
}