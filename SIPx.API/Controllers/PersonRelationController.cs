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
    public class PersonRelationController : ControllerBase
    {
        private readonly IPersonRelationTypeProvider _personRelationTypeProvider;
        private readonly IPersonProvider _personProvider;
        private readonly IPersonRelationProvider _personRelationProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public PersonRelationController(IPersonRelationTypeProvider personRelationTypeProvider, IPersonProvider personProvider, IPersonRelationProvider personRelationProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _personRelationTypeProvider = personRelationTypeProvider;
            _personProvider = personProvider;
            _personRelationProvider = personRelationProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }
        private async Task<PersonRelationCreateGet> CreateAddDropDownBoxes(PersonRelationCreateGet PersonRelation, string UserId)
        {
            var PersonRelationTypes = await _personRelationTypeProvider.List(UserId);
            var Persons = await _personProvider.List();
            PersonRelation.PersonRelationTypes = PersonRelationTypes;
            PersonRelation.Persons = Persons;
            return PersonRelation;
        }
        private async Task<PersonRelationUpdateGet> UpdateAddDropDownBoxes(PersonRelationUpdateGet PersonRelation, string UserId)
        {
            return PersonRelation;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var PersonRelation = new PersonRelationCreateGet();
                PersonRelation = await CreateAddDropDownBoxes(PersonRelation, CurrentUser.Id);
                return Ok(PersonRelation);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PersonRelationCreateGet PersonRelation)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PersonRelation.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _personRelationProvider.CreatePostCheck(PersonRelation);
                if (ErrorMessages.Count > 0)
                {
                    PersonRelation = await CreateAddDropDownBoxes(PersonRelation, CurrentUser.Id);
                }
                else
                {
                    _personRelationProvider.CreatePost(PersonRelation);
                }
                PersonRelationCreateGetWithErrorMessages PersonRelationWithErrorMessage = new PersonRelationCreateGetWithErrorMessages { PersonRelation = PersonRelation, ErrorMessages = ErrorMessages };
                return Ok(PersonRelationWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PersonRelationCreateGetWithErrorMessages PersonRelationWithNoRights = new PersonRelationCreateGetWithErrorMessages { PersonRelation = PersonRelation, ErrorMessages = ErrorMessages };
            return Ok(PersonRelationWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //Need to go back to this page from from and to
                return Ok(await _personRelationProvider.IndexGet(CurrentUser.Id, Id));
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
                return Ok(await _personRelationProvider.UpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PersonRelationUpdateGet PersonRelation)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _personRelationProvider.UpdatePostCheck(PersonRelation);
                if (ErrorMessages.Count > 0)
                {
                    PersonRelation = await UpdateAddDropDownBoxes(PersonRelation, CurrentUser.Id);
                }
                else
                {
                    _personRelationProvider.UpdatePost(PersonRelation);
                }
                PersonRelationUpdateGetWithErrorMessages PersonRelationWithErrorMessage = new PersonRelationUpdateGetWithErrorMessages { PersonRelation = PersonRelation, ErrorMessages = ErrorMessages };
                return Ok(PersonRelationWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PersonRelationUpdateGetWithErrorMessages PersonRelationWithNoRights = new PersonRelationUpdateGetWithErrorMessages { PersonRelation = PersonRelation, ErrorMessages = ErrorMessages };
            return Ok(PersonRelationWithNoRights);
       

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("PersonRelations", "PersonRelationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _personRelationProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PersonRelationDeleteGet PersonRelation)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PersonRelation.UserId= CurrentUser.Id;
                //var CheckString = await _PersonRelationProvider.DeletePostCheck(PersonRelation);
                //if (CheckString.Length == 0)
                //{
                _personRelationProvider.DeletePost(PersonRelation.PersonRelationId);
                return Ok(PersonRelation);
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