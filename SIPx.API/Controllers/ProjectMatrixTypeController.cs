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
    public class ProjectMatrixTypeController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectMatrixTypeProvider _projectMatrixTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProjectMatrixTypeController(ICheckProvider checkProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProjectMatrixTypeProvider ProjectMatrixTypeProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _projectMatrixTypeProvider = ProjectMatrixTypeProvider;
            _userManager = userManager;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProjectMatrixType = new ProjectMatrixTypeCreateGet();
                return Ok(ProjectMatrixType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProjectMatrixTypeCreateGet ProjectMatrixType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProjectMatrixType.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _projectMatrixTypeProvider.CreatePostCheck(ProjectMatrixType);
                if (ErrorMessages.Count > 0)
                {
                }
                else
                {
                    _projectMatrixTypeProvider.CreatePost(ProjectMatrixType);
                }
                ProjectMatrixTypeCreateGetWithErrorMessages ProjectMatrixTypeWithErrorMessage = new ProjectMatrixTypeCreateGetWithErrorMessages { ProjectMatrixType = ProjectMatrixType, ErrorMessages = ErrorMessages };
                return Ok(ProjectMatrixTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProjectMatrixTypeCreateGetWithErrorMessages ProjectMatrixTypeWithNoRights = new ProjectMatrixTypeCreateGetWithErrorMessages { ProjectMatrixType = ProjectMatrixType, ErrorMessages = ErrorMessages };
            return Ok(ProjectMatrixTypeWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _projectMatrixTypeProvider.IndexGet(CurrentUser.Id));
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
                var ProjectMatrixType = await _projectMatrixTypeProvider.UpdateGet(CurrentUser.Id, Id);
                return Ok(ProjectMatrixType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProjectMatrixTypeUpdateGet ProjectMatrixType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _projectMatrixTypeProvider.UpdatePostCheck(ProjectMatrixType);
                if (ErrorMessages.Count > 0)
                {
                }
                else
                {
                    _projectMatrixTypeProvider.UpdatePost(ProjectMatrixType);
                }
                ProjectMatrixTypeUpdateGetWithErrorMessages ProjectMatrixTypeWithErrorMessage = new ProjectMatrixTypeUpdateGetWithErrorMessages { ProjectMatrixType = ProjectMatrixType, ErrorMessages = ErrorMessages };
                return Ok(ProjectMatrixTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProjectMatrixTypeUpdateGetWithErrorMessages ProjectMatrixTypeWithNoRights = new ProjectMatrixTypeUpdateGetWithErrorMessages { ProjectMatrixType = ProjectMatrixType, ErrorMessages = ErrorMessages };
            return Ok(ProjectMatrixTypeWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProjectMatrixTypes", "ProjectMatrixTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _projectMatrixTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProjectMatrixTypeDeleteGet ProjectMatrixType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProjectMatrixType.UserId= CurrentUser.Id;
                //var CheckString = await _ProjectMatrixTypeProvider.DeletePostCheck(ProjectMatrixType);
                //if (CheckString.Length == 0)
                //{
                _projectMatrixTypeProvider.DeletePost(CurrentUser.Id, ProjectMatrixType.ProjectMatrixTypeId);
                return Ok(ProjectMatrixType);
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