using System.Collections.Generic;
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
    public class ClassificationPageSectionController  : ControllerBase
    {
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly IPageSectionDataTypeProvider _pageSectionDataTypeProvider;
        private readonly IPageSectionTypeProvider _pageSectionTypeProvider;
        private readonly IClassificationPageSectionProvider _classificationPageSectionProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IPageProvider _pageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationPageSectionController(IContentTypeProvider contentTypeProvider, IPageSectionDataTypeProvider pageSectionDataTypeProvider, IPageSectionTypeProvider pageSectionTypeProvider, IClassificationPageSectionProvider classificationPageSectionProvider, IMasterListProvider masterListProvider , IPageProvider pageProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _contentTypeProvider = contentTypeProvider;
            _pageSectionDataTypeProvider = pageSectionDataTypeProvider;
            _pageSectionTypeProvider = pageSectionTypeProvider;
            _classificationPageSectionProvider = classificationPageSectionProvider;
            _masterListProvider = masterListProvider;
            _pageProvider = pageProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ClassificationPageSectionCreateGet = new ClassificationPageSectionCreateGet();
                var ClassificationPageSectionCreateGetSequences = await _classificationPageSectionProvider.CreateGetSequence(CurrentUser.Id, Id);
                var PageSectionTypes = await _pageSectionTypeProvider.List(CurrentUser.Id);
                var PageSectionDataTypes = await _pageSectionDataTypeProvider.List(CurrentUser.Id);
                var ContentTypes = await _contentTypeProvider.List(CurrentUser.Id);
                var SortBys = await _masterListProvider.SortByList(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                ClassificationPageSectionCreateGet.LanguageId = UserLanguage.LanguageId;
                ClassificationPageSectionCreateGet.LanguageName = UserLanguage.Name;
                ClassificationPageSectionCreateGet.PageSectionDataTypes = PageSectionDataTypes;
                ClassificationPageSectionCreateGet.PageSectionTypes = PageSectionTypes;
                ClassificationPageSectionCreateGet.ContentTypes = ContentTypes;
                ClassificationPageSectionCreateGet.SortBys = SortBys;
                ClassificationPageSectionCreateGet.ClassificationId = Id;
                return Ok(ClassificationPageSectionCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationPageSectionCreatePost ClassificationPageSection)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationPageSection.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _classificationPageSectionProvider.CreatePostCheck(ClassificationPageSection);
                if (CheckString.Length == 0)
                {
                    _classificationPageSectionProvider.CreatePost(ClassificationPageSection);
                    return Ok(ClassificationPageSection);
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

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "10"))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationPages", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                var x = await _classificationPageSectionProvider.IndexGet(CurrentUser.Id, Id);
                return Ok(x);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "10"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPages", "ClassificationPageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var cps = new ClassificationPageSectionUpdateGet();
                cps = await _classificationPageSectionProvider.UpdateGet(CurrentUser.Id, Id);
                cps.ContentTypes = await _contentTypeProvider.List(CurrentUser.Id);
                cps.PageSectionTypes = await _pageSectionTypeProvider.List(CurrentUser.Id);
                cps.PageSectionDataTypes = await _pageSectionDataTypeProvider.List(CurrentUser.Id);
                cps.SortBys = await _masterListProvider.SortByList(CurrentUser.Id);
                cps.Sequences = await _classificationPageSectionProvider.SequenceListBySectionIdGet(CurrentUser.Id, Id);
                var intlist = new List<int>();
                intlist.Add(1);
                intlist.Add(2);

                cps.OneTwoColumnSource = intlist;

                return Ok(cps);
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationPageSections", "ClassificationPageSectionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationPageSectionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationPageSectionDeleteGet ClassificationPageSection)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationPageSection.CreatorId = CurrentUser.Id;
                //var CheckString = await _ClassificationPageSectionProvider.DeletePostCheck(ClassificationPageSection);
                //if (CheckString.Length == 0)
                //{
                _classificationPageSectionProvider.DeletePost(ClassificationPageSection.ClassificationPageSectionId);
                return Ok(ClassificationPageSection);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "24"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPageLanguages", "ClassificationPageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationPageSectionProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "24"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPageLanguages", "ClassificationPageLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationPageSectionProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

   }
}