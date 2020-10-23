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
    public class PageSectionConditionController : ControllerBase
    {
        private readonly IMasterProvider _masterProvider;
        private readonly IPageSectionConditionProvider _pageSectionConditionProvider;
        private readonly IPageSectionConditionTypeProvider _pageSectionConditionTypeProvider;
        private readonly IUserProvider _userProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IContentStatusProvider _contentStatusProvider;
        private readonly ILanguageProvider _languageProvider;
        private readonly IClassificationProvider _classificationProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public PageSectionConditionController(IPageSectionConditionProvider pageSectionConditionProvider,
            IPageSectionConditionTypeProvider pageSectionConditionTypeProvider,
            IUserProvider userProvider, IOrganizationProvider organizationProvider,
            IProjectProvider projectProvider, IContentStatusProvider contentStatusProvider, IContentTypeProvider contentTypeProvider,
            ILanguageProvider languageProvider, IClassificationProvider classificationProvider, ISecurityLevelProvider securityLevelProvider,
            IMasterListProvider masterListProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterProvider = masterProvider;
            _pageSectionConditionProvider = pageSectionConditionProvider;
            _pageSectionConditionTypeProvider = pageSectionConditionTypeProvider;
            _userProvider = userProvider;
            _organizationProvider = organizationProvider;
            _projectProvider = projectProvider;
            _contentStatusProvider = contentStatusProvider;
            _languageProvider = languageProvider;
            _classificationProvider = classificationProvider;
            _securityLevelProvider = securityLevelProvider;
            _contentTypeProvider = contentTypeProvider;
            _masterListProvider = masterListProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var PageSectionConditionCreateGet = new PageSectionConditionCreateGet();
                PageSectionConditionCreateGet.PageSectionConditionTypes = await _pageSectionConditionTypeProvider.ListExtended(CurrentUser.Id);
                PageSectionConditionCreateGet.Users = await _userProvider.List();
                PageSectionConditionCreateGet.Projects = await _projectProvider.List(CurrentUser.Id);
                PageSectionConditionCreateGet.ContentTypes = await _contentTypeProvider.List(CurrentUser.Id);
                PageSectionConditionCreateGet.ContentStatuses = await _contentStatusProvider.List(CurrentUser.Id);
                PageSectionConditionCreateGet.Languages = await _languageProvider.List(CurrentUser.Id);
                PageSectionConditionCreateGet.SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                PageSectionConditionCreateGet.Classifications = await _pageSectionConditionProvider.CreateGetClassifications(CurrentUser.Id);
                for (int i = 0; i < PageSectionConditionCreateGet.Classifications.Count(); i++)
                {
                    PageSectionConditionCreateGet.Classifications[i].ClassificationValues = await _pageSectionConditionProvider.CreateGetClassificationValues(CurrentUser.Id, PageSectionConditionCreateGet.Classifications[i].ClassificationId);
                }
                PageSectionConditionCreateGet.PageSectionId = Id;
                //PageSectionConditionCreateGet.Classifications = await _classificationProvider.List(CurrentUser.Id);
                //  var PageSectionCreateGetSequences = await _pageSectionProvider.CreateGetSequence(CurrentUser.Id, Id);
                var SortBys = await _masterListProvider.SortByList(CurrentUser.Id);

                //                PageSectionCreateGet.Sequences = PageSectionCreateGetSequences;
                return Ok(PageSectionConditionCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PageSectionConditionCreateGet PageSectionCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PageSectionCondition.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {

                //                var CheckString = await _pageSectionProvider.CreatePostCheck(PageSection);
                //              if (CheckString.Length == 0)
                {
                    PageSectionCondition.PageSectionConditionTypeId = int.Parse(PageSectionCondition.PageSectionConditionTypeIdExtended.Substring(1));
                    _pageSectionConditionProvider.CreatePost(PageSectionCondition);
                    return Ok(PageSectionCondition);
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
                return Ok(await _pageSectionConditionProvider.IndexGet(CurrentUser.Id, Id));
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
                //if (await _checkProvider.CheckIfRecordExists("PageSectionConditions", "PageSectionID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var PageSectionCondition = await _pageSectionConditionProvider.UpdateGet(CurrentUser.Id, Id);
                PageSectionCondition.PageSectionConditionTypes = await _pageSectionConditionTypeProvider.ListExtended(CurrentUser.Id);

                PageSectionCondition.Users = await _userProvider.List();
                PageSectionCondition.Projects = await _projectProvider.List(CurrentUser.Id);
                PageSectionCondition.ContentTypes = await _contentTypeProvider.List(CurrentUser.Id);
                PageSectionCondition.ContentStatuses = await _contentStatusProvider.List(CurrentUser.Id);
                PageSectionCondition.Languages = await _languageProvider.List(CurrentUser.Id);
                PageSectionCondition.SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                PageSectionCondition.Classifications = await _pageSectionConditionProvider.CreateGetClassifications(CurrentUser.Id);
                PageSectionCondition.UserId = CurrentUser.Id;

                for (int i = 0; i < PageSectionCondition.Classifications.Count(); i++)
                {
                    PageSectionCondition.Classifications[i].ClassificationValues = await _pageSectionConditionProvider.CreateGetClassificationValues(CurrentUser.Id, PageSectionCondition.Classifications[i].ClassificationId);
                }
                PageSectionCondition.PageSectionConditionId = Id;
                if (PageSectionCondition.PageSectionConditionTypeId == 11)
                { PageSectionCondition.PageSectionConditionTypeIdExtended = "V" + PageSectionCondition.PageSectionConditionInt; }
                else
                { PageSectionCondition.PageSectionConditionTypeIdExtended = "T" + PageSectionCondition.PageSectionConditionTypeId; }
                if (new[] { "T1", "T2", "T9", "T10" }.Contains(PageSectionCondition.PageSectionConditionTypeIdExtended))
                {
                    PageSectionCondition.PageSectionConditionTypes.Find(x => x.ExtendedId == PageSectionCondition.PageSectionConditionTypeIdExtended).StringValue = PageSectionCondition.PageSectionConditionString;
                }
                else
                {
                    if (new[] { "T12", "T13", "T13", "T15" }.Contains(PageSectionCondition.PageSectionConditionTypeIdExtended))
                    {
                        PageSectionCondition.PageSectionConditionTypes.Find(x => x.ExtendedId == PageSectionCondition.PageSectionConditionTypeIdExtended).DateValue = PageSectionCondition.PageSectionConditionDate;
                    }
                    else
                    {
                        PageSectionCondition.PageSectionConditionTypes.Find(x => x.ExtendedId == PageSectionCondition.PageSectionConditionTypeIdExtended).IntValue = PageSectionCondition.PageSectionConditionInt;
                    }
                }
                return Ok(PageSectionCondition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PageSectionConditionUpdateGet PageSectionCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                PageSectionCondition.UserId = CurrentUser.Id;
                //var CheckString = await _PageSectionProvider.UpdatePostCheck(PageSection);
                //if (CheckString.Length == 0)
                //{
                PageSectionCondition.PageSectionConditionTypeId = int.Parse(PageSectionCondition.PageSectionConditionTypeIdExtended.Substring(1));
                _pageSectionConditionProvider.UpdatePost(PageSectionCondition);
                return Ok(PageSectionCondition);
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
                //if (await _checkProvider.CheckIfRecordExists("PageSections", "PageSectionID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                var x = await _pageSectionConditionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PageSectionConditionDeleteGet PageSectionCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                PageSectionCondition.CreatorId = CurrentUser.Id;
                //var CheckString = await _PageSectionProvider.DeletePostCheck(PageSection);
                //if (CheckString.Length == 0)
                //{
                _pageSectionConditionProvider.DeletePost(PageSectionCondition.PageSectionConditionId);
                return Ok(PageSectionCondition);
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

        //[HttpGet("LanguageIndex/{Id:int}")]
        //public async Task<IActionResult> LanguageIndex(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _pageSectionProvider.LanguageIndexGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        //[HttpGet("LanguageUpdate/{Id:int}")]
        //public async Task<IActionResult> LanguageUpdate(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
        //    {
        //        return Ok(await _pageSectionProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

    }
}