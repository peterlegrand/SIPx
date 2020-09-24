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

       

    }
}