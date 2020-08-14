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
        private readonly IMasterListProvider _masterListProvider;
        private readonly IOrganizationTypeProvider _organizationTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly UserManager<SipUser> _userManager;

        public OrganizationController(IMasterListProvider masterListProvider, IOrganizationTypeProvider organizationTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IOrganizationProvider organizationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterListProvider = masterListProvider;
            _organizationTypeProvider = organizationTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _organizationProvider = organizationProvider;
            _userManager = userManager;
        }

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> GetOrganizationLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _organizationProvider.OrganizationLanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> GetOrganizationLanguage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _organizationProvider.OrganizationLanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Index")]
        public async Task<IActionResult> GetOrganizations()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _organizationProvider.OrganizationIndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetOrganization(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _organizationProvider.OrganizationUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var OrganizationCreateGet = new OrganizationCreateGet();
                var Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
                var OrganizationTypes = await _organizationTypeProvider.OrganizationTypeList(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                OrganizationCreateGet.LanguageId = UserLanguage.LanguageId;
                OrganizationCreateGet.LanguageName = UserLanguage.Name;
                OrganizationCreateGet.OrganizationTypes = OrganizationTypes;
                OrganizationCreateGet.Statuses = Statuses;
                OrganizationCreateGet.ParentOrganizationId = Id;
                return Ok(OrganizationCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(OrganizationCreatePost Organization)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Organization.CreatorId= CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _organizationProvider.OrganizationCreatePostCheck(Organization);
                if (CheckString.Length == 0)
                {
                    _organizationProvider.OrganizationCreatePost(Organization);
                    return Ok(Organization);
                }
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = CheckString,
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