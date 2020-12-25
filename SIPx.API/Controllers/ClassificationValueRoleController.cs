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
    public class ClassificationValueRoleController : ControllerBase
    {
        private readonly IRoleProvider _roleProvider;
        private readonly IClassificationValueRoleProvider _classificationValueRoleProvider;
        private readonly IClassificationRelationTypeProvider _classificationRelationTypeProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationValueRoleController(IRoleProvider roleProvider, IClassificationValueRoleProvider classificationValueRoleProvider, IClassificationRelationTypeProvider classificationRelationTypeProvider, IClassificationValueProvider classificationValueProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _roleProvider = roleProvider;
            _classificationValueRoleProvider = classificationValueRoleProvider;
            _classificationRelationTypeProvider = classificationRelationTypeProvider;
            _classificationValueProvider = classificationValueProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }
        private async Task<ClassificationValueRoleCreateGet> CreateAddDropDownBoxes(ClassificationValueRoleCreateGet ClassificationValueRole, string UserId, int ClassificationValueId)
        {
            var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(UserId);
            var Classification = await _classificationValueRoleProvider.ClassificationValueRoleCreateGetClassificationName(UserId, ClassificationValueId);
            ClassificationValueRole.ClassificationId = Classification.ClassificationId;
            ClassificationValueRole.ClassificationValueName = Classification.ClassificationValueName;
            ClassificationValueRole.ClassificationRelationTypes = ClassificationRelationTypes;
            ClassificationValueRole.ClassificationValueId = ClassificationValueId;
            ClassificationValueRole.Roles = await _roleProvider.List(UserId);
            return ClassificationValueRole;
        }
        private async Task<ClassificationValueRoleUpdateGet> UpdateAddDropDownBoxes(ClassificationValueRoleUpdateGet ClassificationValueRole, string UserId, int ClassificationValueId)
        {
            var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(UserId);
            ClassificationValueRole.ClassificationRelationTypes = ClassificationRelationTypes;
            ClassificationValueRole.Roles = await _roleProvider.List(UserId);
            return ClassificationValueRole;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationValueRole = new ClassificationValueRoleCreateGet();
                ClassificationValueRole = await CreateAddDropDownBoxes(ClassificationValueRole, CurrentUser.Id, Id);
                return Ok(ClassificationValueRole);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationValueRoleCreateGet ClassificationValueRole)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationValueRole.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationValueRoleProvider.CreatePostCheck(ClassificationValueRole);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationValueRole = await CreateAddDropDownBoxes(ClassificationValueRole, CurrentUser.Id, ClassificationValueRole.ClassificationValueId);
                }
                else
                {
                    _classificationValueRoleProvider.CreatePost(ClassificationValueRole);
                }
                ClassificationValueRoleCreateGetWithErrorMessages ClassificationValueRoleWithErrorMessage = new ClassificationValueRoleCreateGetWithErrorMessages { ClassificationValueRole = ClassificationValueRole, ErrorMessages = ErrorMessages };
                return Ok(ClassificationValueRoleWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationValueRoleCreateGetWithErrorMessages ClassificationValueRoleWithNoRights = new ClassificationValueRoleCreateGetWithErrorMessages { ClassificationValueRole = ClassificationValueRole, ErrorMessages = ErrorMessages };
            return Ok(ClassificationValueRoleWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationValueRoles", "ClassificationValueID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                return Ok(await _classificationValueRoleProvider.IndexGet(CurrentUser.Id, Id));
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueRoles", "ClassificationValueRoleID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var ClassificationValueRole = await _classificationValueRoleProvider.UpdateGet(CurrentUser.Id, Id);
                ClassificationValueRole = await UpdateAddDropDownBoxes(ClassificationValueRole, CurrentUser.Id, ClassificationValueRole.ClassificationValueId);
                return Ok(ClassificationValueRole);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationValueRoleUpdateGet ClassificationValueRole)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationValueRoleProvider.UpdatePostCheck(ClassificationValueRole);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationValueRole = await UpdateAddDropDownBoxes(ClassificationValueRole, CurrentUser.Id, ClassificationValueRole.ClassificationValueId);
                }
                else
                {
                    _classificationValueRoleProvider.UpdatePost(ClassificationValueRole);
                }
                ClassificationValueRoleUpdateGetWithErrorMessages ClassificationValueRoleWithErrorMessage = new ClassificationValueRoleUpdateGetWithErrorMessages { ClassificationValueRole = ClassificationValueRole, ErrorMessages = ErrorMessages };
                return Ok(ClassificationValueRoleWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationValueRoleUpdateGetWithErrorMessages ClassificationValueRoleWithNoRights = new ClassificationValueRoleUpdateGetWithErrorMessages { ClassificationValueRole = ClassificationValueRole, ErrorMessages = ErrorMessages };
            return Ok(ClassificationValueRoleWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueRoles", "ClassificationValueRoleID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationValueRoleProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationValueRoleDeleteGet ClassificationValueRole)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ClassificationValueRole.UserId= CurrentUser.Id;
                //var CheckString = await _ClassificationValueRoleProvider.DeletePostCheck(ClassificationValueRole);
                //if (CheckString.Length == 0)
                //{
                _classificationValueRoleProvider.DeletePost(CurrentUser.Id, ClassificationValueRole.ClassificationValueRoleId);
                return Ok(ClassificationValueRole);
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