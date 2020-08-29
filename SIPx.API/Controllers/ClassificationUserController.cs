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
        private readonly IUserProvider _userProvider;
        private readonly IClassificationRelationTypeProvider _classificationRelationTypeProvider;
        private readonly IClassificationUserProvider _classificationUserProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationUserController(IUserProvider userProvider, IClassificationRelationTypeProvider classificationRelationTypeProvider, IClassificationUserProvider classificationUserProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _userProvider = userProvider;
            _classificationRelationTypeProvider = classificationRelationTypeProvider;
            _classificationUserProvider = classificationUserProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ClassificationUserCreateGet = new ClassificationUserCreateGet();
                var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(CurrentUser.Id);
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
        public async Task<IActionResult> Create(ClassificationUserCreatePost ClassificationUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationUser.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _classificationUserProvider.CreatePostCheck(ClassificationUser);
                if (CheckString.Length == 0)
                {
                    _classificationUserProvider.CreatePost(ClassificationUser);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
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

                return Ok(await _classificationUserProvider.IndexGet(CurrentUser.Id, Id));
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
                var ClassificationUser = await _classificationUserProvider.UpdateGet(CurrentUser.Id, Id);
                var RelationTypeList = await _classificationRelationTypeProvider.List(CurrentUser.Id);
                var UserList = await _userProvider.List();
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

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationUserUpdateGet ClassificationUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationUser.CreatorId = CurrentUser.Id;
                //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _classificationUserProvider.UpdatePost(ClassificationUser);
                return Ok(ClassificationUser);
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationUsers", "ClassificationUserID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationUserProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationUserDeleteGet ClassificationUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationUser.CreatorId = CurrentUser.Id;
                //var CheckString = await _ClassificationUserProvider.DeletePostCheck(ClassificationUser);
                //if (CheckString.Length == 0)
                //{
                _classificationUserProvider.DeletePost(ClassificationUser.ClassificationUserId);
                return Ok(ClassificationUser);
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