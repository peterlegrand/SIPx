using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.Shared;
using SIPx.DataAccess;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class ProjectTypePropertyController : ControllerBase
    {
        private readonly IObjectTypePropertyStatus _objectTypePropertyStatus;
        private readonly ICheckProvider _checkProvider;
        private readonly IProjectTypePropertyProvider _projectTypePropertyProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPropertyProvider _propertyProvider;
        private readonly IProjectTypeProvider _projectTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProjectTypePropertyController(
            IObjectTypePropertyStatus objectTypePropertyStatus
            , ICheckProvider checkProvider
            , IProjectTypePropertyProvider ProjectTypePropertyProvider
            , IClaimCheck claimCheck
            , IPropertyProvider propertyProvider 
            , IProjectTypeProvider projectTypeProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _objectTypePropertyStatus = objectTypePropertyStatus;
            _checkProvider = checkProvider;
            _projectTypePropertyProvider = ProjectTypePropertyProvider;
            _claimCheck = claimCheck;
            _propertyProvider = propertyProvider;
            _projectTypeProvider = projectTypeProvider;
            _userManager = userManager;
        }
        private async Task<ObjectTypePropertyCreateGet> CreateAddDropDownBoxes(ObjectTypePropertyCreateGet ProjectTypeProperty, string UserId)
        {
            ProjectTypeProperty.Statuses = await _objectTypePropertyStatus.List(UserId);
            ProjectTypeProperty.Properties = await _propertyProvider.List(UserId);
            ProjectTypeProperty.ObjectTypeName = await _projectTypeProvider.ReturnName(UserId, ProjectTypeProperty.ObjectTypeId);
            return ProjectTypeProperty;
        }

        private async Task<ObjectTypePropertyUpdateGet> UpdateAddDropDownBoxes(ObjectTypePropertyUpdateGet ProjectTypeProperty, string UserId)
        {
            ProjectTypeProperty.Statuses = await _objectTypePropertyStatus.List(UserId);
            ProjectTypeProperty.Properties = await _propertyProvider.List(UserId);
            ProjectTypeProperty.ObjectTypeName = await _projectTypeProvider.ReturnName(UserId, ProjectTypeProperty.ObjectTypeId);
            return ProjectTypeProperty;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProjectTypeProperty = new ObjectTypePropertyCreateGet();
                ProjectTypeProperty.ObjectTypeId = Id;
                ProjectTypeProperty = await CreateAddDropDownBoxes(ProjectTypeProperty, CurrentUser.Id);
                return Ok(ProjectTypeProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ObjectTypePropertyCreateGet ProjectTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProjectTypeProperty.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _projectTypePropertyProvider.CreatePostCheck(ProjectTypeProperty);
                if (ErrorMessages.Count > 0)
                {
                    ProjectTypeProperty = await CreateAddDropDownBoxes(ProjectTypeProperty, CurrentUser.Id);
                }
                else
                {
                    _projectTypePropertyProvider.CreatePost(ProjectTypeProperty);
                }
                ObjectTypePropertyCreateGetWithErrorMessages ProjectTypePropertyWithErrorMessage = new ObjectTypePropertyCreateGetWithErrorMessages { ObjectTypeProperty = ProjectTypeProperty, ErrorMessages = ErrorMessages };
                return Ok(ProjectTypePropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ObjectTypePropertyCreateGetWithErrorMessages ProjectTypePropertyWithNoRights = new ObjectTypePropertyCreateGetWithErrorMessages { ObjectTypeProperty= ProjectTypeProperty, ErrorMessages = ErrorMessages };
            return Ok(ProjectTypePropertyWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ObjectTypeProperty = new ObjectTypePropertyIndexGet();
                ObjectTypeProperty.ObjectTypeId = Id;
                ObjectTypeProperty.ObjectTypeName = await _projectTypeProvider.ReturnName(CurrentUser.Id, Id);
                ObjectTypeProperty.ObjectTypePropertyIndexGetGrid = await _projectTypePropertyProvider.IndexGet(CurrentUser.Id, Id);
                return Ok(ObjectTypeProperty);
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
                var ProjectTypeProperty = await _projectTypePropertyProvider.UpdateGet(CurrentUser.Id, Id);
                ProjectTypeProperty = await UpdateAddDropDownBoxes(ProjectTypeProperty, CurrentUser.Id);
                return Ok(ProjectTypeProperty);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ObjectTypePropertyUpdateGet ProjectTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _projectTypePropertyProvider.UpdatePostCheck(ProjectTypeProperty);
                if (ErrorMessages.Count > 0)
                {
                    ProjectTypeProperty = await UpdateAddDropDownBoxes(ProjectTypeProperty, CurrentUser.Id);
                }
                else
                {
                    _projectTypePropertyProvider.UpdatePost(ProjectTypeProperty);
                }
                ObjectTypePropertyUpdateGetWithErrorMessages ProjectTypePropertyWithErrorMessage = new ObjectTypePropertyUpdateGetWithErrorMessages { ObjectTypeProperty = ProjectTypeProperty, ErrorMessages = ErrorMessages };
                return Ok(ProjectTypePropertyWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ObjectTypePropertyUpdateGetWithErrorMessages ProjectTypePropertyWithNoRights = new ObjectTypePropertyUpdateGetWithErrorMessages { ObjectTypeProperty = ProjectTypeProperty, ErrorMessages = ErrorMessages };
            return Ok(ProjectTypePropertyWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProjectTypePropertys", "ProjectTypePropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _projectTypePropertyProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ObjectTypePropertyDeleteGet ProjectTypeProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProjectTypeProperty.UserId= CurrentUser.Id;
                //var CheckString = await _ProjectTypePropertyProvider.DeletePostCheck(ProjectTypeProperty);
                //if (CheckString.Length == 0)
                //{
                _projectTypePropertyProvider.DeletePost(CurrentUser.Id, ProjectTypeProperty.ObjectTypePropertyId);
                return Ok(ProjectTypeProperty);
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