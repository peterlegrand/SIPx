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
    public class PersonTelecomController : ControllerBase
    {
        private readonly ITelecomTypeProvider _telecomTypeProvider;
        private readonly IPersonTelecomProvider _personTelecomProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPeopleProvider _peopleProvider;
        private readonly UserManager<SipUser> _userManager;

        public PersonTelecomController(ITelecomTypeProvider telecomTypeProvider , IPersonTelecomProvider personTelecomProvider, ICheckProvider checkProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IPeopleProvider peopleProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _telecomTypeProvider = telecomTypeProvider;
            _personTelecomProvider = personTelecomProvider;
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _peopleProvider = peopleProvider;
            _userManager = userManager;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var PersonTelecomCreateGet = new PersonTelecomCreateGet();
                var TelecomTypes = await _telecomTypeProvider.List(CurrentUser.Id);
                PersonTelecomCreateGet.TelecomTypes = TelecomTypes;
                PersonTelecomCreateGet.PersonId = Id;
                return Ok(PersonTelecomCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PersonTelecomCreatePost PersonTelecom)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PersonTelecom.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _peopleProvider.PersonTelecomCreatePostCheck(PersonTelecom);
                if (CheckString.Length == 0)
                {
                    _peopleProvider.PersonTelecomCreatePost(PersonTelecom);
                    return Ok(PersonTelecom);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _peopleProvider.PersonTelecomIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _peopleProvider.PersonTelecomUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PersonTelecomUpdateGet PersonTelecom)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                PersonTelecom.ModifierId = CurrentUser.Id;
                //var CheckString = await _PersonProvider.UpdatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _personTelecomProvider.UpdatePost(PersonTelecom);
                return Ok(PersonTelecom);
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
                if (await _checkProvider.CheckIfRecordExists("PersonTelecoms", "PersonTelecomID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _personTelecomProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PersonTelecomDeleteGet PersonTelecom)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                PersonTelecom.CreatorId = CurrentUser.Id;
                //var CheckString = await _PersonTelecomProvider.DeletePostCheck(PersonTelecom);
                //if (CheckString.Length == 0)
                //{
                _personTelecomProvider.DeletePost(PersonTelecom.PersonTelecomId);
                return Ok(PersonTelecom);
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