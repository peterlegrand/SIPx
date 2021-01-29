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
    public class ProjectTypeMatrixController : ControllerBase
    {
        private readonly IProjectMatrixTypeProvider _projectMatrixTypeProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProjectTypeMatrixProvider _projectTypeMatrixProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectTypeProvider _projectTypeProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProjectTypeMatrixController( IProjectMatrixTypeProvider projectMatrixTypeProvider
            , ICheckProvider checkProvider
            , IMasterListProvider masterListProvider
            , IProjectTypeMatrixProvider ProjectTypeMatrixProvider
            , IMasterProvider masterProvider
            , IClaimCheck claimCheck
            , IProjectTypeProvider ProjectTypeProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _projectMatrixTypeProvider = projectMatrixTypeProvider;
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _projectTypeMatrixProvider = ProjectTypeMatrixProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _projectTypeProvider = ProjectTypeProvider;
            _userManager = userManager;
        }
        private async Task<ProjectTypeMatrixCreateGet> CreateAddDropDownBoxes(ProjectTypeMatrixCreateGet ProjectTypeMatrix, string UserId)
        {
            ProjectTypeMatrix.ProjectTypes = await _projectTypeProvider.List(UserId);
            ProjectTypeMatrix.ProjectMatrixTypes = await _projectMatrixTypeProvider.List(UserId);
            return ProjectTypeMatrix;
        }

        private async Task<ProjectTypeMatrixUpdateGet> UpdateAddDropDownBoxes(ProjectTypeMatrixUpdateGet ProjectTypeMatrix, string UserId)
        {
            ProjectTypeMatrix.ProjectTypes = await _projectTypeProvider.List(UserId);
            ProjectTypeMatrix.ProjectMatrixTypes = await _projectMatrixTypeProvider.List(UserId);
            return ProjectTypeMatrix;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id, [FromQuery(Name = "IsFrom")] bool IsFrom = true)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProjectTypeMatrix = new ProjectTypeMatrixCreateGet();
                ProjectTypeMatrix.IsFrom = IsFrom;
                ProjectTypeMatrix = await CreateAddDropDownBoxes(ProjectTypeMatrix, CurrentUser.Id);
                return Ok(ProjectTypeMatrix);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProjectTypeMatrixCreateGet ProjectTypeMatrix)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProjectTypeMatrix.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _projectTypeMatrixProvider.CreatePostCheck(ProjectTypeMatrix);
                if (ErrorMessages.Count > 0)
                {
                    ProjectTypeMatrix = await CreateAddDropDownBoxes(ProjectTypeMatrix, CurrentUser.Id);
                }
                else
                {
                    _projectTypeMatrixProvider.CreatePost(ProjectTypeMatrix);
                }
                ProjectTypeMatrixCreateGetWithErrorMessages ProjectTypeMatrixWithErrorMessage = new ProjectTypeMatrixCreateGetWithErrorMessages { ProjectTypeMatrix = ProjectTypeMatrix, ErrorMessages = ErrorMessages };
                return Ok(ProjectTypeMatrixWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProjectTypeMatrixCreateGetWithErrorMessages ProjectTypeMatrixWithNoRights = new ProjectTypeMatrixCreateGetWithErrorMessages { ProjectTypeMatrix = ProjectTypeMatrix, ErrorMessages = ErrorMessages };
            return Ok(ProjectTypeMatrixWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _projectTypeMatrixProvider.IndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Update(int Id, [FromQuery(Name = "IsFrom")] bool IsFrom = true)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProjectTypeMatrix = await _projectTypeMatrixProvider.UpdateGet(CurrentUser.Id, Id);
                ProjectTypeMatrix.IsFrom = IsFrom;
                ProjectTypeMatrix = await UpdateAddDropDownBoxes(ProjectTypeMatrix, CurrentUser.Id);
                return Ok(ProjectTypeMatrix);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProjectTypeMatrixUpdateGet ProjectTypeMatrix)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _projectTypeMatrixProvider.UpdatePostCheck(ProjectTypeMatrix);
                if (ErrorMessages.Count > 0)
                {
                    ProjectTypeMatrix = await UpdateAddDropDownBoxes(ProjectTypeMatrix, CurrentUser.Id);
                }
                else
                {
                    _projectTypeMatrixProvider.UpdatePost(ProjectTypeMatrix);
                }
                ProjectTypeMatrixUpdateGetWithErrorMessages ProjectTypeMatrixWithErrorMessage = new ProjectTypeMatrixUpdateGetWithErrorMessages { ProjectTypeMatrix = ProjectTypeMatrix, ErrorMessages = ErrorMessages };
                return Ok(ProjectTypeMatrixWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProjectTypeMatrixUpdateGetWithErrorMessages ProjectTypeMatrixWithNoRights = new ProjectTypeMatrixUpdateGetWithErrorMessages { ProjectTypeMatrix = ProjectTypeMatrix, ErrorMessages = ErrorMessages };
            return Ok(ProjectTypeMatrixWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id, [FromQuery(Name = "IsFrom")] bool IsFrom = true)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProjectTypeMatrixs", "ProjectTypeMatrixID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var ProjectTypeMatrix = await _projectTypeMatrixProvider.DeleteGet(CurrentUser.Id, Id);
                ProjectTypeMatrix.IsFrom = IsFrom;
                return Ok(ProjectTypeMatrix);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProjectTypeMatrixDeleteGet ProjectTypeMatrix)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProjectTypeMatrix.UserId= CurrentUser.Id;
                //var CheckString = await _ProjectTypeMatrixProvider.DeletePostCheck(ProjectTypeMatrix);
                //if (CheckString.Length == 0)
                //{
                _projectTypeMatrixProvider.DeletePost(CurrentUser.Id, ProjectTypeMatrix.ProjectTypeMatrixId);
                return Ok(ProjectTypeMatrix);
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

        //[HttpGet("LanguageIndex/{Id:int}")]
        //public async Task<IActionResult> LanguageIndex(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        return Ok(await _ProjectProvider.LanguageIndexGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("LanguageUpdate/{Id:int}")]
        //public async Task<IActionResult> LanguageUpdate(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        return Ok(await _ProjectProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

    }
}