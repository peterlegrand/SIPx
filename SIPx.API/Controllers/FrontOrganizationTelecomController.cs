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
    public class FrontOrganizationTelecomController : ControllerBase
    {
        private readonly ITelecomTypeProvider _telecomTypeProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IOrganizationTelecomProvider _organizationTelecomProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontOrganizationTelecomController(ITelecomTypeProvider telecomTypeProvider, ICheckProvider checkProvider, IMasterListProvider masterListProvider, IOrganizationTelecomProvider organizationTelecomProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IOrganizationProvider organizationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _telecomTypeProvider = telecomTypeProvider;
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _organizationTelecomProvider = organizationTelecomProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _organizationProvider = organizationProvider;
            _userManager = userManager;
        }
        private async Task<OrganizationTelecomCreateGet> CreateAddDropDownBoxes(OrganizationTelecomCreateGet OrganizationTelecom, string UserId, int OrganizationId)
        {
            var TelecomTypes = await _telecomTypeProvider.List(UserId);
            OrganizationTelecom.TelecomTypes = TelecomTypes;
            OrganizationTelecom.ConcatTelecomTypeId = "CONCAT11";
            OrganizationTelecom.OrganizationId = OrganizationId;
            return OrganizationTelecom;
        }
        private async Task<OrganizationTelecomUpdateGet> UpdateAddDropDownBoxes(OrganizationTelecomUpdateGet OrganizationTelecom, string UserId)
        {
            //PETER this is empty and can probably be emty.
            return OrganizationTelecom;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var OrganizationTelecom = new OrganizationTelecomCreateGet();
                OrganizationTelecom = await CreateAddDropDownBoxes(OrganizationTelecom, CurrentUser.Id, Id);
                return Ok(OrganizationTelecom);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(OrganizationTelecomCreateGet OrganizationTelecom)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            OrganizationTelecom.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationTelecomProvider.CreatePostCheck(OrganizationTelecom);
                if (ErrorMessages.Count > 0)
                {
                    OrganizationTelecom = await CreateAddDropDownBoxes(OrganizationTelecom, CurrentUser.Id, OrganizationTelecom.OrganizationId);
                }
                else
                {
                    _organizationTelecomProvider.CreatePost(OrganizationTelecom);
                }
                OrganizationTelecomCreateGetWithErrorMessages OrganizationTelecomWithErrorMessage = new OrganizationTelecomCreateGetWithErrorMessages { OrganizationTelecom = OrganizationTelecom, ErrorMessages = ErrorMessages };
                return Ok(OrganizationTelecomWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            OrganizationTelecomCreateGetWithErrorMessages OrganizationTelecomWithNoRights = new OrganizationTelecomCreateGetWithErrorMessages { OrganizationTelecom = OrganizationTelecom, ErrorMessages = ErrorMessages };
            return Ok(OrganizationTelecomWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _organizationTelecomProvider.IndexGet(CurrentUser.Id, Id));
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
                return Ok(await _organizationTelecomProvider.UpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(OrganizationTelecomUpdateGet OrganizationTelecom)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationTelecomProvider.UpdatePostCheck(OrganizationTelecom);
                if (ErrorMessages.Count > 0)
                {
                    OrganizationTelecom = await UpdateAddDropDownBoxes(OrganizationTelecom, CurrentUser.Id);
                }
                else
                {
                    _organizationTelecomProvider.UpdatePost(OrganizationTelecom);
                }
                OrganizationTelecomUpdateGetWithErrorMessages OrganizationTelecomWithErrorMessage = new OrganizationTelecomUpdateGetWithErrorMessages { OrganizationTelecom = OrganizationTelecom, ErrorMessages = ErrorMessages };
                return Ok(OrganizationTelecomWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            OrganizationTelecomUpdateGetWithErrorMessages OrganizationTelecomWithNoRights = new OrganizationTelecomUpdateGetWithErrorMessages { OrganizationTelecom = OrganizationTelecom, ErrorMessages = ErrorMessages };
            return Ok(OrganizationTelecomWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("OrganizationTelecoms", "OrganizationTelecomID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _organizationTelecomProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(OrganizationTelecomDeleteGet OrganizationTelecom)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                OrganizationTelecom.UserId= CurrentUser.Id;
                //var CheckString = await _OrganizationTelecomProvider.DeletePostCheck(OrganizationTelecom);
                //if (CheckString.Length == 0)
                //{
                _organizationTelecomProvider.DeletePost(CurrentUser.Id, OrganizationTelecom.OrganizationTelecomId);
                return Ok(OrganizationTelecom);
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