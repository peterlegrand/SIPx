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
    public class ProjectTypeController : ControllerBase
    {
        private readonly ICodeTypeProvider _codeTypeProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProjectTypeProvider _projectTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectProvider _projectProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProjectTypeController(ICodeTypeProvider codeTypeProvider, ICheckProvider checkProvider, IMasterListProvider masterListProvider, IProjectTypeProvider projectTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProjectProvider ProjectProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _codeTypeProvider = codeTypeProvider;
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _projectTypeProvider = projectTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _projectProvider = ProjectProvider;
            _userManager = userManager;
        }
        private async Task<ProjectTypeCreateGet> CreateAddDropDownBoxes(ProjectTypeCreateGet ProjectType, string UserId)
        {
            var icons = await _masterListProvider.IconList(UserId);
            ProjectType.CodeTypes = await _codeTypeProvider.List(UserId);
            ProjectType.Icons = icons;
            return ProjectType;
        }

        private async Task<ProjectTypeUpdateGet> UpdateAddDropDownBoxes(ProjectTypeUpdateGet ProjectType, string UserId)
        {
            var icons = await _masterListProvider.IconList(UserId);
            ProjectType.CodeTypes = await _codeTypeProvider.List(UserId);
            ProjectType.Icons = icons;

            return ProjectType;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProjectType = new ProjectTypeCreateGet();
                ProjectType = await CreateAddDropDownBoxes(ProjectType, CurrentUser.Id);
                return Ok(ProjectType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProjectTypeCreateGet ProjectType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProjectType.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _projectTypeProvider.CreatePostCheck(ProjectType);
                if (ErrorMessages.Count > 0)
                {
                    ProjectType = await CreateAddDropDownBoxes(ProjectType, CurrentUser.Id);
                }
                else
                {
                    _projectTypeProvider.CreatePost(ProjectType);
                }
                ProjectTypeCreateGetWithErrorMessages ProjectTypeWithErrorMessage = new ProjectTypeCreateGetWithErrorMessages { ProjectType = ProjectType, ErrorMessages = ErrorMessages };
                return Ok(ProjectTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProjectTypeCreateGetWithErrorMessages ProjectTypeWithNoRights = new ProjectTypeCreateGetWithErrorMessages { ProjectType = ProjectType, ErrorMessages = ErrorMessages };
            return Ok(ProjectTypeWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _projectTypeProvider.IndexGet(CurrentUser.Id));
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
                var ProjectType = await _projectTypeProvider.UpdateGet(CurrentUser.Id, Id);
                ProjectType = await UpdateAddDropDownBoxes(ProjectType, CurrentUser.Id);
                return Ok(ProjectType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProjectTypeUpdateGet ProjectType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _projectTypeProvider.UpdatePostCheck(ProjectType);
                if (ErrorMessages.Count > 0)
                {
                    ProjectType = await UpdateAddDropDownBoxes(ProjectType, CurrentUser.Id);
                }
                else
                {
                    _projectTypeProvider.UpdatePost(ProjectType);
                }
                ProjectTypeUpdateGetWithErrorMessages ProjectTypeWithErrorMessage = new ProjectTypeUpdateGetWithErrorMessages { ProjectType = ProjectType, ErrorMessages = ErrorMessages };
                return Ok(ProjectTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ProjectTypeUpdateGetWithErrorMessages ProjectTypeWithNoRights = new ProjectTypeUpdateGetWithErrorMessages { ProjectType = ProjectType, ErrorMessages = ErrorMessages };
            return Ok(ProjectTypeWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ProjectTypes", "ProjectTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _projectTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProjectTypeDeleteGet ProjectType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ProjectType.UserId= CurrentUser.Id;
                //var CheckString = await _ProjectTypeProvider.DeletePostCheck(ProjectType);
                //if (CheckString.Length == 0)
                //{
                _projectTypeProvider.DeletePost(CurrentUser.Id, ProjectType.ProjectTypeId);
                return Ok(ProjectType);
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