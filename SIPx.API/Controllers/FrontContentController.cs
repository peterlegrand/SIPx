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
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class FrontContentController : Controller
    {
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

        public FrontContentController(ILanguageProvider languageProvider, IContentStatusProvider contentStatusProvider, ISecurityLevelProvider securityLevelProvider, IOrganizationProvider organizationProvider, IProjectProvider projectProvider, IFrontContentProvider frontContentProvider, IContentProvider contentProvider, IClaimCheck claimCheck, IFrontProvider frontProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
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

        [HttpGet("ContentType")]
        public async Task<IActionResult> ContentType()
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
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
                Message = "No rights",
            });
        }

        [HttpGet("ShowContent/{Id:int}")]
        public async Task<IActionResult> ShowContent(int Id)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {

                var FrontContentShowContent = await _frontContentProvider.FrontContentShowContent(CurrentUser.Id, Id);

                return Ok(FrontContentShowContent);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("ContentNew/{Id:int}")]
        public async Task<IActionResult> ContentNew(int Id)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var ContentNew = new FrontContentContentNew();
                ContentNew.ContentTypeId = Id;
                ContentNew.Organizations = await _organizationProvider.ListofUser(CurrentUser.Id);
                ContentNew.Projects = await _projectProvider.ListofUser(CurrentUser.Id);
                ContentNew.Languages = await _languageProvider.ActiveList(CurrentUser.Id);
                ContentNew.SecurityLevels = await _securityLevelProvider.ListofUser(CurrentUser.Id);
                ContentNew.ContentStatuses = await _contentStatusProvider.List(CurrentUser.Id);
                ContentNew.Classifications= await _frontContentProvider.NewClassifications(CurrentUser.Id, Id);
                foreach (var Classification in ContentNew.Classifications)
                {
                    Classification.ClassificationValues = await _frontContentProvider.NewClassificationValues(CurrentUser.Id, Classification.ClassificationId);

                }
                return Ok(ContentNew);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("ContentNew")]
        public async Task<IActionResult> ContentNew(FrontContentContentNew Content)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                _frontContentProvider.FrontContentCreatePost(CurrentUser.Id, Content);
                return Ok(Content);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}
