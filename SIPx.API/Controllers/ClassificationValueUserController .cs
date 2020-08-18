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
    public class ClassificationValueUserController : ControllerBase
    {
        private readonly IClassificationRelationTypeProvider _classificationRelationTypeProvider;
        private readonly IClassificationValueUserProvider _classificationValueUserProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IPeopleProvider _peopleProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationValueUserController(IClassificationRelationTypeProvider classificationRelationTypeProvider, IClassificationValueUserProvider classificationValueUserProvider, IClassificationValueProvider classificationValueProvider, IPeopleProvider peopleProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _classificationRelationTypeProvider = classificationRelationTypeProvider;
            _classificationValueUserProvider = classificationValueUserProvider;
            _classificationValueProvider = classificationValueProvider;
            _peopleProvider = peopleProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }


        [HttpGet("ValueUserIndex/{Id:int}")]
        public async Task<IActionResult> GetValueUsers(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "50"))  //PETER TODO looks like there is also a value 54
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueUsers", "ClassificationValueID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationValueProvider.ClassificationValueUserIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("ValueUserEdit/{Id:int}")]
        public async Task<IActionResult> GetValueUser(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "50"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueUsers", "ClassificationValueUserID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                //PETER I UPDATED THIS IN THE Wrong controller
                var ClassificationUser = await _classificationValueUserProvider.UpdateGet(CurrentUser.Id, Id);
                var RelationTypeList = await _classificationRelationTypeProvider.ListGet(CurrentUser.Id);
                var UserList = await _peopleProvider.UserList();
                ClassificationUser.ClassificationRelationTypes = RelationTypeList;
                ClassificationUser.Users = UserList;
                return Ok(ClassificationUser);
//                return Ok(await _classificationProvider.ClassificationValueUserUpdateGet(CurrentUser.Id, Id));
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
            var CurrentUser = await _userManager.GetUserAsync(User); ;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ClassificationValueUserCreateGet = new ClassificationValueUserCreateGet();
                var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(CurrentUser.Id);
                ClassificationValueUserCreateGet.ClassificationRelationTypes = ClassificationRelationTypes;
                ClassificationValueUserCreateGet.ClassificationId = Id;
                return Ok(ClassificationValueUserCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(ClassificationValueUserCreatePost ClassificationValueUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationValueUser.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _classificationValueProvider.ClassificationValueUserCreatePostCheck(ClassificationValueUser);
                if (CheckString.Length == 0)
                {
                    _classificationValueProvider.ClassificationValueUserCreatePost(ClassificationValueUser);
                    return Ok(ClassificationValueUser);
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