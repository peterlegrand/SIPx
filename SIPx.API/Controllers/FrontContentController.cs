using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Classes;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route(api/[controller])]
    [ApiController]
    //[Authorize]
    public class FrontContentController : Controller
    {
        private readonly IClassificationProvider _classificationProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly ILanguageProvider _languageProvider;
        private readonly IContentStatusProvider _contentStatusProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IFrontContentProvider _frontContentProvider;
        private readonly IContentProvider _contentProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IFrontProvider _frontProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontContentController(IClassificationProvider classificationProvider, IClassificationValueProvider classificationValueProvider, IContentTypeProvider contentTypeProvider, ILanguageProvider languageProvider, IContentStatusProvider contentStatusProvider, ISecurityLevelProvider securityLevelProvider, IOrganizationProvider organizationProvider, IProjectProvider projectProvider, IFrontContentProvider frontContentProvider, IContentProvider contentProvider, IClaimCheck claimCheck, IFrontProvider frontProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _classificationProvider = classificationProvider;
            _classificationValueProvider = classificationValueProvider;
            _contentTypeProvider = contentTypeProvider;
            _languageProvider = languageProvider;
            _contentStatusProvider = contentStatusProvider;
            _securityLevelProvider = securityLevelProvider;
            _organizationProvider = organizationProvider;
            _projectProvider = projectProvider;
            _frontContentProvider = frontContentProvider;
            _contentProvider = contentProvider;
            _claimCheck = claimCheck;
            _frontProvider = frontProvider;
            _userManager = userManager;
        }

        [HttpGet(ContentType)]
        public async Task<IActionResult> ContentType()
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, ApplicationRight, 1))
            {

                var ContentTypeGroups = await _frontContentProvider.ContentTypeContentTypeGroup(CurrentUser.Id);
                foreach (var ContentTypeGroup in ContentTypeGroups)
                {
                    ContentTypeGroup.ContentTypes = await _frontContentProvider.ContentType(CurrentUser.Id, ContentTypeGroup.ContentTypeGroupID);

                }
                return Ok(ContentTypeGroups);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = No rights,
            });
        }

        [HttpGet(ShowContent/{Id:int})]
        public async Task<IActionResult> ShowContent(int Id)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, ApplicationRight, 1))
            {

                var FrontContentShowContent = await _frontContentProvider.FrontContentShowContent(CurrentUser.Id, Id);

                return Ok(FrontContentShowContent);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = No rights,
            });
        }

        [HttpGet(ContentNew/{Id:int})]
        public async Task<IActionResult> ContentNew(int Id)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, ApplicationRight, 1))
            {
                var ContentNew = new FrontContentContentNew();
                ContentNew.ContentTypeId = Id;
                ContentNew.Organizations = await _organizationProvider.ListofUser(CurrentUser.Id);
                ContentNew.Projects = await _projectProvider.ListofUser(CurrentUser.Id);
                ContentNew.Languages = await _languageProvider.ActiveList(CurrentUser.Id);
                ContentNew.SecurityLevels = await _securityLevelProvider.ListofUser(CurrentUser.Id);
                ContentNew.ContentStatuses = await _contentStatusProvider.List(CurrentUser.Id);
                ContentNew.Classifications= await _frontContentProvider.NewClassifications(CurrentUser.Id, Id);
                ContentNew.OrganizationId = ContentNew.Organizations.First().OrganizationId;
                foreach (var Classification in ContentNew.Classifications)
                {
                    Classification.ClassificationValues = await _frontContentProvider.NewClassificationValues(CurrentUser.Id, Classification.ClassificationId);

                }
                return Ok(ContentNew);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = No rights,
            });
        }

        [HttpPost(ContentNew)]
        public async Task<IActionResult> ContentNew(FrontContentContentNew Content)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, ApplicationRight, 1))
            {
                Content.CreatorId = CurrentUser.Id;
                _frontContentProvider.FrontContentCreatePost(CurrentUser.Id, Content);
                return Ok(Content);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = No rights,
            });
        }

        [HttpGet(AdvancedSearch)]
        public async Task<IActionResult> AdvancedSearch()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, ApplicationRight, 1))
            {
                var ContentSearch = new ContentAdvancedSearchPost();
                ContentSearch.Classifications = await _classificationProvider.ClassificationsWithValues(CurrentUser.Id);
                ContentSearch.Organizations = await _organizationProvider.List(CurrentUser.Id);
                ContentSearch.Projects = await _projectProvider.List(CurrentUser.Id);
                ContentSearch.ContentTypes= await _contentTypeProvider.List(CurrentUser.Id);
                ContentSearch.ContentStatuses = await _contentStatusProvider.List(CurrentUser.Id);
                ContentSearch.Languages = await _languageProvider.List(CurrentUser.Id);
                ContentSearch.SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);

                foreach(var x in ContentSearch.Classifications)
                {
                    x.ClassificationValues = await _classificationValueProvider.ListPerClassification(CurrentUser.Id, x.ClassificationId);
                }

                return Ok(ContentSearch);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = No rights,
            });
        }


        [HttpPost(AdvancedSearch)]
        public async Task<IActionResult> AdvancedSearch(ContentAdvancedSearchPost AdvancedSearch)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            AdvancedSearch.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, ApplicationRight, 191))
            {
                //var CheckString = await _ContentProvider.CreatePostCheck(Content);
                //if (CheckString.Length == 0)
                //{
                if (AdvancedSearch.Contains == null)
                { AdvancedSearch.Contains = ; }
                if (AdvancedSearch.OrganizationId == null)
                { AdvancedSearch.OrganizationId = 0; }
                if (AdvancedSearch.ProjectId == null)
                { AdvancedSearch.ProjectId = 0; }
                if (AdvancedSearch.ContentTypeId == null)
                { AdvancedSearch.ContentTypeId = 0; }
                if (AdvancedSearch.ContentStatusId == null)
                { AdvancedSearch.ContentStatusId = 0; }
                if (AdvancedSearch.LanguageId == null)
                { AdvancedSearch.LanguageId = 0; }

                foreach(var x in AdvancedSearch.Classifications)
                {
                    if(x.ClassificationValueId ==null)
                    {
                        x.ClassificationValueId = 0;
                    }
                }

                var Result = await _contentProvider.AdvancedSearch(CurrentUser.Id, AdvancedSearch);

                return Ok(Result);
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
                Message = No rights,
            });
        }
    }
}
