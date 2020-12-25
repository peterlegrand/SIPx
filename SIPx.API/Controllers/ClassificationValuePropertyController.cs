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
    public class ClassificationValuePropertyController : ControllerBase
    {
        private readonly IRoleProvider _roleProvider;
        private readonly IClassificationValuePropertyProvider _classificationValuePropertyProvider;
        private readonly IClassificationRelationTypeProvider _classificationRelationTypeProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationValuePropertyController(IRoleProvider roleProvider, IClassificationValuePropertyProvider classificationValuePropertyProvider, IClassificationRelationTypeProvider classificationRelationTypeProvider, IClassificationValueProvider classificationValueProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _roleProvider = roleProvider;
            _classificationValuePropertyProvider = classificationValuePropertyProvider;
            _classificationRelationTypeProvider = classificationRelationTypeProvider;
            _classificationValueProvider = classificationValueProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }
        private async Task<ClassificationValuePropertyCreateGet> CreateAddDropDownBoxes(ClassificationValuePropertyCreateGet ClassificationValueProperty, string UserId, int ClassificationValueId)
        {
            var Properties = await _classificationValuePropertyProvider.CreateGetProperties(UserId, ClassificationValueId);
            ClassificationValueProperty.Properties = Properties;
            ClassificationValueProperty.ClassificationValueId = ClassificationValueId;
            return ClassificationValueProperty;
        }
        private async Task<ClassificationValuePropertyUpdateGet> UpdateAddDropDownBoxes(ClassificationValuePropertyUpdateGet ClassificationValueProperty, string UserId)
        {
            var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(UserId);
            return ClassificationValueProperty;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationValueProperty = new ClassificationValuePropertyCreateGet();
                ClassificationValueProperty = await CreateAddDropDownBoxes(ClassificationValueProperty, CurrentUser.Id, Id);
                return Ok(ClassificationValueProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationValuePropertyCreateGet ClassificationValueProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationValuePropertyProvider.CreatePostCheck(ClassificationValueProperty);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationValueProperty = await CreateAddDropDownBoxes(ClassificationValueProperty, CurrentUser.Id, ClassificationValueProperty.ClassificationValueId);
                }
                else
                {
                    _classificationValuePropertyProvider.CreatePost(ClassificationValueProperty);
                }
                ClassificationValuePropertyCreateGetWithErrorMessages ClassificationValuePropertyWithErrorMessage = new ClassificationValuePropertyCreateGetWithErrorMessages { ClassificationValueProperty = ClassificationValueProperty, ErrorMessages = ErrorMessages };
                return Ok(ClassificationValuePropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationValuePropertyCreateGetWithErrorMessages ClassificationValuePropertyWithNoRights = new ClassificationValuePropertyCreateGetWithErrorMessages { ClassificationValueProperty = ClassificationValueProperty, ErrorMessages = ErrorMessages };
            return Ok(ClassificationValuePropertyWithNoRights);
        }

        //PETER I think this should not be here and the above need to be renamed to create.
        //[HttpPost("Create")]
        //public async Task<IActionResult> Create(ClassificationValuePropertyCreateGet ClassificationValueProperty)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    //ClassificationValueProperty.CreatorId = CurrentUser.Id;
        //                if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        //var CheckString = await _classificationValuePropertyProvider.CreatePostCheck(ClassificationValueProperty);
        //        //if (CheckString.Length == 0)
        //        //{
        //        _classificationValuePropertyProvider.CreatePost(ClassificationValueProperty);
        //        return Ok(ClassificationValueProperty);
        //        //}
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            //Message = CheckString,
        //        });
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationValuePropertys", "ClassificationValueID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                return Ok(await _classificationValuePropertyProvider.IndexGet(CurrentUser.Id, Id));
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationValuePropertys", "ClassificationValuePropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var ClassificationValueProperty = await _classificationValuePropertyProvider.UpdateGet(CurrentUser.Id, Id);
                ClassificationValueProperty = await UpdateAddDropDownBoxes(ClassificationValueProperty, CurrentUser.Id); 
                return Ok(ClassificationValueProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationValuePropertyUpdateGet ClassificationValueProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationValuePropertyProvider.UpdatePostCheck(ClassificationValueProperty);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationValueProperty = await UpdateAddDropDownBoxes(ClassificationValueProperty, CurrentUser.Id);
                }
                else
                {
                    _classificationValuePropertyProvider.UpdatePost(ClassificationValueProperty);
                }
                ClassificationValuePropertyUpdateGetWithErrorMessages ClassificationValuePropertyWithErrorMessage = new ClassificationValuePropertyUpdateGetWithErrorMessages { ClassificationValueProperty = ClassificationValueProperty, ErrorMessages = ErrorMessages };
                return Ok(ClassificationValuePropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationValuePropertyUpdateGetWithErrorMessages ClassificationValuePropertyWithNoRights = new ClassificationValuePropertyUpdateGetWithErrorMessages { ClassificationValueProperty = ClassificationValueProperty, ErrorMessages = ErrorMessages };
            return Ok(ClassificationValuePropertyWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValuePropertys", "ClassificationValuePropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationValuePropertyProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationValuePropertyDeleteGet ClassificationValueProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ClassificationValueProperty.UserId= CurrentUser.Id;
                //var CheckString = await _ClassificationValuePropertyProvider.DeletePostCheck(ClassificationValueProperty);
                //if (CheckString.Length == 0)
                //{
                _classificationValuePropertyProvider.DeletePost(CurrentUser.Id, ClassificationValueProperty.ClassificationValuePropertyId);
                return Ok(ClassificationValueProperty);
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