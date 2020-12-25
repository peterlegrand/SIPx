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
        private async Task<ClassificationValueUserCreateGet> CreateAddDropDownBoxes(ClassificationValueUserCreateGet ClassificationValueUser, string UserId, int ClassificationValueId)
        {
            var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(UserId);
            ClassificationValueUser.ClassificationRelationTypes = ClassificationRelationTypes;
            var ClassificationValue = await _classificationValueRoleProvider.ClassificationValueRoleCreateGetClassificationName(UserId, ClassificationValueId);
            ClassificationValueUser.ClassificationId = ClassificationValue.ClassificationId;
            ClassificationValueUser.ClassificationValueName = ClassificationValue.ClassificationValueName;
            ClassificationValueUser.Users = await _userProvider.List();
            ClassificationValueUser.ClassificationValueId = ClassificationValueId;
            return ClassificationValueUser;
        }
        private async Task<ClassificationValueUserUpdateGet> UpdateAddDropDownBoxes(ClassificationValueUserUpdateGet ClassificationValueUser, string UserId, int ClassificationValueId)
        {
            var RelationTypeList = await _classificationRelationTypeProvider.List(UserId);
            var UserList = await _userProvider.List();
            ClassificationValueUser.ClassificationRelationTypes = RelationTypeList;
            ClassificationValueUser.Users = UserList;
            return ClassificationValueUser;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User); ;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationValueUserCreateGet = new ClassificationValueUserCreateGet();
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
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  
            {
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
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                ClassificationValueUser = await UpdateAddDropDownBoxes(ClassificationValueUser, CurrentUser.Id, ClassificationValueUser.ClassificationValueId);
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
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationValueUserProvider.UpdatePostCheck(ClassificationValueUser);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationValueUser = await UpdateAddDropDownBoxes(ClassificationValueUser, CurrentUser.Id, ClassificationValueUser.ClassificationValueId);
                }
                else
                {
                    _classificationValueUserProvider.UpdatePost(ClassificationValueUser);
                }
                ClassificationValueUserUpdateGetWithErrorMessages ClassificationValueUserWithErrorMessage = new ClassificationValueUserUpdateGetWithErrorMessages { ClassificationValueUser = ClassificationValueUser, ErrorMessages = ErrorMessages };
                return Ok(ClassificationValueUserWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationValueUserUpdateGetWithErrorMessages ClassificationValueUserWithNoRights = new ClassificationValueUserUpdateGetWithErrorMessages { ClassificationValueUser = ClassificationValueUser, ErrorMessages = ErrorMessages };
            return Ok(ClassificationValueUserWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ClassificationValueUser.UserId= CurrentUser.Id;
                //var CheckString = await _ClassificationValueUserProvider.DeletePostCheck(ClassificationValueUser);
                //if (CheckString.Length == 0)
                //{
                _classificationValueUserProvider.DeletePost(CurrentUser.Id, ClassificationValueUser.ClassificationValueUserId);
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