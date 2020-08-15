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
        private readonly IUserProvider _userProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IPageProvider _pageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IUserMenuProvider _userMenuProvider;
        private readonly UserManager<SipUser> _userManager;

        public UserMenuController(IUserProvider userProvider, IMasterListProvider masterListProvider,  IPageProvider pageProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IUserMenuProvider userMenuProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _userProvider = userProvider;
            _masterListProvider = masterListProvider;
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
                var iconslist = await _masterListProvider.IconList(CurrentUser.Id);
                var Pages = await _pageProvider.PageListForMenu(CurrentUser.Id);
                var UserMenuCreateGetSequences = await _userMenuProvider.UserMenuCreateGetSequence(CurrentUser.Id);
                UserMenuCreateGet.UserMenuTypesLeft = await _userProvider.UserMenuTypeLeftList(CurrentUser.Id);
                UserMenuCreateGet.UserMenuTypesRight = await _userProvider.UserMenuTypeRightList(CurrentUser.Id);
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

        [HttpPost("Update")]
        public async Task<IActionResult> Update(UserMenuUpdateGet UserMenu)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenu.ModifierId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _userMenuProvider.UserMenuCreatePostCheck(UserMenu);
                //if (CheckString.Length == 0)
                //{
                _userMenuProvider.UserMenuUpdatePost(UserMenu);
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
                var UserMenu = await _userMenuProvider.UserMenuUpdateGet(Id);
                var iconslist = await _masterListProvider.IconList(CurrentUser.Id);
                var Pages = await _pageProvider.PageListForMenu(CurrentUser.Id);
                var UserMenuSequences = await _userMenuProvider.UserMenuCreateGetSequence(CurrentUser.Id);
                UserMenu.UserMenuTypesLeft = await _userProvider.UserMenuTypeLeftList(CurrentUser.Id);
                UserMenu.UserMenuTypesRight = await _userProvider.UserMenuTypeRightList(CurrentUser.Id);
                UserMenuSequences.Add(new SequenceList { Sequence = UserMenuSequences.Count, Name = "Add at the end" });
                UserMenu.UserMenus = UserMenuSequences;
                UserMenu.Icons = iconslist;
                UserMenu.Pages = Pages;
                UserMenu.CreatorId = CurrentUser.Id;
                return Ok(UserMenu);

                //return Ok(await _userMenuProvider.UserMenuUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> DeleteGet(int Id)
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
                var UserMenu = await _userMenuProvider.UserMenuDeleteGet(CurrentUser.Id, Id);
                UserMenu.CreatorId = CurrentUser.Id;
                return Ok(UserMenu);

                //return Ok(await _userMenuProvider.UserMenuUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(UserMenuDeleteGet UserMenu)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenu.ModifierId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _userMenuProvider.UserMenuCreatePostCheck(UserMenu);
                //if (CheckString.Length == 0)
                //{
                _userMenuProvider.UserMenuDeletePost(UserMenu);
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


    }
}