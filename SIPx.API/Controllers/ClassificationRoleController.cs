using System.Collections.Generic;
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
        private readonly IRoleProvider _roleProvider;
        private readonly IClassificationRelationTypeProvider _classificationRelationTypeProvider;
        private readonly IClassificationRoleProvider _classificationRoleProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationRoleController(IRoleProvider roleProvider, IClassificationRelationTypeProvider classificationRelationTypeProvider, IClassificationRoleProvider classificationRoleProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _roleProvider = roleProvider;
            _classificationRelationTypeProvider = classificationRelationTypeProvider;
            _classificationRoleProvider = classificationRoleProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        private async Task<ClassificationRoleCreateGet> CreateAddDropDownBoxes(ClassificationRoleCreateGet ClassificationRole, string UserId)
        {
            var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(UserId);
            ClassificationRole.ClassificationRelationTypes = ClassificationRelationTypes;
            ClassificationRole.Roles = await _roleProvider.List(UserId);
            return ClassificationRole;
        }
        private async Task<ClassificationRoleUpdateGet> UpdateAddDropDownBoxes(ClassificationRoleUpdateGet ClassificationRole, string UserId)
        {
            var RelationTypeList = await _classificationRelationTypeProvider.List(UserId);
            var RoleList = await _roleProvider.List(UserId);
            ClassificationRole.ClassificationRelationTypes = RelationTypeList;
            ClassificationRole.Roles = RoleList;
            return ClassificationRole;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationRole = new ClassificationRoleCreateGet();
                ClassificationRole = await CreateAddDropDownBoxes(ClassificationRole, CurrentUser.Id);
                ClassificationRole.ClassificationId = Id;
                return Ok(ClassificationRole);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationRoleCreateGet ClassificationRole)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationRole.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationRoleProvider.CreatePostCheck(ClassificationRole);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationRole = await CreateAddDropDownBoxes(ClassificationRole, CurrentUser.Id);
                }
                else
                {
                    _classificationRoleProvider.CreatePost(ClassificationRole);
                }
                ClassificationRoleCreateGetWithErrorMessages ClassificationRoleWithErrorMessage = new ClassificationRoleCreateGetWithErrorMessages { ClassificationRole = ClassificationRole, ErrorMessages = ErrorMessages };
                return Ok(ClassificationRoleWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationRoleCreateGetWithErrorMessages ClassificationRoleWithNoRights = new ClassificationRoleCreateGetWithErrorMessages { ClassificationRole = ClassificationRole, ErrorMessages = ErrorMessages };
            return Ok(ClassificationRoleWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationRoles", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                return Ok(await _classificationRoleProvider.IndexGet(CurrentUser.Id, Id));
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
                if (await _checkProvider.CheckIfRecordExists("Classificationroles", "ClassificationRoleID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var ClassificationRole = await _classificationRoleProvider.UpdateGet(CurrentUser.Id, Id);
                ClassificationRole = await UpdateAddDropDownBoxes(ClassificationRole, CurrentUser.Id);
                return Ok(ClassificationRole);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationRoleUpdateGet ClassificationRole)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationRoleProvider.UpdatePostCheck(ClassificationRole);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationRole = await UpdateAddDropDownBoxes(ClassificationRole, CurrentUser.Id);
                }
                else
                {
                    _classificationRoleProvider.UpdatePost(ClassificationRole);
                }
                ClassificationRoleUpdateGetWithErrorMessages ClassificationRoleWithErrorMessage = new ClassificationRoleUpdateGetWithErrorMessages { ClassificationRole = ClassificationRole, ErrorMessages = ErrorMessages };
                return Ok(ClassificationRoleWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationRoleUpdateGetWithErrorMessages ClassificationRoleWithNoRights = new ClassificationRoleUpdateGetWithErrorMessages { ClassificationRole = ClassificationRole, ErrorMessages = ErrorMessages };
            return Ok(ClassificationRoleWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationRoles", "ClassificationRoleID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationRoleProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationRoleDeleteGet ClassificationRole)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ClassificationRole.UserId= CurrentUser.Id;
                //var CheckString = await _ClassificationRoleProvider.DeletePostCheck(ClassificationRole);
                //if (CheckString.Length == 0)
                //{
                _classificationRoleProvider.DeletePost(ClassificationRole.ClassificationRoleId);
                return Ok(ClassificationRole);
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