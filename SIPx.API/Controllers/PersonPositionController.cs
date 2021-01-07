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
    public class PersonPositionController : ControllerBase
    {
        private readonly IPersonPositionProvider _personPositionProvider;
        private readonly IPersonProvider _personProvider;
        private readonly IPositionProvider _positionProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IPersonPositionProvider _PersonPositionProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly UserManager<SipUser> _userManager;

        public PersonPositionController(IPersonPositionProvider personPositionProvider, IPersonProvider personProvider, IPositionProvider positionProvider
            , ICheckProvider checkProvider
            , IMasterListProvider masterListProvider
            , IPersonPositionProvider PersonPositionProvider
            , IMasterProvider masterProvider
            , IClaimCheck claimCheck
            , IOrganizationProvider organizationProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _personPositionProvider = personPositionProvider;
            _personProvider = personProvider;
            _positionProvider = positionProvider;
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _PersonPositionProvider = PersonPositionProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _organizationProvider = organizationProvider;
            _userManager = userManager;
        }
        private async Task<PersonPositionCreateGet> CreateAddDropDownBoxes(PersonPositionCreateGet PersonPosition, string UserId, int PersonId)
        {
            var Positions = await _positionProvider.List(UserId);
            var Organizations = await _organizationProvider.List(UserId);
            //PETER TODO --Should exclude maybe some persons and positions
            PersonPosition.Positions = Positions;
            PersonPosition.Organizations = Organizations;
            PersonPosition.PersonId = PersonId;
            return PersonPosition;
        }
        private async Task<PersonPositionUpdateGet> UpdateAddDropDownBoxes(PersonPositionUpdateGet PersonPosition, string UserId)
        {

            var Positions = await _positionProvider.List(UserId);
            var Organizations = await _organizationProvider.List(UserId);
            //PETER TODO --Should exclude maybe some persons and positions
            PersonPosition.Positions = Positions;
            PersonPosition.Organizations = Organizations;
            return PersonPosition;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var PersonPosition = new PersonPositionCreateGet();
                PersonPosition = await _personPositionProvider.CreateGet(CurrentUser.Id, Id);
                PersonPosition = await CreateAddDropDownBoxes(PersonPosition, CurrentUser.Id, Id);
                return Ok(PersonPosition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PersonPositionCreateGet PersonPosition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PersonPosition.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _PersonPositionProvider.CreatePostCheck(PersonPosition);
                if (ErrorMessages.Count > 0)
                {
                    PersonPosition = await CreateAddDropDownBoxes(PersonPosition, CurrentUser.Id, PersonPosition.PersonId);
                }
                else
                {
                    _PersonPositionProvider.CreatePost(PersonPosition);
                }
                PersonPositionCreateGetWithErrorMessages PersonPositionWithErrorMessage = new PersonPositionCreateGetWithErrorMessages { PersonPosition = PersonPosition, ErrorMessages = ErrorMessages };
                return Ok(PersonPositionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PersonPositionCreateGetWithErrorMessages PersonPositionWithNoRights = new PersonPositionCreateGetWithErrorMessages { PersonPosition = PersonPosition, ErrorMessages = ErrorMessages };
            return Ok(PersonPositionWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _PersonPositionProvider.IndexGet(CurrentUser.Id, Id));
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

                var PersonPosition = await _PersonPositionProvider.UpdateGet(CurrentUser.Id, Id);
                PersonPosition = await UpdateAddDropDownBoxes(PersonPosition, CurrentUser.Id);
                return Ok(PersonPosition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PersonPositionUpdateGet PersonPosition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PersonPosition.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _PersonPositionProvider.UpdatePostCheck(PersonPosition);
                if (ErrorMessages.Count > 0)
                {
                    PersonPosition = await UpdateAddDropDownBoxes(PersonPosition, CurrentUser.Id);
                }
                else
                {
                    _PersonPositionProvider.UpdatePost(PersonPosition);
                }
                PersonPositionUpdateGetWithErrorMessages PersonPositionWithErrorMessage = new PersonPositionUpdateGetWithErrorMessages { PersonPosition = PersonPosition, ErrorMessages = ErrorMessages };
                return Ok(PersonPositionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PersonPositionUpdateGetWithErrorMessages PersonPositionWithNoRights = new PersonPositionUpdateGetWithErrorMessages { PersonPosition = PersonPosition, ErrorMessages = ErrorMessages };
            return Ok(PersonPositionWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var x = await _PersonPositionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PersonPositionDeleteGet PersonPosition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PersonPosition.UserId = CurrentUser.Id;
                //var CheckString = await _PersonPositionProvider.DeletePostCheck(PersonPosition);
                //if (CheckString.Length == 0)
                //{
                _PersonPositionProvider.DeletePost(CurrentUser.Id, PersonPosition.OrganizationPersonId);
                return Ok(PersonPosition);
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