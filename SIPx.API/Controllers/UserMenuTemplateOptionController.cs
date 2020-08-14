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
        private readonly IMasterListProvider _masterListProvider;
        private readonly IUserMenuTemplateOptionProvider _userMenuTemplateOptionProvider;
        private readonly IPeopleProvider _peopleProvider;
        private readonly IPageProvider _pageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IUserMenuProvider _userMenuProvider;
        private readonly UserManager<SipUser> _userManager;

        public UserMenuTemplateOptionController(IMasterListProvider masterListProvider, IUserMenuTemplateOptionProvider userMenuTemplateOptionProvider, IPeopleProvider peopleProvider, IPageProvider pageProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IUserMenuProvider userMenuProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterListProvider = masterListProvider;
            _userMenuTemplateOptionProvider = userMenuTemplateOptionProvider;
            _peopleProvider = peopleProvider;
            _pageProvider = pageProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userMenuProvider = userMenuProvider;
            _userManager = userManager;
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> GetOptions(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
            {
                //if (await _checkProvider.CheckIfRecordExists("UserMenuTemplateOptions", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}


                return Ok(await _userMenuTemplateOptionProvider.UserMenuTemplateOptionIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var UserMenuTemplateOptionCreateGet = new UserMenuTemplateOptionCreateGet();
                var iconslist = await _masterListProvider.IconList(CurrentUser.Id);
                var Pages = await _pageProvider.PageListForMenuTemplate(CurrentUser.Id);
                var UserMenuTemplateOptionCreateGetSequences = await _userMenuTemplateOptionProvider.UserMenuTemplateOptionCreateGetSequence(CurrentUser.Id, Id);
                UserMenuTemplateOptionCreateGet.UserMenuTypesLeft = await _peopleProvider.UserMenuTypeLeftList(CurrentUser.Id);
                UserMenuTemplateOptionCreateGet.UserMenuTypesRight = await _peopleProvider.UserMenuTypeRightList(CurrentUser.Id);
                UserMenuTemplateOptionCreateGetSequences.Add(new SequenceList { Sequence = UserMenuTemplateOptionCreateGetSequences.Count ,Name = "Add at the end" });
                UserMenuTemplateOptionCreateGet.UserMenuTemplateOptions = UserMenuTemplateOptionCreateGetSequences;
                UserMenuTemplateOptionCreateGet.Icons = iconslist;
                UserMenuTemplateOptionCreateGet.Pages= Pages;
                UserMenuTemplateOptionCreateGet.UserMenuTemplateId = Id;
                return Ok(UserMenuTemplateOptionCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(UserMenuTemplateOptionCreateGet UserMenuTemplateOption)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenuTemplateOption.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _userMenuTemplateOptionProvider.UserMenuTemplateOptionCreatePostCheck(UserMenuTemplateOption);
                if (CheckString.Length == 0)
                {
                    _userMenuTemplateOptionProvider.UserMenuTemplateOptionCreatePost(UserMenuTemplateOption);
                    return Ok(UserMenuTemplateOption);
                }
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = CheckString,
                });
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> GetLevelLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "16"))
            {
                if (await _checkProvider.CheckIfRecordExists("UserMenuTemplateOptionLanguages", "UserMenuTemplateOptionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }


                return Ok(await _userMenuTemplateOptionProvider.UserMenuTemplateOptionLanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetLevel(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
            {
                if (await _checkProvider.CheckIfRecordExists("UserMenuTemplateOptions", "UserMenuTemplateOptionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                return Ok(await _userMenuTemplateOptionProvider.UserMenuTemplateOptionUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> GetLevelLanguage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "16"))
            {
                if (await _checkProvider.CheckIfRecordExists("UserMenuTemplateOptionLanguages", "UserMenuTemplateOptionLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _userMenuTemplateOptionProvider.UserMenuTemplateOptionLanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}