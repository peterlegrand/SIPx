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
    public class FrontPersonTelecomController : ControllerBase
    {
        private readonly ITelecomTypeProvider _telecomTypeProvider;
        private readonly IPersonTelecomProvider _personTelecomProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public FrontPersonTelecomController(ITelecomTypeProvider telecomTypeProvider , IPersonTelecomProvider personTelecomProvider, ICheckProvider checkProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, IClaimCheck claimCheck,  Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _telecomTypeProvider = telecomTypeProvider;
            _personTelecomProvider = personTelecomProvider;
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }
        private async Task<PersonTelecomCreateGet> CreateAddDropDownBoxes(PersonTelecomCreateGet PersonTelecom, string UserId, int PersonId)
        {

            var TelecomTypes = await _telecomTypeProvider.List(UserId);
            PersonTelecom.TelecomTypes = TelecomTypes;
            PersonTelecom.ConcatTelecomTypeId = "CONCAT11";
            PersonTelecom.PersonId = PersonId;
            return PersonTelecom;
        }
        private async Task<PersonTelecomUpdateGet> UpdateAddDropDownBoxes(PersonTelecomUpdateGet PersonTelecom, string UserId)
        {
     

            return PersonTelecom;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var PersonTelecom = new PersonTelecomCreateGet();
                return Ok(PersonTelecom);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PersonTelecomCreateGet PersonTelecom)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PersonTelecom.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _personTelecomProvider.CreatePostCheck(PersonTelecom);
                if (ErrorMessages.Count > 0)
                {
                    PersonTelecom = await CreateAddDropDownBoxes(PersonTelecom, CurrentUser.Id, PersonTelecom.PersonId);
                }
                else
                {
                    _personTelecomProvider.CreatePost(PersonTelecom);
                }
                PersonTelecomCreateGetWithErrorMessages PersonTelecomWithErrorMessage = new PersonTelecomCreateGetWithErrorMessages { PersonTelecom = PersonTelecom, ErrorMessages = ErrorMessages };
                return Ok(PersonTelecomWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PersonTelecomCreateGetWithErrorMessages PersonTelecomWithNoRights = new PersonTelecomCreateGetWithErrorMessages { PersonTelecom = PersonTelecom, ErrorMessages = ErrorMessages };
            return Ok(PersonTelecomWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _personTelecomProvider.IndexGet(CurrentUser.Id, Id));
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
                return Ok(await _personTelecomProvider.UpdateGet(CurrentUser.Id, Id));
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PersonTelecom.UserId = CurrentUser.Id;
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PersonTelecom.UserId= CurrentUser.Id;
                //var CheckString = await _PersonTelecomProvider.DeletePostCheck(PersonTelecom);
                //if (CheckString.Length == 0)
                //{
                _personTelecomProvider.DeletePost(CurrentUser.Id, PersonTelecom.PersonTelecomId);
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