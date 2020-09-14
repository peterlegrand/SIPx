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
        private readonly IUserMenuProvider _userMenuProvider;
        private readonly UserManager<SipUser> _userManager;

        public UserMenuTemplateOptionController(IUserMenuTypeProvider userMenuTypeProvider, IMasterListProvider masterListProvider, IUserMenuTemplateOptionProvider userMenuTemplateOptionProvider, IPageProvider pageProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IUserMenuProvider userMenuProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _userMenuTypeProvider = userMenuTypeProvider;
            _masterListProvider = masterListProvider;
            _userMenuTemplateOptionProvider = userMenuTemplateOptionProvider;
            _pageProvider = pageProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userMenuProvider = userMenuProvider;
            _userManager = userManager;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var UserMenuTemplateOptionCreateGet = new UserMenuTemplateOptionCreateGet();
                var iconslist = await _masterListProvider.IconList(CurrentUser.Id);
                var Pages = await _pageProvider.ListForMenuTemplate(CurrentUser.Id);
                var UserMenuTemplateOptionCreateGetSequences = await _userMenuTemplateOptionProvider.CreateGetSequence(CurrentUser.Id, Id);
                UserMenuTemplateOptionCreateGet.UserMenuTypesLeft = await _userMenuTypeProvider.LeftList(CurrentUser.Id);
                UserMenuTemplateOptionCreateGet.UserMenuTypesRight = await _userMenuTypeProvider.RightList(CurrentUser.Id);
                UserMenuTemplateOptionCreateGetSequences.Add(new SequenceList { Sequence = UserMenuTemplateOptionCreateGetSequences.Count, Name = "Add at the end" });
                UserMenuTemplateOptionCreateGet.UserMenuTemplateOptions = UserMenuTemplateOptionCreateGetSequences;
                UserMenuTemplateOptionCreateGet.Icons = iconslist;
                UserMenuTemplateOptionCreateGet.Pages = Pages;
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
        public async Task<IActionResult> Create(UserMenuTemplateOptionCreateGet UserMenuTemplateOption)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenuTemplateOption.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _userMenuTemplateOptionProvider.CreatePostCheck(UserMenuTemplateOption);
                //if (CheckString.Length == 0)
                //{
                    _userMenuTemplateOptionProvider.CreatePost(UserMenuTemplateOption);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
            {
                //if (await _checkProvider.CheckIfRecordExists("UserMenuTemplateOptions", "UserMenuTemplateOptionID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var UserMenuTemplateOption = await _userMenuTemplateOptionProvider.UpdateGet(CurrentUser.Id, Id);
                var iconslist = await _masterListProvider.IconList(CurrentUser.Id);
                var Pages = await _pageProvider.ListForMenuTemplate(CurrentUser.Id);
                var UserMenuTemplateOptionCreateGetSequences = await _userMenuTemplateOptionProvider.CreateGetSequence(CurrentUser.Id, Id);
                UserMenuTemplateOption.UserMenuTypesLeft = await _userMenuTypeProvider.LeftList(CurrentUser.Id);
                UserMenuTemplateOption.UserMenuTypesRight = await _userMenuTypeProvider.RightList(CurrentUser.Id);
                UserMenuTemplateOptionCreateGetSequences.Add(new SequenceList { Sequence = UserMenuTemplateOptionCreateGetSequences.Count, Name = "Add at the end" });
                UserMenuTemplateOption.UserMenuTemplateOptions = UserMenuTemplateOptionCreateGetSequences;
                UserMenuTemplateOption.Icons = iconslist;
                UserMenuTemplateOption.Pages = Pages;
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
            UserMenuTemplateOption.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _userMenuTemplateOptionProvider.UpdatePostCheck(UserMenuTemplateOption);
                //if (CheckString.Length == 0)
                {
                    _userMenuTemplateOptionProvider.UpdatePost(UserMenuTemplateOption);
                    return Ok(UserMenuTemplateOption);
                }
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

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                UserMenuTemplateOption.CreatorId = CurrentUser.Id;
                //var CheckString = await _UserMenuTemplateOptionProvider.DeletePostCheck(UserMenuTemplateOption);
                //if (CheckString.Length == 0)
                //{
                _userMenuTemplateOptionProvider.DeletePost(UserMenuTemplateOption.UserMenuTemplateOptionId);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "16"))
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