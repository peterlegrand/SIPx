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
    public class PageSectionController : ControllerBase
    {
        private readonly IMasterProvider _masterProvider;
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly IPageSectionDataTypeProvider _pageSectionDataTypeProvider;
        private readonly IPageSectionTypeProvider _pageSectionTypeProvider;
        private readonly IPageSectionProvider _pageSectionProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IPageProvider _pageProvider;
        private readonly UserManager<SipUser> _userManager;

        public PageSectionController(IContentTypeProvider contentTypeProvider, IPageSectionDataTypeProvider pageSectionDataTypeProvider, IPageSectionTypeProvider pageSectionTypeProvider, IPageSectionProvider pageSectionProvider, IMasterListProvider masterListProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IPageProvider pageProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterProvider = masterProvider;
            _contentTypeProvider = contentTypeProvider;
            _pageSectionDataTypeProvider = pageSectionDataTypeProvider;
            _pageSectionTypeProvider = pageSectionTypeProvider;
            _pageSectionProvider = pageSectionProvider;
            _masterListProvider = masterListProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _pageProvider = pageProvider;
            _userManager = userManager;
        }
        private async Task<PageSectionCreateGet> CreateAddDropDownBoxes(PageSectionCreateGet PageSection, string UserId, int PageId)
        {
            var PageSectionTypes = await _pageSectionTypeProvider.List(UserId);
            var PageSectionDataTypes = await _pageSectionDataTypeProvider.List(UserId);
            var ContentTypes = await _contentTypeProvider.List(UserId);
            var SortBys = await _masterListProvider.SortByList(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            PageSection.LanguageId = UserLanguage.LanguageId;
            PageSection.LanguageName = UserLanguage.Name;
            PageSection.PageSectionDataTypes = PageSectionDataTypes;
            PageSection.PageSectionTypes = PageSectionTypes;
            PageSection.ContentTypes = ContentTypes;
            PageSection.SortBys = SortBys;
            PageSection.PageId = PageId;
            return PageSection;
        }
        private async Task<PageSectionUpdateGet> UpdateAddDropDownBoxes(PageSectionUpdateGet PageSection, string UserId)
        {
            var PageSectionTypes = await _pageSectionTypeProvider.List(UserId);
            var PageSectionDataTypes = await _pageSectionDataTypeProvider.List(UserId);
            var ContentTypes = await _contentTypeProvider.List(UserId);
            var SortBys = await _masterListProvider.SortByList(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            PageSection.PageSectionDataTypes = PageSectionDataTypes;
            PageSection.PageSectionTypes = PageSectionTypes;
            PageSection.ContentTypes = ContentTypes;
            PageSection.SortBys = SortBys;
            return PageSection;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var PageSection = new PageSectionCreateGet();
                PageSection = await CreateAddDropDownBoxes(PageSection, CurrentUser.Id, Id);
                return Ok(PageSection);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PageSectionCreateGet PageSection)
        {
                var CurrentUser = await _userManager.GetUserAsync(User);
            PageSection.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _pageSectionProvider.CreatePostCheck(PageSection);
                if (ErrorMessages.Count > 0)
                {
                    PageSection = await CreateAddDropDownBoxes(PageSection, CurrentUser.Id, PageSection.PageId);
                }
                else
                {
                    _pageSectionProvider.CreatePost(PageSection);
                }
                PageSectionCreateGetWithErrorMessages PageSectionWithErrorMessage = new PageSectionCreateGetWithErrorMessages { PageSection = PageSection, ErrorMessages = ErrorMessages };
                return Ok(PageSectionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PageSectionCreateGetWithErrorMessages PageSectionWithNoRights = new PageSectionCreateGetWithErrorMessages { PageSection = PageSection, ErrorMessages = ErrorMessages };
            return Ok(PageSectionWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _pageSectionProvider.IndexGet(CurrentUser.Id, Id));
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
                if (await _checkProvider.CheckIfRecordExists("PageSections", "PageSectionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var PageSection = await _pageSectionProvider.UpdateGet(CurrentUser.Id, Id);
                PageSection = await UpdateAddDropDownBoxes(PageSection, CurrentUser.Id);

                return Ok(PageSection);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PageSectionUpdateGet PageSection)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _pageSectionProvider.UpdatePostCheck(PageSection);
                if (ErrorMessages.Count > 0)
                {
                    PageSection = await UpdateAddDropDownBoxes(PageSection, CurrentUser.Id);
                }
                else
                {
                    _pageSectionProvider.UpdatePost(PageSection);
                }
                PageSectionUpdateGetWithErrorMessages PageSectionWithErrorMessage = new PageSectionUpdateGetWithErrorMessages { PageSection = PageSection, ErrorMessages = ErrorMessages };
                return Ok(PageSectionWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            PageSectionUpdateGetWithErrorMessages PageSectionWithNoRights = new PageSectionUpdateGetWithErrorMessages { PageSection = PageSection, ErrorMessages = ErrorMessages };
            return Ok(PageSectionWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("PageSections", "PageSectionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                var x = await _pageSectionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PageSectionDeleteGet PageSection)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PageSection.UserId = CurrentUser.Id;
                //var CheckString = await _PageSectionProvider.DeletePostCheck(PageSection);
                //if (CheckString.Length == 0)
                //{
                _pageSectionProvider.DeletePost(PageSection.PageSectionId);
                return Ok(PageSection);
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
                return Ok(await _pageSectionProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                return Ok(await _pageSectionProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}