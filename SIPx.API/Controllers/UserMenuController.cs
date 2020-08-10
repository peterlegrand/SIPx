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
    public class UserMenuController : ControllerBase
    {
        private readonly IPeopleProvider _peopleProvider;
        private readonly IPageProvider _pageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IUserMenuProvider _userMenuProvider;
        private readonly UserManager<SipUser> _userManager;

        public UserMenuController(IPeopleProvider peopleProvider, IPageProvider pageProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IUserMenuProvider userMenuProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _peopleProvider = peopleProvider;
            _pageProvider = pageProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userMenuProvider = userMenuProvider;
            _userManager = userManager;
        }

        [HttpGet("Index")]
        public async Task<IActionResult> GetOptions()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
            {
                //if (await _checkProvider.CheckIfRecordExists("UserMenus", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}


                return Ok(await _userMenuProvider.UserMenuIndexGet(CurrentUser.Id));
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
                var UserMenuCreateGet = new UserMenuCreateGet();
                var iconslist = await _masterProvider.IconList(CurrentUser.Id);
                var Pages = await _pageProvider.PageListForMenu(CurrentUser.Id);
                var UserMenuCreateGetSequences = await _userMenuProvider.UserMenuCreateGetSequence(CurrentUser.Id);
                UserMenuCreateGet.UserMenuTypesLeft = await _peopleProvider.UserMenuTypeLeftList(CurrentUser.Id);
                UserMenuCreateGet.UserMenuTypesRight = await _peopleProvider.UserMenuTypeRightList(CurrentUser.Id);
                UserMenuCreateGetSequences.Add(new SequenceList { Sequence = UserMenuCreateGetSequences.Count ,Name = "Add at the end" });
                UserMenuCreateGet.UserMenus = UserMenuCreateGetSequences;
                UserMenuCreateGet.Icons = iconslist;
                UserMenuCreateGet.Pages= Pages;
                UserMenuCreateGet.UserId = CurrentUser.Id;
                return Ok(UserMenuCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(UserMenuCreateGet UserMenu)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenu.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _userMenuProvider.UserMenuCreatePostCheck(UserMenu);
                //if (CheckString.Length == 0)
                //{
                _userMenuProvider.UserMenuCreatePost(UserMenu);
                return Ok(UserMenu);
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

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetLevel(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
            {
                if (await _checkProvider.CheckIfRecordExists("UserMenus", "UserMenuID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                //return Ok(await _userMenuProvider.UserMenuUpdateGet(CurrentUser.Id, Id));
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
                if (await _checkProvider.CheckIfRecordExists("UserMenuLanguages", "UserMenuLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                //return Ok(await _userMenuProvider.UserMenuLanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}