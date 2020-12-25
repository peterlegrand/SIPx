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
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPersonRelationTypeProvider _personRelationTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public PersonRelationTypeController(  ICheckProvider checkProvider
            , IMasterListProvider masterListProvider
            , IClaimCheck claimCheck
            , IPersonRelationTypeProvider personRelationTypeProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _claimCheck = claimCheck;
            _personRelationTypeProvider = personRelationTypeProvider;
            _userManager = userManager;
        }
        private async Task<PersonRelationTypeCreateGet> CreateAddDropDownBoxes(PersonRelationTypeCreateGet PersonRelationType, string UserId)
        {

            var icons = await _masterListProvider.IconList(UserId);
            PersonRelationType.Icons = icons;
            return PersonRelationType;
        }
        private async Task<PersonRelationTypeUpdateGet> UpdateAddDropDownBoxes(PersonRelationTypeUpdateGet PersonRelationType, string UserId)
        {
            return PersonRelationType;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var PersonRelationType = new PersonRelationTypeCreateGet();
                PersonRelationType = await CreateAddDropDownBoxes(PersonRelationType, CurrentUser.Id);
                return Ok(PersonRelationType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PersonRelationTypeCreateGet PersonRelationType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PersonRelationType.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _personRelationTypeProvider.CreatePostCheck(PersonRelationType);
                if (ErrorMessages.Count > 0)
                {
                    PersonRelationType = await CreateAddDropDownBoxes(PersonRelationType, CurrentUser.Id);
                }
                else
                {
                    _personRelationTypeProvider.CreatePost(PersonRelationType);
                }
                PersonRelationTypeCreateGetWithErrorMessages PersonRelationTypeWithErrorMessage = new PersonRelationTypeCreateGetWithErrorMessages { PersonRelationType = PersonRelationType, ErrorMessages = ErrorMessages };
                return Ok(PersonRelationTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PersonRelationTypeCreateGetWithErrorMessages PersonRelationTypeWithNoRights = new PersonRelationTypeCreateGetWithErrorMessages { PersonRelationType = PersonRelationType, ErrorMessages = ErrorMessages };
            return Ok(PersonRelationTypeWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var Type = await _personRelationTypeProvider.IndexGet(CurrentUser.Id);
                return Ok(Type);

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
                var x = await _personRelationTypeProvider.UpdateGet(CurrentUser.Id, Id);
                var icons = await _masterListProvider.IconList(CurrentUser.Id);
                x.Icons = icons;

                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PersonRelationTypeUpdateGet PersonRelationType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PersonRelationType.UserId= CurrentUser.Id;
                //var CheckString = await _PersonProvider.UpdatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _personRelationTypeProvider.UpdatePost(PersonRelationType);
                return Ok(PersonRelationType);
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
                if (await _checkProvider.CheckIfRecordExists("PersonRelationTypes", "PersonRelationTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _personRelationTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PersonRelationTypeDeleteGet PersonRelationType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PersonRelationType.UserId= CurrentUser.Id;
                //var CheckString = await _PersonRelationTypeProvider.DeletePostCheck(PersonRelationType);
                //if (CheckString.Length == 0)
                //{
                _personRelationTypeProvider.DeletePost(CurrentUser.Id, PersonRelationType.PersonRelationTypeId);
                return Ok(PersonRelationType);
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

        //[HttpGet("LanguageIndex/{Id:int}")]
        //public async Task<IActionResult> LanguageIndex(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        return Ok(await _personRelationTypeProvider.LanguageIndexGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("LanguageUpdate/{Id:int}")]
        //public async Task<IActionResult> LanguageUpdate(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        return Ok(await _personRelationTypeProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

    }
}