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
    public class ClassificationRoleController : ControllerBase
    {
        private readonly IClassificationRelationTypeProvider _classificationRelationTypeProvider;
        private readonly IClassificationRoleProvider _classificationRoleProvider;
        private readonly IPeopleProvider _peopleProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationRoleController(IClassificationRelationTypeProvider classificationRelationTypeProvider, IClassificationRoleProvider classificationRoleProvider, IPeopleProvider peopleProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _classificationRelationTypeProvider = classificationRelationTypeProvider;
            _classificationRoleProvider = classificationRoleProvider;
            _peopleProvider = peopleProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }


        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> GetRoles(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "38"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationRoles", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationRoleProvider.IndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetRole(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "38"))
            {
                if (await _checkProvider.CheckIfRecordExists("Classificationroles", "ClassificationRoleID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var ClassificationRole = await _classificationRoleProvider.UpdateGet(CurrentUser.Id, Id);
                var RelationTypeList = await _classificationRelationTypeProvider.ListGet(CurrentUser.Id);
                var RoleList = await _peopleProvider.RoleList(CurrentUser.Id);
                ClassificationRole.ClassificationRelationTypes = RelationTypeList;
                ClassificationRole.Roles = RoleList;
                return Ok(ClassificationRole);
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
                var ClassificationRoleCreateGet = new ClassificationRoleCreateGet();
                var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(CurrentUser.Id);
                ClassificationRoleCreateGet.ClassificationRelationTypes = ClassificationRelationTypes;
                ClassificationRoleCreateGet.ClassificationId = Id;
                return Ok(ClassificationRoleCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(ClassificationRoleCreatePost ClassificationRole)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationRole.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _classificationRoleProvider.CreatePostCheck(ClassificationRole);
                if (CheckString.Length == 0)
                {
                    _classificationRoleProvider.CreatePost(ClassificationRole);
                    return Ok(ClassificationRole);
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