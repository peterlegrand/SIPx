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
    public class UserPageSectionController : ControllerBase
    {
        private readonly IMasterProvider _masterProvider;
        private readonly IUserPageProvider _userPageProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IContentMasterProvider _contentMasterProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPageProvider _pageProvider;
        private readonly UserManager<SipUser> _userManager;

        public UserPageSectionController(IUserPageProvider userPageProvider, IMasterListProvider masterListProvider, IContentMasterProvider contentMasterProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IPageProvider pageProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterProvider = masterProvider;
            _userPageProvider = userPageProvider;
            _masterListProvider = masterListProvider;
            _contentMasterProvider = contentMasterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _pageProvider = pageProvider;
            _userManager = userManager;
        }
        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Get(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "188"))
            {
                return Ok(await _pageProvider.PageSectionIndexGet(CurrentUser.Id, Id));
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
                if (await _checkProvider.CheckIfRecordExists("PageSections", "PageSectionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _pageProvider.PageSectionUpdateGet(CurrentUser.Id, Id);

                return Ok(x);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _pageProvider.PageSectionLanguageIndexGet(CurrentUser.Id, Id));
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
                var PageSectionCreateGet = new PageSectionCreateGet();
                var PageSectionCreateGetSequences = await _pageProvider.PageSectionCreateGetSequence(CurrentUser.Id, Id);
                var PageSectionTypes = await _pageProvider.PageSectionTypeList(CurrentUser.Id);
                var PageSectionDataTypes = await _pageProvider.PageSectionDataTypeList(CurrentUser.Id);
                var ContentTypes = await _contentMasterProvider.ContentTypeList(CurrentUser.Id);
                var SortBys = await _masterListProvider.SortByList(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                PageSectionCreateGet.LanguageId = UserLanguage.LanguageId;
                PageSectionCreateGet.LanguageName = UserLanguage.Name;
                PageSectionCreateGet.PageSectionDataTypes = PageSectionDataTypes;
                PageSectionCreateGet.PageSectionTypes = PageSectionTypes;
                PageSectionCreateGet.Sequences = PageSectionCreateGetSequences;
                PageSectionCreateGet.PageId = Id;
                return Ok(PageSectionCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(PageSectionCreatePost PageSection)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PageSection.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _userPageProvider.UserPageSectionCreatePostCheck(PageSection);
                if (CheckString.Length == 0)
                {
                    _pageProvider.PageSectionCreatePost(PageSection);
                    return Ok(PageSection);
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

    }
}