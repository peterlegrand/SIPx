using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class ClassificationUserController : ControllerBase
    {
        private readonly IPeopleProvider _peopleProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationUserController(IPeopleProvider peopleProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _peopleProvider = peopleProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> GetUsers(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "42"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationUsers", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.ClassificationUserIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetUser(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "42"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationUsers", "ClassificationUserID", Id) == 0)  
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var ClassificationUser = await _classificationProvider.ClassificationUserUpdateGet(CurrentUser.Id, Id);
                var RelationTypeList = await _classificationProvider.ClassificationRelationTypeListGet(CurrentUser.Id);
                var UserList = await _peopleProvider.UserList();
                ClassificationUser.ClassificationRelationTypes = RelationTypeList;
                ClassificationUser.Users = UserList;
                return Ok(ClassificationUser);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ClassificationUserCreateGet = new ClassificationUserCreateGet();
                var ClassificationRelationTypes = await _classificationProvider.ClassificationRelationTypeList(CurrentUser.Id);
                ClassificationUserCreateGet.ClassificationRelationTypes = ClassificationRelationTypes;
                ClassificationUserCreateGet.ClassificationId = Id;
                return Ok(ClassificationUserCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(ClassificationUserCreatePost ClassificationUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationUser.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _classificationProvider.ClassificationUserCreatePostCheck(ClassificationUser);
                if (CheckString.Length == 0)
                {
                    _classificationProvider.ClassificationUserCreatePost(ClassificationUser);
                    return Ok(ClassificationUser);
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
    }
}