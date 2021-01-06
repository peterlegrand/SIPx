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
    public class OrganizationPositionController : ControllerBase
    {
        private readonly IPersonProvider _personProvider;
        private readonly IPositionProvider _positionProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IOrganizationPositionProvider _organizationPositionProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly UserManager<SipUser> _userManager;

        public OrganizationPositionController(IPersonProvider personProvider, IPositionProvider positionProvider
            , ICheckProvider checkProvider
            , IMasterListProvider masterListProvider
            , IOrganizationPositionProvider organizationPositionProvider
            , IMasterProvider masterProvider
            , IClaimCheck claimCheck
            , IOrganizationProvider organizationProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _personProvider = personProvider;
            _positionProvider = positionProvider;
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _organizationPositionProvider = organizationPositionProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _organizationProvider = organizationProvider;
            _userManager = userManager;
        }
        private async Task<OrganizationPositionCreateGet> CreateAddDropDownBoxes(OrganizationPositionCreateGet OrganizationPosition, string UserId, int OrganizationId)
        {
            var Positions = await _positionProvider.List(UserId);
            var Persons = await _personProvider.List();
            //PETER TODO --Should exclude maybe some persons and positions
            OrganizationPosition.Positions = Positions;
            OrganizationPosition.Persons = Persons;
            OrganizationPosition.OrganizationId = OrganizationId;
            return OrganizationPosition;
        }
        private async Task<OrganizationPositionUpdateGet> UpdateAddDropDownBoxes(OrganizationPositionUpdateGet OrganizationPosition, string UserId)
        {

            var Positions = await _positionProvider.List(UserId);
            var Persons = await _personProvider.List();
            //PETER TODO --Should exclude maybe some persons and positions
            OrganizationPosition.Positions = Positions;
            OrganizationPosition.Persons = Persons;
            return OrganizationPosition;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var OrganizationPosition = new OrganizationPositionCreateGet();
                OrganizationPosition = await CreateAddDropDownBoxes(OrganizationPosition, CurrentUser.Id, Id);
                return Ok(OrganizationPosition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(OrganizationPositionCreateGet OrganizationPosition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            OrganizationPosition.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationPositionProvider.CreatePostCheck(OrganizationPosition);
                if (ErrorMessages.Count > 0)
                {
                    OrganizationPosition = await CreateAddDropDownBoxes(OrganizationPosition, CurrentUser.Id, OrganizationPosition.OrganizationId);
                }
                else
                {
                    _organizationPositionProvider.CreatePost(OrganizationPosition);
                }
                OrganizationPositionCreateGetWithErrorMessages OrganizationPositionWithErrorMessage = new OrganizationPositionCreateGetWithErrorMessages { OrganizationPosition = OrganizationPosition, ErrorMessages = ErrorMessages };
                return Ok(OrganizationPositionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            OrganizationPositionCreateGetWithErrorMessages OrganizationPositionWithNoRights = new OrganizationPositionCreateGetWithErrorMessages { OrganizationPosition = OrganizationPosition, ErrorMessages = ErrorMessages };
            return Ok(OrganizationPositionWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _organizationPositionProvider.IndexGet(CurrentUser.Id, Id));
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

                var OrganizationPosition = await _organizationPositionProvider.UpdateGet(CurrentUser.Id, Id);
                OrganizationPosition = await UpdateAddDropDownBoxes(OrganizationPosition, CurrentUser.Id);
                return Ok(OrganizationPosition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(OrganizationPositionUpdateGet OrganizationPosition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            OrganizationPosition.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _organizationPositionProvider.UpdatePostCheck(OrganizationPosition);
                if (ErrorMessages.Count > 0)
                {
                    OrganizationPosition = await UpdateAddDropDownBoxes(OrganizationPosition, CurrentUser.Id);
                }
                else
                {
                    _organizationPositionProvider.UpdatePost(OrganizationPosition);
                }
                OrganizationPositionUpdateGetWithErrorMessages OrganizationPositionWithErrorMessage = new OrganizationPositionUpdateGetWithErrorMessages { OrganizationPosition = OrganizationPosition, ErrorMessages = ErrorMessages };
                return Ok(OrganizationPositionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            OrganizationPositionUpdateGetWithErrorMessages OrganizationPositionWithNoRights = new OrganizationPositionUpdateGetWithErrorMessages { OrganizationPosition = OrganizationPosition, ErrorMessages = ErrorMessages };
            return Ok(OrganizationPositionWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("OrganizationPositions", "OrganizationPositionID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var x = await _organizationPositionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(OrganizationPositionDeleteGet OrganizationPosition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                OrganizationPosition.UserId = CurrentUser.Id;
                //var CheckString = await _OrganizationPositionProvider.DeletePostCheck(OrganizationPosition);
                //if (CheckString.Length == 0)
                //{
                _organizationPositionProvider.DeletePost(CurrentUser.Id, OrganizationPosition.OrganizationPersonId);
                return Ok(OrganizationPosition);
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