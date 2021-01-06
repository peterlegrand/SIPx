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
    public class ClassificationLevelPropertyController : ControllerBase
    {
        private readonly IPropertyStatusProvider _propertyStatusProvider;
        private readonly IClassificationLevelPropertyProvider _classificationLevelPropertyProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationLevelPropertyController(IPropertyStatusProvider propertyStatusProvider, IClassificationLevelPropertyProvider classificationLevelPropertyProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _propertyStatusProvider = propertyStatusProvider;
            _classificationLevelPropertyProvider = classificationLevelPropertyProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        private async Task<ClassificationLevelPropertyCreateGet> CreateAddDropDownBoxes(ClassificationLevelPropertyCreateGet ClassificationLevelProperty, string UserId)
        {
            var Properties = await _classificationLevelPropertyProvider.CreateGetPropertyList(UserId, ClassificationLevelProperty.ClassificationLevelId);
            ClassificationLevelProperty.Properties = Properties;
            ClassificationLevelProperty.PropertyStatuses = await _propertyStatusProvider.List(UserId);
            return ClassificationLevelProperty;
        }
        private async Task<ClassificationLevelPropertyUpdateGet> UpdateAddDropDownBoxes(ClassificationLevelPropertyUpdateGet ClassificationLevelProperty, string UserId)
        {
            ClassificationLevelProperty.PropertyStatuses = await _propertyStatusProvider.List(UserId);
            return ClassificationLevelProperty;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationLevelProperty = await _classificationLevelPropertyProvider.CreateGet(CurrentUser.Id, Id);
                ClassificationLevelProperty = await CreateAddDropDownBoxes(ClassificationLevelProperty, CurrentUser.Id);
                return Ok(ClassificationLevelProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationLevelPropertyCreateGet ClassificationLevelProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationLevelProperty.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {

                ErrorMessages = await _classificationLevelPropertyProvider.CreatePostCheck(ClassificationLevelProperty);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationLevelProperty = await CreateAddDropDownBoxes(ClassificationLevelProperty, CurrentUser.Id);
                }
                else
                {
                    _classificationLevelPropertyProvider.CreatePost(ClassificationLevelProperty);
                }
                ClassificationLevelPropertyCreateGetWithErrorMessages ClassificationLevelPropertyWithErrorMessage = new ClassificationLevelPropertyCreateGetWithErrorMessages { ClassificationLevelProperty = ClassificationLevelProperty, ErrorMessages = ErrorMessages };
                return Ok(ClassificationLevelPropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationLevelPropertyCreateGetWithErrorMessages ClassificationLevelPropertyWithNoRights = new ClassificationLevelPropertyCreateGetWithErrorMessages { ClassificationLevelProperty = ClassificationLevelProperty, ErrorMessages = ErrorMessages };
            return Ok(ClassificationLevelPropertyWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationLevelPropertys", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}


                return Ok(await _classificationLevelPropertyProvider.IndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationLevelPropertyUpdateGet ClassificationLevelProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationLevelProperty.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationLevelPropertyProvider.UpdatePostCheck(ClassificationLevelProperty);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationLevelProperty = await UpdateAddDropDownBoxes(ClassificationLevelProperty, CurrentUser.Id);
                }
                else
                {
                    _classificationLevelPropertyProvider.UpdatePost(ClassificationLevelProperty);
                }
                ClassificationLevelPropertyUpdateGetWithErrorMessages ClassificationLevelPropertyWithErrorMessage = new ClassificationLevelPropertyUpdateGetWithErrorMessages { ClassificationLevelProperty = ClassificationLevelProperty, ErrorMessages = ErrorMessages };
                return Ok(ClassificationLevelPropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationLevelPropertyUpdateGetWithErrorMessages ClassificationLevelPropertyWithNoRights = new ClassificationLevelPropertyUpdateGetWithErrorMessages { ClassificationLevelProperty = ClassificationLevelProperty, ErrorMessages = ErrorMessages };
            return Ok(ClassificationLevelPropertyWithNoRights);
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationLevelProperties", "ClassificationLevelPropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var ClassificationLevelProperty = await _classificationLevelPropertyProvider.UpdateGet(CurrentUser.Id, Id);
                ClassificationLevelProperty = await UpdateAddDropDownBoxes(ClassificationLevelProperty, CurrentUser.Id);

                return Ok(ClassificationLevelProperty);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationLevelProperties", "ClassificationLevelPropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationLevelPropertyProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationLevelPropertyDeleteGet ClassificationLevelProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ClassificationLevelProperty.UserId= CurrentUser.Id;
                //var CheckString = await _ClassificationLevelPropertyProvider.DeletePostCheck(ClassificationLevelProperty);
                //if (CheckString.Length == 0)
                //{
                _classificationLevelPropertyProvider.DeletePost(CurrentUser.Id, ClassificationLevelProperty.ClassificationLevelPropertyId);
                return Ok(ClassificationLevelProperty);
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