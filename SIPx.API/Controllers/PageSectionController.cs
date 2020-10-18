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
        
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var PageSectionCreateGet = new PageSectionCreateGet();
              //  var PageSectionCreateGetSequences = await _pageSectionProvider.CreateGetSequence(CurrentUser.Id, Id);
                var PageSectionTypes = await _pageSectionTypeProvider.List(CurrentUser.Id);
                var PageSectionDataTypes = await _pageSectionDataTypeProvider.List(CurrentUser.Id);
                var ContentTypes = await _contentTypeProvider.List(CurrentUser.Id);
                var SortBys = await _masterListProvider.SortByList(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                PageSectionCreateGet.LanguageId = UserLanguage.LanguageId;
                PageSectionCreateGet.LanguageName = UserLanguage.Name;
                PageSectionCreateGet.PageSectionDataTypes = PageSectionDataTypes;
                PageSectionCreateGet.PageSectionTypes = PageSectionTypes;
                PageSectionCreateGet.ContentTypes = ContentTypes;
                PageSectionCreateGet.SortBys= SortBys;

                //                PageSectionCreateGet.Sequences = PageSectionCreateGetSequences;
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
        public async Task<IActionResult> Create(PageSectionCreatePost PageSection)
        {
                var CurrentUser = await _userManager.GetUserAsync(User);
            PageSection.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                PageSection.UserId = CurrentUser.Id;
//                var CheckString = await _pageSectionProvider.CreatePostCheck(PageSection);
  //              if (CheckString.Length == 0)
                {
                    _pageSectionProvider.CreatePost(PageSection);
                    return Ok(PageSection);
                }
                return BadRequest(new
                {
                    IsSuccess = false,
    //                Message = CheckString,
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "188"))
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
                var x = await _pageSectionProvider.UpdateGet(CurrentUser.Id, Id);

                return Ok(x);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                PageSection.ModifierId = CurrentUser.Id;
                //var CheckString = await _PageSectionProvider.UpdatePostCheck(PageSection);
                //if (CheckString.Length == 0)
                //{
                _pageSectionProvider.UpdatePost(PageSection);
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

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                PageSection.CreatorId = CurrentUser.Id;
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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