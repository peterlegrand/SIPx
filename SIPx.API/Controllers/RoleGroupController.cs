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
    public class RoleGroupController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IRoleGroupProvider _roleGroupProvider;
        private readonly UserManager<SipUser> _userManager;

        public RoleGroupController(ICheckProvider checkProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IRoleGroupProvider roleGroupProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _roleGroupProvider = roleGroupProvider;
            _userManager = userManager;
        }
        private async Task<RoleGroupCreateGet> CreateAddDropDownBoxes(RoleGroupCreateGet RoleGroup, string UserId)
        {
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            var Sequences = await _roleGroupProvider.CreateGetSequence(UserId);
            RoleGroup.LanguageName = UserLanguage.Name;
            RoleGroup.Sequences = Sequences;
            RoleGroup.Sequences.Add(new SequenceList { Sequence = Sequences.Count + 1, Name = "Add at the end" });
            return RoleGroup;
        }

        private async Task<RoleGroupUpdateGet> UpdateAddDropDownBoxes(RoleGroupUpdateGet RoleGroup, string UserId)
        {
            RoleGroup.Sequences = await _roleGroupProvider.CreateGetSequence(UserId);
            return RoleGroup;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var RoleGroup = new RoleGroupCreateGet();
                RoleGroup = await CreateAddDropDownBoxes(RoleGroup, CurrentUser.Id);
                return Ok(RoleGroup);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Create(RoleGroupCreateGet RoleGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            RoleGroup.UserId= CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _roleGroupProvider.CreatePostCheck(RoleGroup);
                if (ErrorMessages.Count > 0)
                {
                    RoleGroup = await CreateAddDropDownBoxes(RoleGroup, CurrentUser.Id);
                }
                else
                {
                    _roleGroupProvider.CreatePost(RoleGroup);
                }
                RoleGroupCreateGetWithErrorMessages RoleGroupWithErrorMessage = new RoleGroupCreateGetWithErrorMessages { RoleGroup = RoleGroup, ErrorMessages = ErrorMessages };
                return Ok(RoleGroupWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            RoleGroupCreateGetWithErrorMessages RoleGroupWithNoRights = new RoleGroupCreateGetWithErrorMessages { RoleGroup = RoleGroup, ErrorMessages = ErrorMessages };
            return Ok(RoleGroupWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _roleGroupProvider.IndexGet(CurrentUser.Id));
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
                var RoleGroup = await _roleGroupProvider.UpdateGet(CurrentUser.Id, Id);
                RoleGroup = await UpdateAddDropDownBoxes(RoleGroup, CurrentUser.Id);
                return Ok(RoleGroup);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(RoleGroupUpdateGet RoleGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _roleGroupProvider.UpdatePostCheck(RoleGroup);
                if (ErrorMessages.Count > 0)
                {
                    RoleGroup = await UpdateAddDropDownBoxes(RoleGroup, CurrentUser.Id);
                }
                else
                {
                    _roleGroupProvider.UpdatePost(RoleGroup);
                }
                RoleGroupUpdateGetWithErrorMessages RoleGroupWithErrorMessage = new RoleGroupUpdateGetWithErrorMessages { RoleGroup = RoleGroup, ErrorMessages = ErrorMessages };
                return Ok(RoleGroupWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            RoleGroupUpdateGetWithErrorMessages RoleGroupWithNoRights = new RoleGroupUpdateGetWithErrorMessages { RoleGroup = RoleGroup, ErrorMessages = ErrorMessages };
            return Ok(RoleGroupWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("RoleGroups", "RoleGroupID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _roleGroupProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(RoleGroupDeleteGet RoleGroup)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                RoleGroup.UserId= CurrentUser.Id;
                //var CheckString = await _RoleGroupProvider.DeletePostCheck(RoleGroup);
                //if (CheckString.Length == 0)
                //{
                _roleGroupProvider.DeletePost(CurrentUser.Id, RoleGroup.RoleGroupId);
                return Ok(RoleGroup);
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

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> LanguageIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _roleGroupProvider.LanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> LanguageUpdate(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _roleGroupProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}