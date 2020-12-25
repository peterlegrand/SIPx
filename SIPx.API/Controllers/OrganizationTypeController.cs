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
    public class OrganizationTypeController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IOrganizationTypeProvider _organizationTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly UserManager<SipUser> _userManager;

        public OrganizationTypeController(ICheckProvider checkProvider, IMasterListProvider masterListProvider, IOrganizationTypeProvider organizationTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IOrganizationProvider organizationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _organizationTypeProvider = organizationTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _organizationProvider = organizationProvider;
            _userManager = userManager;
        }
        private async Task<OrganizationTypeCreateGet> CreateAddDropDownBoxes(OrganizationTypeCreateGet OrganizationType, string UserId)
        {

            var icons = await _masterListProvider.IconList(UserId);
            OrganizationType.Icons = icons;
            return OrganizationType;
        }
        private async Task<OrganizationTypeUpdateGet> UpdateAddDropDownBoxes(OrganizationTypeUpdateGet OrganizationType, string UserId)
        {

            var icons = await _masterListProvider.IconList(UserId);
            OrganizationType.Icons = icons;

            return OrganizationType;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var OrganizationType = new OrganizationTypeCreateGet();
                OrganizationType = await CreateAddDropDownBoxes(OrganizationType, CurrentUser.Id);
                //var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                //OrganizationTypeCreateGet.LanguageId = UserLanguage.LanguageId;
                //OrganizationTypeCreateGet.LanguageName = UserLanguage.Name;
                return Ok(OrganizationType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(OrganizationTypeCreateGet OrganizationType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            OrganizationType.UserId= CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationTypeProvider.CreatePostCheck(OrganizationType);
                if (ErrorMessages.Count > 0)
                {
                    OrganizationType = await CreateAddDropDownBoxes(OrganizationType, CurrentUser.Id);
                }
                else
                {
                    _organizationTypeProvider.CreatePost(OrganizationType);
                }
                OrganizationTypeCreateGetWithErrorMessages OrganizationTypeWithErrorMessage = new OrganizationTypeCreateGetWithErrorMessages { OrganizationType = OrganizationType, ErrorMessages = ErrorMessages };
                return Ok(OrganizationTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            OrganizationTypeCreateGetWithErrorMessages OrganizationTypeWithNoRights = new OrganizationTypeCreateGetWithErrorMessages { OrganizationType = OrganizationType, ErrorMessages = ErrorMessages };
            return Ok(OrganizationTypeWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _organizationTypeProvider.IndexGet(CurrentUser.Id));
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
                var OrganizationType = await _organizationTypeProvider.UpdateGet(CurrentUser.Id, Id);
                OrganizationType =await  UpdateAddDropDownBoxes(OrganizationType,CurrentUser.Id);
                return Ok(OrganizationType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(OrganizationTypeUpdateGet OrganizationType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationTypeProvider.UpdatePostCheck(OrganizationType);
                if (ErrorMessages.Count > 0)
                {
                    OrganizationType = await UpdateAddDropDownBoxes(OrganizationType, CurrentUser.Id);
                }
                else
                {
                    _organizationTypeProvider.UpdatePost(OrganizationType);
                }
                OrganizationTypeUpdateGetWithErrorMessages OrganizationTypeWithErrorMessage = new OrganizationTypeUpdateGetWithErrorMessages { OrganizationType = OrganizationType, ErrorMessages = ErrorMessages };
                return Ok(OrganizationTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            OrganizationTypeUpdateGetWithErrorMessages OrganizationTypeWithNoRights = new OrganizationTypeUpdateGetWithErrorMessages { OrganizationType = OrganizationType, ErrorMessages = ErrorMessages };
            return Ok(OrganizationTypeWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("OrganizationTypes", "OrganizationTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _organizationTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(OrganizationTypeDeleteGet OrganizationType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                OrganizationType.UserId= CurrentUser.Id;
                //var CheckString = await _OrganizationTypeProvider.DeletePostCheck(OrganizationType);
                //if (CheckString.Length == 0)
                //{
                _organizationTypeProvider.DeletePost(CurrentUser.Id, OrganizationType.OrganizationTypeId);
                return Ok(OrganizationType);
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
                return Ok(await _organizationTypeProvider.LanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        //[HttpGet("LanguageUpdate/{Id:int}")]
        //public async Task<IActionResult> LanguageUpdate(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        return Ok(await _organizationTypeProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}


    }
}