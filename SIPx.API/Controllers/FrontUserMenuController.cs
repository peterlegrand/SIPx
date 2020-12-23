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
    public class FrontUserMenuController : ControllerBase
    {
        private readonly IUserMenuTypeProvider _userMenuTypeProvider;
        private readonly IUserProvider _userProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IPageProvider _pageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IFrontUserMenuProvider _frontUserMenuProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontUserMenuController(IUserMenuTypeProvider userMenuTypeProvider
            ,  IUserProvider userProvider
            , IMasterListProvider masterListProvider
            ,  IPageProvider pageProvider
            , IMasterProvider masterProvider
            , ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , IFrontUserMenuProvider frontUserMenuProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _userMenuTypeProvider = userMenuTypeProvider;
            _userProvider = userProvider;
            _masterListProvider = masterListProvider;
            _pageProvider = pageProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _frontUserMenuProvider = frontUserMenuProvider;
            _userManager = userManager;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var UserMenuCreateGet = new UserMenuCreateGet();
                var iconslist = await _masterListProvider.IconList(CurrentUser.Id);
                var Pages = await _pageProvider.ListForMenu(CurrentUser.Id);
                var UserMenuCreateGetSequences = await _frontUserMenuProvider.CreateGetSequence(CurrentUser.Id);
                UserMenuCreateGet.UserMenuTypesLeft = await _userMenuTypeProvider.LeftList(CurrentUser.Id);
                UserMenuCreateGet.UserMenuTypesRight = await _userMenuTypeProvider.RightList(CurrentUser.Id);
                UserMenuCreateGetSequences.Add(new SequenceList { Sequence = UserMenuCreateGetSequences.Count, Name = "Add at the end" });
                UserMenuCreateGet.UserMenus = UserMenuCreateGetSequences;
                UserMenuCreateGet.Icons = iconslist;
                UserMenuCreateGet.Pages = Pages;
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
        public async Task<IActionResult> Create(UserMenuCreateGet UserMenu)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenu.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _userMenuProvider.UserMenuCreatePostCheck(UserMenu);
                //if (CheckString.Length == 0)
                //{
                _frontUserMenuProvider.CreatePost(UserMenu);
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

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("UserMenus", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}


                return Ok(await _frontUserMenuProvider.IndexGet(CurrentUser.Id));
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
            UserMenu.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _userMenuProvider.UserMenuCreatePostCheck(UserMenu);
                //if (CheckString.Length == 0)
                //{
                _frontUserMenuProvider.UpdatePost(UserMenu);
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
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("UserMenus", "UserMenuID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var UserMenu = await _frontUserMenuProvider.UpdateGet(Id);
                var iconslist = await _masterListProvider.IconList(CurrentUser.Id);
                var Pages = await _pageProvider.ListForMenu(CurrentUser.Id);
                var UserMenuSequences = await _frontUserMenuProvider.CreateGetSequence(CurrentUser.Id);
                UserMenu.UserMenuTypesLeft = await _userMenuTypeProvider.LeftList(CurrentUser.Id);
                UserMenu.UserMenuTypesRight = await _userMenuTypeProvider.RightList(CurrentUser.Id);
                UserMenuSequences.Add(new SequenceList { Sequence = UserMenuSequences.Count, Name = "Add at the end" });
                UserMenu.UserMenus = UserMenuSequences;
                UserMenu.Icons = iconslist;
                UserMenu.Pages = Pages;
                UserMenu.UserId = CurrentUser.Id;
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
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("UserMenus", "UserMenuID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var UserMenu = await _frontUserMenuProvider.DeleteGet(CurrentUser.Id, Id);
                UserMenu.UserId= CurrentUser.Id;
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
            UserMenu.UserId= CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _userMenuProvider.UserMenuCreatePostCheck(UserMenu);
                //if (CheckString.Length == 0)
                //{
                _frontUserMenuProvider.DeletePost(UserMenu);
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