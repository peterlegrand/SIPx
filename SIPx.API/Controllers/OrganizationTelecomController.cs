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
    public class OrganizationTelecomController : ControllerBase
    {
        private readonly ITelecomTypeProvider _telecomTypeProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IOrganizationTelecomProvider _organizationTelecomProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly UserManager<SipUser> _userManager;

        public OrganizationTelecomController(ITelecomTypeProvider telecomTypeProvider, ICheckProvider checkProvider, IMasterListProvider masterListProvider, IOrganizationTelecomProvider organizationTelecomProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IOrganizationProvider organizationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
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

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var OrganizationTelecomCreateGet = new OrganizationTelecomCreateGet();
                var TelecomTypes = await _telecomTypeProvider.List(CurrentUser.Id);
                OrganizationTelecomCreateGet.TelecomTypes = TelecomTypes;
                OrganizationTelecomCreateGet.ConcatTelecomTypeId = "CONCAT11";
                OrganizationTelecomCreateGet.OrganizationId = Id;
                return Ok(OrganizationTelecomCreateGet);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _organizationTelecomProvider.CreatePostCheck(OrganizationTelecom);
                //if (CheckString.Length == 0)
                //{
                OrganizationTelecom.TelecomTypeId = Int32.Parse(OrganizationTelecom.ConcatTelecomTypeId.Substring(7));
                    _organizationTelecomProvider.CreatePost(OrganizationTelecom);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                OrganizationTelecom.UserId = CurrentUser.Id;
                //var CheckString = await _OrganizationTelecomProvider.UpdatePostCheck(OrganizationTelecom);
                //if (CheckString.Length == 0)
                //{
                _organizationTelecomProvider.UpdatePost(OrganizationTelecom);
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

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                OrganizationTelecom.UserId= CurrentUser.Id;
                //var CheckString = await _OrganizationTelecomProvider.DeletePostCheck(OrganizationTelecom);
                //if (CheckString.Length == 0)
                //{
                _organizationTelecomProvider.DeletePost(OrganizationTelecom.OrganizationTelecomId);
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