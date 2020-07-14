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
        private readonly IPageProvider _pageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IContentMasterProvider _contentMasterProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationPageSectionController(IPageProvider pageProvider, IMasterProvider masterProvider, IContentMasterProvider contentMasterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _pageProvider = pageProvider;
            _masterProvider = masterProvider;
            _contentMasterProvider = contentMasterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "10"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPages", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                var x = await _classificationProvider.ClassificationPageSectionIndexGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> GetPageLanguages(int Id)
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

                return Ok(await _classificationProvider.ClassificationPageSectionLanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> GetPage(int Id)
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
                cps = await _classificationProvider.ClassificationPageSectionUpdateGet(CurrentUser.Id, Id);
                cps.ContentTypes = await _contentMasterProvider.ContentTypeList(CurrentUser.Id);
                cps.PageSectionTypes = await _pageProvider.PageSectionTypeList(CurrentUser.Id);
                cps.PageSectionDataTypes = await _pageProvider.PageSectionDataTypeList(CurrentUser.Id);
                cps.SortBys = await _masterProvider.SortByList(CurrentUser.Id);
                cps.Sequences = await _classificationProvider.ClassificationPageSectionSequenceListBySectionIdGet(CurrentUser.Id, Id);
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
        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> GetPageLanguage(int Id)
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

                return Ok(await _classificationProvider.ClassificationPageSectionLanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

   }
}