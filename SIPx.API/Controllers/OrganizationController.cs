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
    public class OrganizationController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IOrganizationTypeProvider _organizationTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly UserManager<SipUser> _userManager;

        public OrganizationController(ICheckProvider checkProvider, IMasterListProvider masterListProvider, IOrganizationTypeProvider organizationTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IOrganizationProvider organizationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _organizationTypeProvider = organizationTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _organizationProvider = organizationProvider;
            _userManager = userManager;
        }
        private async Task<OrganizationCreateGet> CreateAddDropDownBoxes(OrganizationCreateGet Organization, string UserId, int? ParentId = null)
        {
            var Statuses = await _masterListProvider.StatusList(UserId);
            var OrganizationTypes = await _organizationTypeProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            Organization.LanguageId = UserLanguage.LanguageId;
            Organization.LanguageName = UserLanguage.Name;
            Organization.OrganizationTypes = OrganizationTypes;
            Organization.Statuses = Statuses;
            Organization.ParentOrganizationId = ParentId;
            return Organization;
        }
        private async Task<OrganizationUpdateGet> UpdateAddDropDownBoxes(OrganizationUpdateGet Organization, string UserId)
        {
            Organization.Statuses = await _masterListProvider.StatusList(UserId);
            Organization.OrganizationTypes = await _organizationTypeProvider.List(UserId);
            return Organization;
        }
        [HttpGet("Create/{Id:int?}")]
        public async Task<IActionResult> Create(int? Id =null)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var Organization = new OrganizationCreateGet();
                Organization = await CreateAddDropDownBoxes(Organization, CurrentUser.Id, Id);
                return Ok(Organization);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(OrganizationCreateGet Organization)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Organization.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationProvider.CreatePostCheck(Organization);
                if (ErrorMessages.Count > 0)
                {
                    Organization = await CreateAddDropDownBoxes(Organization, CurrentUser.Id);
                }
                else
                {
                    _organizationProvider.CreatePost(Organization);
                }
                OrganizationCreateGetWithErrorMessages OrganizationWithErrorMessage = new OrganizationCreateGetWithErrorMessages { Organization = Organization, ErrorMessages = ErrorMessages };
                return Ok(OrganizationWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            OrganizationCreateGetWithErrorMessages OrganizationWithNoRights = new OrganizationCreateGetWithErrorMessages { Organization = Organization, ErrorMessages = ErrorMessages };
            return Ok(OrganizationWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _organizationProvider.IndexGet(CurrentUser.Id));
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
                var Organization = await _organizationProvider.UpdateGet(CurrentUser.Id, Id);
                Organization = await UpdateAddDropDownBoxes(Organization, CurrentUser.Id);
                return Ok(Organization);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(OrganizationUpdateGet Organization)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationProvider.UpdatePostCheck(Organization);
                if (ErrorMessages.Count > 0)
                {
                    Organization = await UpdateAddDropDownBoxes(Organization, CurrentUser.Id);
                }
                else
                {
                    _organizationProvider.UpdatePost(Organization);
                }
                OrganizationUpdateGetWithErrorMessages OrganizationWithErrorMessage = new OrganizationUpdateGetWithErrorMessages { Organization = Organization, ErrorMessages = ErrorMessages };
                return Ok(OrganizationWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            OrganizationUpdateGetWithErrorMessages OrganizationWithNoRights = new OrganizationUpdateGetWithErrorMessages { Organization = Organization, ErrorMessages = ErrorMessages };
            return Ok(OrganizationWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("Organizations", "OrganizationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _organizationProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(OrganizationDeleteGet Organization)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Organization.UserId= CurrentUser.Id;
                //var CheckString = await _OrganizationProvider.DeletePostCheck(Organization);
                //if (CheckString.Length == 0)
                //{
                _organizationProvider.DeletePost(CurrentUser.Id, Organization.OrganizationId);
                return Ok(Organization);
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
                return Ok(await _organizationProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
        //        return Ok(await _organizationProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}
        [HttpPost("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch(OrganizationAdvancedSearchPost AdvancedSearch)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            AdvancedSearch.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _OrganizationProvider.CreatePostCheck(Organization);
                //if (CheckString.Length == 0)
                //{
                var Result = await _organizationProvider.AdvancedSearch( AdvancedSearch);
                return Ok(Result);
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
    }
}