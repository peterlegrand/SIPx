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
    public class PersonController : ControllerBase
    {
        private readonly IRoleProvider _roleProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IClassificationProvider _classificationProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IUserProvider _userProvider;
        private readonly IGenderProvider _genderProvider;
        private readonly IPersonProvider _personProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public PersonController(IRoleProvider roleProvider, IMasterListProvider masterListProvider, IProjectProvider projectProvider, IClassificationProvider classificationProvider, IClassificationValueProvider classificationValueProvider , IUserProvider userProvider, IGenderProvider genderProvider, IPersonProvider personProvider, ICheckProvider checkProvider,  IOrganizationProvider organizationProvider,  IClaimCheck claimCheck, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _roleProvider = roleProvider;
            _masterListProvider = masterListProvider;
            _projectProvider = projectProvider;
            _classificationProvider = classificationProvider;
            _classificationValueProvider = classificationValueProvider;
            _userProvider = userProvider;
            _genderProvider = genderProvider;
            _personProvider = personProvider;
            _checkProvider = checkProvider;
            _organizationProvider = organizationProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }
        private async Task<PersonCreateGet> CreateAddDropDownBoxes(PersonCreateGet Person, string UserId)
        {
            var Genders = await _genderProvider.List(UserId);
            var Organizations = await _organizationProvider.List(UserId);
            Person.Genders = Genders;
            Person.Organizations = Organizations;
            Person.Users = await _personProvider.CreateGetUsers();
            return Person;
        }
        private async Task<PersonUpdateGet> UpdateAddDropDownBoxes(PersonUpdateGet Person, string UserId)
        {

            var Gender = await _genderProvider.List(UserId);
            var Organization = await _organizationProvider.List(UserId);
            var Users = await _personProvider.EditGetUsers(Person.PersonId);

            Person.Genders = Gender;
            Person.Organizations = Organization;
            Person.Users = Users;
            return Person;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var Person = new PersonCreateGet();
                Person = await CreateAddDropDownBoxes(Person, CurrentUser.Id);
                return Ok(Person);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PersonCreateGet Person)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Person.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _personProvider.CreatePostCheck(Person);
                if (ErrorMessages.Count > 0)
                {
                    Person = await CreateAddDropDownBoxes(Person, CurrentUser.Id);
                }
                else
                {
                    _personProvider.CreatePost(Person);
                }
                PersonCreateGetWithErrorMessages PersonWithErrorMessage = new PersonCreateGetWithErrorMessages { Person = Person, ErrorMessages = ErrorMessages };
                return Ok(PersonWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PersonCreateGetWithErrorMessages PersonWithNoRights = new PersonCreateGetWithErrorMessages { Person = Person, ErrorMessages = ErrorMessages };
            return Ok(PersonWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _personProvider.IndexGet(CurrentUser.Id));
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
                var Person = await _personProvider.UpdateGet(CurrentUser.Id, Id);
                Person = await UpdateAddDropDownBoxes(Person, CurrentUser.Id);
                return Ok(Person);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PersonUpdateGet Person)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _personProvider.UpdatePostCheck(Person);
                if (ErrorMessages.Count > 0)
                {
                    Person = await UpdateAddDropDownBoxes(Person, CurrentUser.Id);
                }
                else
                {
                    _personProvider.UpdatePost(Person);
                }
                PersonUpdateGetWithErrorMessages PersonWithErrorMessage = new PersonUpdateGetWithErrorMessages { Person = Person, ErrorMessages = ErrorMessages };
                return Ok(PersonWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PersonUpdateGetWithErrorMessages PersonWithNoRights = new PersonUpdateGetWithErrorMessages { Person = Person, ErrorMessages = ErrorMessages };
            return Ok(PersonWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("Persons", "PersonID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _personProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PersonDeleteGet Person)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Person.UserId= CurrentUser.Id;
                //var CheckString = await _PersonProvider.DeletePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _personProvider.DeletePost(CurrentUser.Id, Person.PersonId);
                return Ok(Person);
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