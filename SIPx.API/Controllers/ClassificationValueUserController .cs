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
        private readonly IMasterProvider _masterProvider;
        private readonly IClassificationValueRoleProvider _classificationValueRoleProvider;
        private readonly IUserProvider _userProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationValueUserController(IClassificationValueRoleProvider classificationValueRoleProvider, IUserProvider userProvider, IClassificationRelationTypeProvider classificationRelationTypeProvider, IClassificationValueUserProvider classificationValueUserProvider, IClassificationValueProvider classificationValueProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _classificationRelationTypeProvider = classificationRelationTypeProvider;
            _classificationValueUserProvider = classificationValueUserProvider;
            _classificationValueProvider = classificationValueProvider;
            _masterProvider = masterProvider;
            _classificationValueRoleProvider = classificationValueRoleProvider;
            _userProvider = userProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
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
                var x = await _classificationValueRoleProvider.ClassificationValueRoleCreateGetClassificationName(CurrentUser.Id, Id);
                ClassificationValueUserCreateGet.ClassificationId = x.ClassificationId;
                ClassificationValueUserCreateGet.ClassificationValueName = x.ClassificationValueName;
                ClassificationValueUserCreateGet.Users = await _userProvider.List();
                ClassificationValueUserCreateGet.ClassificationValueId = Id;
                return Ok(ClassificationValueUserCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationValueUserCreateGet ClassificationValueUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationValueUser.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _classificationValueUserProvider.CreatePostCheck(ClassificationValueUser);
                //if (CheckString.Length == 0)
                //{
                    _classificationValueUserProvider.CreatePost(ClassificationValueUser);
                    return Ok(ClassificationValueUser);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "50"))  //PETER TODO looks like there is also a value 54
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationValueUsers", "ClassificationValueID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                return Ok(await _classificationValueUserProvider.IndexGet(CurrentUser.Id, Id));
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
                var ClassificationValueUser = await _classificationValueUserProvider.UpdateGet(CurrentUser.Id, Id);
                var RelationTypeList = await _classificationRelationTypeProvider.List(CurrentUser.Id);
                var UserList = await _userProvider.List();
                ClassificationValueUser.ClassificationRelationTypes = RelationTypeList;
                ClassificationValueUser.Users = UserList;
                return Ok(ClassificationValueUser);
//                return Ok(await _classificationProvider.UpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationValueUserUpdateGet ClassificationValueUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationValueUser.UserId = CurrentUser.Id;
                //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _classificationValueUserProvider.UpdatePost(ClassificationValueUser);
                return Ok(ClassificationValueUser);
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueUsers", "ClassificationValueUserID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationValueUserProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationValueUserDeleteGet ClassificationValueUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationValueUser.CreatorId = CurrentUser.Id;
                //var CheckString = await _ClassificationValueUserProvider.DeletePostCheck(ClassificationValueUser);
                //if (CheckString.Length == 0)
                //{
                _classificationValueUserProvider.DeletePost(ClassificationValueUser.ClassificationValueUserId);
                return Ok(ClassificationValueUser);
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