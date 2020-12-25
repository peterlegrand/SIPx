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
        private async Task<ClassificationUserCreateGet> CreateAddDropDownBoxes(ClassificationUserCreateGet ClassificationUser, string UserId)
        {
            var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(UserId);
            ClassificationUser.ClassificationRelationTypes = ClassificationRelationTypes;
            ClassificationUser.Users = await _userProvider.List();
            return ClassificationUser;
        }
        private async Task<ClassificationUserUpdateGet> UpdateAddDropDownBoxes(ClassificationUserUpdateGet ClassificationUser, string UserId)
        {
            var RelationTypeList = await _classificationRelationTypeProvider.List(UserId);
            var UserList = await _userProvider.List();
            ClassificationUser.ClassificationRelationTypes = RelationTypeList;
            ClassificationUser.Users = UserList;
            return ClassificationUser;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationUser = new ClassificationUserCreateGet();

                ClassificationUser = await CreateAddDropDownBoxes(ClassificationUser, CurrentUser.Id);
                ClassificationUser.ClassificationId = Id;
                return Ok(ClassificationUser);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationUserCreateGet ClassificationUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationUser.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationUserProvider.CreatePostCheck(ClassificationUser);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationUser = await CreateAddDropDownBoxes(ClassificationUser, CurrentUser.Id);
                }
                else
                {
                    _classificationUserProvider.CreatePost(ClassificationUser);
                }
                ClassificationUserCreateGetWithErrorMessages ClassificationUserWithErrorMessage = new ClassificationUserCreateGetWithErrorMessages { ClassificationUser = ClassificationUser, ErrorMessages = ErrorMessages };
                return Ok(ClassificationUserWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationUserCreateGetWithErrorMessages ClassificationUserWithNoRights = new ClassificationUserCreateGetWithErrorMessages { ClassificationUser = ClassificationUser, ErrorMessages = ErrorMessages };
            return Ok(ClassificationUserWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
              

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
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                ClassificationUser = await UpdateAddDropDownBoxes(ClassificationUser, CurrentUser.Id);
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
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationUserProvider.UpdatePostCheck(ClassificationUser);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationUser = await UpdateAddDropDownBoxes(ClassificationUser, CurrentUser.Id);
                }
                else
                {
                    _classificationUserProvider.UpdatePost(ClassificationUser);
                }
                ClassificationUserUpdateGetWithErrorMessages ClassificationUserWithErrorMessage = new ClassificationUserUpdateGetWithErrorMessages { ClassificationUser = ClassificationUser, ErrorMessages = ErrorMessages };
                return Ok(ClassificationUserWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationUserUpdateGetWithErrorMessages ClassificationUserWithNoRights = new ClassificationUserUpdateGetWithErrorMessages { ClassificationUser = ClassificationUser, ErrorMessages = ErrorMessages };
            return Ok(ClassificationUserWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ClassificationUser.UserId = CurrentUser.Id;
                //var CheckString = await _ClassificationUserProvider.DeletePostCheck(ClassificationUser);
                //if (CheckString.Length == 0)
                //{
                _classificationUserProvider.DeletePost(CurrentUser.Id, ClassificationUser.ClassificationUserId);
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