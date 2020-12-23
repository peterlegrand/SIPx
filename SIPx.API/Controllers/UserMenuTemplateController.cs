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
    public class UserMenuTemplateController : ControllerBase
    {
        private readonly IUserMenuTemplateProvider _userMenuTemplateProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public UserMenuTemplateController(IUserMenuTemplateProvider userMenuTemplateProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _userMenuTemplateProvider = userMenuTemplateProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }
        private async Task<UserMenuTemplateCreateGet> CreateAddDropDownBoxes(UserMenuTemplateCreateGet UserMenuTemplate, string UserId)
        {
            return UserMenuTemplate;
        }

        private async Task<UserMenuTemplateUpdateGet> UpdateAddDropDownBoxes(UserMenuTemplateUpdateGet UserMenuTemplate, string UserId)
        {
            return UserMenuTemplate;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var UserMenuTemplate = new UserMenuTemplateCreatePost();
                return Ok(UserMenuTemplate);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(UserMenuTemplateCreateGet UserMenuTemplate)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenuTemplate.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _userMenuTemplateProvider.CreatePostCheck(UserMenuTemplate);
                if (ErrorMessages.Count > 0)
                {
                    UserMenuTemplate = await CreateAddDropDownBoxes(UserMenuTemplate, CurrentUser.Id);
                }
                else
                {
                    _userMenuTemplateProvider.CreatePost(UserMenuTemplate);
                }
                UserMenuTemplateCreateGetWithErrorMessages UserMenuTemplateWithErrorMessage = new UserMenuTemplateCreateGetWithErrorMessages { UserMenuTemplate = UserMenuTemplate, ErrorMessages = ErrorMessages };
                return Ok(UserMenuTemplateWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            UserMenuTemplateCreateGetWithErrorMessages UserMenuTemplateWithNoRights = new UserMenuTemplateCreateGetWithErrorMessages { UserMenuTemplate = UserMenuTemplate, ErrorMessages = ErrorMessages };
            return Ok(UserMenuTemplateWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _userMenuTemplateProvider.IndexGet(CurrentUser.Id));
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
              
                var UserMenuTemplate = await _userMenuTemplateProvider.UpdateGet(CurrentUser.Id, Id);

                return Ok(UserMenuTemplate);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(UserMenuTemplateUpdateGet UserMenuTemplate)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenuTemplate.UserId= CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _userMenuTemplateProvider.UpdatePostCheck(UserMenuTemplate);
                if (ErrorMessages.Count > 0)
                {
                    UserMenuTemplate = await UpdateAddDropDownBoxes(UserMenuTemplate, CurrentUser.Id);
                }
                else
                {
                    _userMenuTemplateProvider.UpdatePost(UserMenuTemplate);
                }
                UserMenuTemplateUpdateGetWithErrorMessages UserMenuTemplateWithErrorMessage = new UserMenuTemplateUpdateGetWithErrorMessages { UserMenuTemplate = UserMenuTemplate, ErrorMessages = ErrorMessages };
                return Ok(UserMenuTemplateWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            UserMenuTemplateUpdateGetWithErrorMessages UserMenuTemplateWithNoRights = new UserMenuTemplateUpdateGetWithErrorMessages { UserMenuTemplate = UserMenuTemplate, ErrorMessages = ErrorMessages };
            return Ok(UserMenuTemplateWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("UserMenuTemplates", "UserMenuTemplateID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var x = await _userMenuTemplateProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(UserMenuTemplateDeleteGet UserMenuTemplate)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                UserMenuTemplate.UserId= CurrentUser.Id;
                //var CheckString = await _UserMenuTemplateProvider.DeletePostCheck(UserMenuTemplate);
                //if (CheckString.Length == 0)
                //{
                _userMenuTemplateProvider.DeletePost(UserMenuTemplate.UserMenuTemplateId);
                return Ok(UserMenuTemplate);
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

        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> LanguageUpdate(int Id)
        {
            if (await _checkProvider.CheckIfRecordExists("UserMenuTemplateLanguages", "UserMenuTemplateLanguageID", Id) == 0)
            {
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = "No record with this ID",
                });
            }

            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _userMenuTemplateProvider.LanguageUpdateGet(CurrentUser.Id, Id));
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
                if (await _checkProvider.CheckIfRecordExists("UserMenuTemplateLanguages", "UserMenuTemplateID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _userMenuTemplateProvider.LanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}