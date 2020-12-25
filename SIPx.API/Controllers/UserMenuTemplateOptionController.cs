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
    public class UserMenuTemplateOptionController : ControllerBase
    {
        private readonly IUserMenuTypeProvider _userMenuTypeProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IUserMenuTemplateOptionProvider _userMenuTemplateOptionProvider;
        private readonly IPageProvider _pageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IFrontUserMenuProvider _frontUserMenuProvider;
        private readonly UserManager<SipUser> _userManager;

        public UserMenuTemplateOptionController(IUserMenuTypeProvider userMenuTypeProvider
            , IMasterListProvider masterListProvider
            , IUserMenuTemplateOptionProvider userMenuTemplateOptionProvider
            , IPageProvider pageProvider
            , IMasterProvider masterProvider
            , ICheckProvider checkProvider
            , IClaimCheck claimCheck, IFrontUserMenuProvider frontUserMenuProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _userMenuTypeProvider = userMenuTypeProvider;
            _masterListProvider = masterListProvider;
            _userMenuTemplateOptionProvider = userMenuTemplateOptionProvider;
            _pageProvider = pageProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _frontUserMenuProvider = frontUserMenuProvider;
            _userManager = userManager;
        }
        private async Task<UserMenuTemplateOptionCreateGet> CreateAddDropDownBoxes(UserMenuTemplateOptionCreateGet UserMenuTemplateOption, string UserId, int UserMenuTemplateId)
        {
            var iconslist = await _masterListProvider.IconList(UserId);
            var Pages = await _pageProvider.ListForMenuTemplate(UserId);
            var UserMenuTemplateOptionCreateGetSequences = await _userMenuTemplateOptionProvider.CreateGetSequence(UserId, UserMenuTemplateId);
            UserMenuTemplateOption.UserMenuTypesLeft = await _userMenuTypeProvider.LeftList(UserId);
            UserMenuTemplateOption.UserMenuTypesRight = await _userMenuTypeProvider.RightList(UserId);
            UserMenuTemplateOptionCreateGetSequences.Add(new SequenceList { Sequence = UserMenuTemplateOptionCreateGetSequences.Count, Name = "Add at the end" });
            UserMenuTemplateOption.UserMenuTemplateOptions = UserMenuTemplateOptionCreateGetSequences;
            UserMenuTemplateOption.Icons = iconslist;
            UserMenuTemplateOption.Pages = Pages;
            UserMenuTemplateOption.UserMenuTemplateId = UserMenuTemplateId;
            return UserMenuTemplateOption;
        }

        private async Task<UserMenuTemplateOptionUpdateGet> UpdateAddDropDownBoxes(UserMenuTemplateOptionUpdateGet UserMenuTemplateOption, string UserId, int UserMenuTemplateOptionId)
        {
            var iconslist = await _masterListProvider.IconList(UserId);
            var Pages = await _pageProvider.ListForMenuTemplate(UserId);
            var UserMenuTemplateOptionCreateGetSequences = await _userMenuTemplateOptionProvider.CreateGetSequence(UserId, UserMenuTemplateOptionId);
            UserMenuTemplateOption.UserMenuTypesLeft = await _userMenuTypeProvider.LeftList(UserId);
            UserMenuTemplateOption.UserMenuTypesRight = await _userMenuTypeProvider.RightList(UserId);
            UserMenuTemplateOptionCreateGetSequences.Add(new SequenceList { Sequence = UserMenuTemplateOptionCreateGetSequences.Count, Name = "Add at the end" });
            UserMenuTemplateOption.UserMenuTemplateOptions = UserMenuTemplateOptionCreateGetSequences;
            UserMenuTemplateOption.Icons = iconslist;
            UserMenuTemplateOption.Pages = Pages;
            return UserMenuTemplateOption;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var UserMenuTemplateOption = new UserMenuTemplateOptionCreateGet();
                UserMenuTemplateOption = await CreateAddDropDownBoxes(UserMenuTemplateOption, CurrentUser.Id, Id);
                return Ok(UserMenuTemplateOption);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(UserMenuTemplateOptionCreateGet UserMenuTemplateOption)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenuTemplateOption.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _userMenuTemplateOptionProvider.CreatePostCheck(UserMenuTemplateOption);
                if (ErrorMessages.Count > 0)
                {
                    UserMenuTemplateOption = await CreateAddDropDownBoxes(UserMenuTemplateOption, CurrentUser.Id, UserMenuTemplateOption.UserMenuTemplateId);
                }
                else
                {
                    _userMenuTemplateOptionProvider.CreatePost(UserMenuTemplateOption);
                }
                UserMenuTemplateOptionCreateGetWithErrorMessages UserMenuTemplateOptionWithErrorMessage = new UserMenuTemplateOptionCreateGetWithErrorMessages { UserMenuTemplateOption = UserMenuTemplateOption, ErrorMessages = ErrorMessages };
                return Ok(UserMenuTemplateOptionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            UserMenuTemplateOptionCreateGetWithErrorMessages UserMenuTemplateOptionWithNoRights = new UserMenuTemplateOptionCreateGetWithErrorMessages { UserMenuTemplateOption = UserMenuTemplateOption, ErrorMessages = ErrorMessages };
            return Ok(UserMenuTemplateOptionWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
               

                return Ok(await _userMenuTemplateOptionProvider.IndexGet(CurrentUser.Id, Id));
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
            

                var UserMenuTemplateOption = await _userMenuTemplateOptionProvider.UpdateGet(CurrentUser.Id, Id);
                UserMenuTemplateOption = await UpdateAddDropDownBoxes(UserMenuTemplateOption, CurrentUser.Id, Id);
                return Ok(UserMenuTemplateOption);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(UserMenuTemplateOptionUpdateGet UserMenuTemplateOption)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenuTemplateOption.UserId= CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _userMenuTemplateOptionProvider.UpdatePostCheck(UserMenuTemplateOption);
                if (ErrorMessages.Count > 0)
                {
                    UserMenuTemplateOption = await UpdateAddDropDownBoxes(UserMenuTemplateOption, CurrentUser.Id, UserMenuTemplateOption.UserMenuTemplateOptionId);
                }
                else
                {
                    _userMenuTemplateOptionProvider.UpdatePost(UserMenuTemplateOption);
                }
                UserMenuTemplateOptionUpdateGetWithErrorMessages UserMenuTemplateOptionWithErrorMessage = new UserMenuTemplateOptionUpdateGetWithErrorMessages { UserMenuTemplateOption = UserMenuTemplateOption, ErrorMessages = ErrorMessages };
                return Ok(UserMenuTemplateOptionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            UserMenuTemplateOptionUpdateGetWithErrorMessages UserMenuTemplateOptionWithNoRights = new UserMenuTemplateOptionUpdateGetWithErrorMessages { UserMenuTemplateOption = UserMenuTemplateOption, ErrorMessages = ErrorMessages };
            return Ok(UserMenuTemplateOptionWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("UserMenuTemplateOptions", "UserMenuTemplateOptionID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var x = await _userMenuTemplateOptionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(UserMenuTemplateOptionDeleteGet UserMenuTemplateOption)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                UserMenuTemplateOption.UserId= CurrentUser.Id;
                //var CheckString = await _UserMenuTemplateOptionProvider.DeletePostCheck(UserMenuTemplateOption);
                //if (CheckString.Length == 0)
                //{
                _userMenuTemplateOptionProvider.DeletePost(CurrentUser.Id, UserMenuTemplateOption.UserMenuTemplateOptionId);
                return Ok(UserMenuTemplateOption);
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
                //if (await _checkProvider.CheckIfRecordExists("UserMenuTemplateOptionLanguages", "UserMenuTemplateOptionID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}


                return Ok(await _userMenuTemplateOptionProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                if (await _checkProvider.CheckIfRecordExists("UserMenuTemplateOptionLanguages", "UserMenuTemplateOptionLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _userMenuTemplateOptionProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}