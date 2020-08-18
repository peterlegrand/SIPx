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

        [HttpGet("Index")]
        public async Task<IActionResult> Get()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "188"))
            {
                return Ok(await _userMenuTemplateProvider.IndexGet(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var UserMenuTemplateCreateGet = new UserMenuTemplateCreatePost();
                return Ok(UserMenuTemplateCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(UserMenuTemplateCreatePost UserMenuTemplate)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenuTemplate.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _userMenuTemplateProvider.CreatePostCheck(UserMenuTemplate);
                if (CheckString.Length == 0)
                {
                    _userMenuTemplateProvider.CreatePost(UserMenuTemplate);
                    return Ok(UserMenuTemplate);
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


        [HttpPost("Update")]
        public async Task<IActionResult> Update(UserMenuTemplateUpdateGet UserMenuTemplate)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            UserMenuTemplate.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _userMenuTemplateProvider.UpdatePostCheck(UserMenuTemplate);
                if (CheckString.Length == 0)
                {
                    _userMenuTemplateProvider.UpdatePost(UserMenuTemplate);
                    return Ok(UserMenuTemplate);
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
        public async Task<IActionResult> GetLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "193"))
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


        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> GetLanguage(int Id)
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "193"))  
            {
                return Ok(await _userMenuTemplateProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> EditGet(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                if (await _checkProvider.CheckIfRecordExists("UserMenuTemplates", "UserMenuTemplateID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _userMenuTemplateProvider.UpdateGet(CurrentUser.Id, Id);

                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        //[HttpPut("Update")]
        //public async Task<IActionResult> Put(UserMenuTemplateUpdatePut UserMenuTemplate)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
        //    {
        //        var CheckString = await _UserMenuTemplateProvider.UserMenuTemplateCheckPut(UserMenuTemplate);
        //        if (CheckString.Length==0)
        //        { 
        //         _UserMenuTemplateProvider.PutUserMenuTemplate(UserMenuTemplate);
        //        return Ok(UserMenuTemplate);
        //        }
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            Message = CheckString,
        //        });

        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });

        //}

        //[HttpGet("LanguageCreate/{Id:int}")]
        //public async Task<IActionResult> LanguageCreate(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
        //    {
        //        var UserMenuTemplateCreateGet = new ObjectLanguageCreateGet();
        //        UserMenuTemplateCreateGet.ObjectId = Id;
        //        var LanguageList = await _UserMenuTemplateProvider.UserMenuTemplateLanguageCreateGetLanguageList(CurrentUser.Id, Id);
        //        if (LanguageList.Count == 0)
        //        {
        //            return BadRequest(new
        //            {
        //                IsSuccess = false,
        //                Message = "No active languages",
        //            });
        //        }
        //        UserMenuTemplateCreateGet.Languages = LanguageList;
        //        return Ok(UserMenuTemplateCreateGet);
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}
        //[HttpPost("LanguageCreate")]
        //public async Task<IActionResult> LanguagePost(ObjectLanguageCreatePost UserMenuTemplate)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    UserMenuTemplate.UserId = CurrentUser.Id;
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
        //    {
        //        var CheckString = await _masterProvider.PostObjectLanguageCheck("UserMenuTemplate", UserMenuTemplate.LanguageId,UserMenuTemplate.ObjectId);
        //        if (CheckString)
        //        {
        //            UserMenuTemplate.TableName = "UserMenuTemplate";
        //            _masterProvider.PostObjectLanguage(UserMenuTemplate);
        //            return Ok(UserMenuTemplate);
        //        }
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            Message = CheckString,
        //        });

        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });

        //}

    }
}