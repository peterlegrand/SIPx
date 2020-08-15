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
    public class UserPageController : ControllerBase
    {
        private readonly IUserPageProvider _userPageProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IUserProvider _userProvider;
        private readonly IClassificationProvider _classificationProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPageProvider _pageProvider;
        private readonly UserManager<SipUser> _userManager;

        public UserPageController(IUserPageProvider userPageProvider, IProjectProvider projectProvider, IOrganizationProvider organizationProvider, IUserProvider userProvider, IClassificationProvider classificationProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IPageProvider PageProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _userPageProvider = userPageProvider;
            _projectProvider = projectProvider;
            _organizationProvider = organizationProvider;
            _userProvider = userProvider;
            _classificationProvider = classificationProvider;
            _masterListProvider = masterListProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _pageProvider = PageProvider;
            _userManager = userManager;
        }
        [HttpGet("Index")]
        public async Task<IActionResult> Get()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "188"))
            {
                return Ok(await _userPageProvider.UserPageIndexGet(CurrentUser.Id));
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
                if (await _checkProvider.CheckIfRecordExists("Pages", "PageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _userPageProvider.UserPageUpdateGet(CurrentUser.Id, Id);

                return Ok(x);
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
                var PageCreateGet = new PageCreateGet();
                var Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
                var Projects = await _projectProvider.ProjectList(CurrentUser.Id);
                var Organizations = await _organizationProvider.OrganizationList(CurrentUser.Id);
                var Classifications = await _classificationProvider.ClassificationList(CurrentUser.Id);
                var Users = await _userProvider.UserList();
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                PageCreateGet.LanguageId = UserLanguage.LanguageId;
                PageCreateGet.LanguageName = UserLanguage.Name;
                PageCreateGet.Statuses = Statuses;
                PageCreateGet.Projects = Projects;
                PageCreateGet.Organizations= Organizations;
                PageCreateGet.Classifications= Classifications;
                PageCreateGet.Users = Users;

                return Ok(PageCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Update")]
        public async Task<IActionResult> Post(PageUpdateGet Page)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Page.ModifierId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _userPageProvider.UserPageUpdatePostCheck(Page);
                //if (CheckString.Length == 0)
                //{
                    _userPageProvider.UserPageUpdatePost(Page);
                    return Ok(Page);
                //}
                //return BadRequest(new
                //{
                //    IsSuccess = false,
                //    Message = CheckString,
                //});
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("Create")]
        public async Task<IActionResult> Post(PageCreatePost Page)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Page.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _userPageProvider.UserPageCreatePostCheck(Page);
                if (CheckString.Length == 0)
                {
                    _pageProvider.PageCreatePost(Page);
                    return Ok(Page);
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