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

        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var PersonCreateGet = new PersonCreateGet();
                var Genders = await _genderProvider.List(CurrentUser.Id);
                var Organizations = await _organizationProvider.List(CurrentUser.Id);
                PersonCreateGet.Genders = Genders;
                PersonCreateGet.Organizations = Organizations;
                return Ok(PersonCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PersonCreatePost Person)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Person.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _personProvider.CreatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                    _personProvider.CreatePost(Person);
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

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var x = await _personProvider.UpdateGet(CurrentUser.Id, Id);
                var y = await _genderProvider.List(CurrentUser.Id);
                var z = await _organizationProvider.List(CurrentUser.Id);
                var a = await _userProvider.List();
                x.Genders = y;
                x.Organizations = z;
                x.Users = a;
                return Ok(x);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                Person.ModifierId = CurrentUser.Id;
                //var CheckString = await _PersonProvider.UpdatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _personProvider.UpdatePost(Person);
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

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                Person.CreatorId = CurrentUser.Id;
                //var CheckString = await _PersonProvider.DeletePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _personProvider.DeletePost(Person.PersonId);
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

        [HttpGet("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var PersonSearch = new PersonAdvancedSearchPost();
                PersonSearch.Classifications = await _classificationProvider.List(CurrentUser.Id);
                PersonSearch.ClassificationValues = await _classificationValueProvider.List(CurrentUser.Id);
                PersonSearch.Organizations= await _organizationProvider.List(CurrentUser.Id);
                PersonSearch.Projects = await _projectProvider.List(CurrentUser.Id);
                PersonSearch.Countries = await _masterListProvider.CountryList(CurrentUser.Id);
                PersonSearch.Roles= await _roleProvider.List(CurrentUser.Id);
                return Ok(PersonSearch);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpPost("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch(PersonAdvancedSearchPost AdvancedSearch)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            AdvancedSearch.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _personProvider.CreatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                if (AdvancedSearch.Contains == null)
                { AdvancedSearch.Contains = ""; }
                if (AdvancedSearch.Age == null)
                { AdvancedSearch.Age = 0; }
                if (AdvancedSearch.BirthDate == null)
                { AdvancedSearch.BirthDate = Convert.ToDateTime("1-1-1"); }
                if (AdvancedSearch.MainOrganizationId == null)
                { AdvancedSearch.MainOrganizationId = 0; }
                if (AdvancedSearch.IsUser == null)
                { AdvancedSearch.IsUser = 2; }
                if (AdvancedSearch.RoleId == null)
                { AdvancedSearch.RoleId = ""; }
                if (AdvancedSearch.OrganizationId == null)
                { AdvancedSearch.OrganizationId = 0; }
                if (AdvancedSearch.ProjectId == null)
                { AdvancedSearch.ProjectId = 0; }
                if (AdvancedSearch.CountryId == null)
                { AdvancedSearch.CountryId = 0; }
                if (AdvancedSearch.ProvinceState == null)
                { AdvancedSearch.ProvinceState = ""; }
                if (AdvancedSearch.County == null)
                { AdvancedSearch.County = ""; }
                if (AdvancedSearch.City == null)
                { AdvancedSearch.City = ""; }
                if (AdvancedSearch.ClassificationId== null)
                { AdvancedSearch.ClassificationId = 0; }
                if (AdvancedSearch.ClassificationValueId== null)
                { AdvancedSearch.ClassificationValueId = 0; }

                var Result = await _personProvider.AdvancedSearch(CurrentUser.Id,AdvancedSearch);
                
                return Ok(Result);
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