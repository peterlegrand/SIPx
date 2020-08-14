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
    public class PersonRelationTypeController : ControllerBase
    {
        private readonly IClaimCheck _claimCheck;
        private readonly IPersonRelationTypeProvider _personRelationTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public PersonRelationTypeController(IClaimCheck claimCheck, IPersonRelationTypeProvider personRelationTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _claimCheck = claimCheck;
            _personRelationTypeProvider = personRelationTypeProvider;
            _userManager = userManager;
        }

        [HttpGet("TypeLanguageIndex/{Id:int}")]
        public async Task<IActionResult> GetPersonRelationTypeLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _personRelationTypeProvider.PersonRelationTypeLanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpGet("TypeLanguageUpdate/{Id:int}")]
        public async Task<IActionResult> GetPersonRelationTypeLanguage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _personRelationTypeProvider.PersonRelationTypeLanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("TypeIndex")]
        public async Task<IActionResult> GetPersonRelationTypes()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _personRelationTypeProvider.PersonRelationTypeIndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpGet("TypeUpdate/{Id:int}")]
        public async Task<IActionResult> GetPersonRelationType(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _personRelationTypeProvider.PersonRelationTypeUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


    }
}