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
using System.Runtime.CompilerServices;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class UserController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly ILanguageProvider _languageProvider;
        private readonly IGenderProvider _genderProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IUserProvider _userProvider;
        private readonly UserManager<SipUser> _userManager;

        public UserController(ICheckProvider checkProvider, ISecurityLevelProvider securityLevelProvider, ILanguageProvider languageProvider, IGenderProvider genderProvider, IOrganizationProvider organizationProvider, IClaimCheck claimCheck, IUserProvider userProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _securityLevelProvider = securityLevelProvider;
            _languageProvider = languageProvider;
            _genderProvider = genderProvider;
            _organizationProvider = organizationProvider;
            _claimCheck = claimCheck;
            _userProvider = userProvider;
            _userManager = userManager;
        }
        private async Task<UserCreateGet> CreateAddDropDownBoxes(UserCreateGet User, string UserId)
        {
            var Organizations = await _organizationProvider.List(UserId);
            var Genders = await _genderProvider.List(UserId);
            var Languages = await _languageProvider.List(UserId);
            var SecurityLevels = await _securityLevelProvider.List(UserId);
            User.Organizations = Organizations;
            User.SecurityLevels = SecurityLevels;
            User.Genders = Genders;
            User.Languages = Languages;

            return User;
        }

        private async Task<UserUpdateGet> UpdateAddDropDownBoxes(UserUpdateGet User, string UserId)
        {
             return User;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var User = new UserCreateGet();
                User = await CreateAddDropDownBoxes(User, CurrentUser.Id);
                return Ok(User);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(UserCreateGet CreateUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            CreateUser.ModifierCreator = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _userProvider.CreatePostCheck(CreateUser);
                if (ErrorMessages.Count > 0)
                {
                    CreateUser = await CreateAddDropDownBoxes(CreateUser, CurrentUser.Id);
                }
                else
                {
                    var identityUser = new SipUser
                    {
                        Email = CreateUser.Email,
                        UserName = CreateUser.Email,
                        //    FirstName = "Peter",
                        //    LastName = "le Grand",
                        //    LanguageId = 41,
                        SecurityLevelId = CreateUser.SecurityLevelId,
                        CreatedDate = DateTime.Now,
                        ModifiedDate = DateTime.Now
                    };
                    var x = await _userManager.CreateAsync(identityUser, CreateUser.Password);
                    if (x.Succeeded)
                    {
                        _userProvider.CreatePost(CreateUser);
                    }
                }
                UserCreateGetWithErrorMessages UserWithErrorMessage = new UserCreateGetWithErrorMessages { User = CreateUser, ErrorMessages = ErrorMessages };
                return Ok(UserWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            UserCreateGetWithErrorMessages UserWithNoRights = new UserCreateGetWithErrorMessages { User = CreateUser, ErrorMessages = ErrorMessages };
            return Ok(UserWithNoRights);
        }
        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _userProvider.IndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        //PETER TODO This has to be reviewed. Also the fill combo and error message is not done for the update
        [HttpGet("Update/{Id}")]
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var UserPerson = new UserUpdateGet();
                var person = await _userProvider.UpdateGetPerson(Id);
                var user = await _userProvider.UpdateGetUser(Id);
                var SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                var Genders = await _genderProvider.List(CurrentUser.Id);
                var Organizations = await _organizationProvider.List(CurrentUser.Id);
                UserPerson.SecurityLevels = SecurityLevels;
                UserPerson.Genders = Genders;
                UserPerson.Organizations = Organizations;

                UserPerson.PersonId = person.PersonId;
                UserPerson.Salutation = person.Salutation;
                UserPerson.FirstName = person.FirstName;
                UserPerson.MiddleName = person.MiddleName;
                UserPerson.LastName = person.LastName;
                UserPerson.PersonalTitle = person.PersonalTitle;
                UserPerson.Suffix = person.Suffix;
                UserPerson.NickName = person.NickName;
                UserPerson.FirstNameLocal = person.FirstNameLocal;
                UserPerson.MiddleNameLocal = person.MiddleNameLocal;
                UserPerson.LastNameLocal = person.LastNameLocal;
                UserPerson.GenderId = person.GenderId;
                UserPerson.BirthDate = person.BirthDate;
                UserPerson.DefaultOrganizationId = person.DefaultOrganizationId;
                UserPerson.UserId = user.UserId;
                UserPerson.UserName = user.UserName;
                UserPerson.Email = user.Email;
                UserPerson.NewPassword = user.NewPassword;
                UserPerson.ConfirmPassword = user.ConfirmPassword;
                UserPerson.SecurityLevelId = user.SecurityLevelId;
                UserPerson.CreatedDate = person.CreatedDate;
                UserPerson.CreatorId = person.CreatorId;
                UserPerson.CreatorName = person.CreatorName;
                UserPerson.ModifierId = person.ModifierId;
                UserPerson.ModifiedDate = person.ModifiedDate;
                UserPerson.ModifierName = person.ModifierName;
                //UserPerson.Person = person;
                //UserPerson.User = user;
                UserPerson.PersonId = person.PersonId;
                return Ok(UserPerson);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Update")]
        public async Task<IActionResult> Update(UserUpdateGet UpdateUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UpdateUser.UserModifierId = CurrentUser.Id;
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _userProvider.CreatePostCheck(CreateUser);
                //if (CheckString.Length == 0)
                {
                    var UserId = await _userProvider.usp_UserUpdatePostGetUserId(UpdateUser.PersonId);
                    var identityUser = await _userManager.FindByIdAsync(UserId);
                    identityUser.Email = UpdateUser.Email;
                    identityUser.UserName = UpdateUser.Email;
                    //    FirstName = "Peter",
                    //    LastName = "le Grand",
                    //    LanguageId = 41,
                    identityUser.SecurityLevelId = UpdateUser.SecurityLevelId;
                    identityUser.ModifiedDate = DateTime.Now;
                    var y = new IdentityResult();
                    y = IdentityResult.Failed();
                    if (UpdateUser.NewPassword != null)
                    {
                        if (UpdateUser.NewPassword == UpdateUser.ConfirmPassword && UpdateUser.ConfirmPassword.Length > 0)
                        {
                            var code = await _userManager.GeneratePasswordResetTokenAsync(identityUser);
                            y = await _userManager.ResetPasswordAsync(identityUser, code, UpdateUser.NewPassword);

                        }
                    }
                    else
                    {
                        y = IdentityResult.Success;
                    }
                    var x = await _userManager.UpdateAsync(identityUser);
                    if (x.Succeeded && y.Succeeded)
                    {
                        _userProvider.UpdatePost(UpdateUser);
                        return Ok(UpdateUser);
                    }
                }
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
                if (await _checkProvider.CheckIfRecordExists("Persons", "PersonID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var Person = await _userProvider.DeleteGetPerson(CurrentUser.Id, Id);
                var User = await _userProvider.DeleteGetUser(CurrentUser.Id, Id);
                var PersonUser = new UserDeleteGet();
                PersonUser.PersonId = User.PersonId;
                PersonUser.UserName = User.UserName;
                PersonUser.Email = User.Email;
                PersonUser.SecurityLevelName = User.SecurityLevelName;
                PersonUser.Salutation = Person.Salutation;
                PersonUser.FirstName = Person.FirstName;
                PersonUser.MiddleName = Person.MiddleName;
                PersonUser.LastName = Person.LastName;
                PersonUser.PersonalTitle = Person.PersonalTitle;
                PersonUser.Suffix = Person.Suffix;
                PersonUser.NickName = Person.NickName;
                PersonUser.FirstNameLocal = Person.FirstNameLocal;
                PersonUser.MiddleNameLocal = Person.MiddleNameLocal;
                PersonUser.GenderName = Person.GenderName;
                PersonUser.BirthDate = Person.BirthDate;
                PersonUser.OrganizationName = Person.OrganizationName;
                PersonUser.CreatorName = Person.CreatorName;
                PersonUser.CreatorId = Person.CreatorId;
                PersonUser.CreatedDate = Person.CreatedDate;
                PersonUser.ModifierName = Person.ModifierName;
                PersonUser.ModifierId = Person.ModifierId;
                PersonUser.ModifiedDate = Person.ModifiedDate;


                return Ok(PersonUser);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(UserDeleteGet UserToBeDeleted)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //                UserToBeDeleted.CreatorId = CurrentUser.Id;
                //var CheckString = await _classificationProvider.DeletePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{

                var UserId = await _userProvider.usp_UserUpdatePostGetUserId(UserToBeDeleted.PersonId);
                var identityUser = await _userManager.FindByIdAsync(UserId);
                _userProvider.DeletePost(CurrentUser.Id, UserToBeDeleted.PersonId);
                _userManager.DeleteAsync(identityUser);

                return Ok(UserToBeDeleted);
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