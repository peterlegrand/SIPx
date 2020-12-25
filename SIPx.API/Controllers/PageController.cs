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
    public class PageController : ControllerBase
    {
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

        public PageController(IProjectProvider projectProvider, IOrganizationProvider organizationProvider, IUserProvider userProvider, IClassificationProvider classificationProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IPageProvider PageProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
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
        private async Task<PageCreateGet> CreateAddDropDownBoxes(PageCreateGet Page, string UserId)
        {
            var Statuses = await _masterListProvider.StatusList(UserId);
            var Projects = await _projectProvider.List(UserId);
            var Organizations = await _organizationProvider.List(UserId);
            var Classifications = await _classificationProvider.List(UserId);
            var Users = await _userProvider.List();
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            Page.LanguageId = UserLanguage.LanguageId;
            Page.LanguageName = UserLanguage.Name;
            Page.Statuses = Statuses;
            Page.Projects = Projects;
            Page.Organizations = Organizations;
            Page.Classifications = Classifications;
            Page.Users = Users;
            Page.StatusId = 1;
            return Page;
        }
        private async Task<PageUpdateGet> UpdateAddDropDownBoxes(PageUpdateGet Page, string UserId)
        {
            var Statuses = await _masterListProvider.StatusList(UserId);
            var Projects = await _projectProvider.List(UserId);
            var Organizations = await _organizationProvider.List(UserId);
            var Classifications = await _classificationProvider.List(UserId);
            var Users = await _userProvider.List();
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);

            Page.Statuses = Statuses;
            Page.Projects = Projects;
            Page.Organizations = Organizations;
            Page.Classifications = Classifications;
            Page.Users = Users;
            return Page;
        }
        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var Page = new PageCreateGet();
                Page =await CreateAddDropDownBoxes(Page, CurrentUser.Id);
                return Ok(Page);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PageCreateGet Page)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Page.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _pageProvider.CreatePostCheck(Page);
                if (ErrorMessages.Count > 0)
                {
                    Page = await CreateAddDropDownBoxes(Page, CurrentUser.Id);
                }
                else
                {
                    _pageProvider.CreatePost(Page);
                }
                PageCreateGetWithErrorMessages PageWithErrorMessage = new PageCreateGetWithErrorMessages { Page = Page, ErrorMessages = ErrorMessages };
                return Ok(PageWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PageCreateGetWithErrorMessages PageWithNoRights = new PageCreateGetWithErrorMessages { Page = Page, ErrorMessages = ErrorMessages };
            return Ok(PageWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _pageProvider.IndexGet(CurrentUser.Id));
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
               
                var Page  = await _pageProvider.UpdateGet(CurrentUser.Id, Id);
                Page = await UpdateAddDropDownBoxes(Page, CurrentUser.Id);
                return Ok(Page);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PageUpdateGet Page)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _pageProvider.UpdatePostCheck(Page);
                if (ErrorMessages.Count > 0)
                {
                    Page = await UpdateAddDropDownBoxes(Page, CurrentUser.Id);
                }
                else
                {
                    _pageProvider.UpdatePost(Page);
                }
                PageUpdateGetWithErrorMessages PageWithErrorMessage = new PageUpdateGetWithErrorMessages { Page = Page, ErrorMessages = ErrorMessages };
                return Ok(PageWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PageUpdateGetWithErrorMessages PageWithNoRights = new PageUpdateGetWithErrorMessages { Page = Page, ErrorMessages = ErrorMessages };
            return Ok(PageWithNoRights);
        }


        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("Pages", "PageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _pageProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }
        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PageDeleteGet Page)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Page.UserId= CurrentUser.Id;
                //var CheckString = await _PageProvider.DeletePostCheck(Page);
                //if (CheckString.Length == 0)
                //{
                _pageProvider.DeletePost(CurrentUser.Id, Page.PageId);
                return Ok(Page);
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
                return Ok(await _pageProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _pageProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}