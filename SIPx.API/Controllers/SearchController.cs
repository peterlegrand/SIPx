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
    public class SearchController : ControllerBase
    {
        private readonly ISearchProvider _searchProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IContentProvider _contentProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IPersonProvider _personProvider;
        private readonly IProcessProvider _processProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public SearchController(ISearchProvider searchProvider,  IClassificationValueProvider classificationValueProvider, IContentProvider contentProvider, IOrganizationProvider organizationProvider, IPersonProvider personProvider, IProcessProvider processProvider, IProjectProvider projectProvider, IClaimCheck claimCheck,  Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _searchProvider = searchProvider;
            _classificationValueProvider = classificationValueProvider;
            _contentProvider = contentProvider;
            _organizationProvider = organizationProvider;
            _personProvider = personProvider;
            _processProvider = processProvider;
            _projectProvider = projectProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }
        [HttpGet("Global/{Contains}")]
        public async Task<IActionResult> Global(string Contains)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _personProvider.CreatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                var ResultPost = new SearchGlobalPost();
                ResultPost.ClassificationValues = await _classificationValueProvider.ClassificationValueSearch(Contains, CurrentUser.Id);
                ResultPost.Contents = await _contentProvider.ContentSearch(Contains, CurrentUser.Id);
                ResultPost.Organizations= await _organizationProvider.OrganizationSearch(Contains, CurrentUser.Id);
                ResultPost.Persons = await _personProvider.PersonSearch(Contains, CurrentUser.Id);
                ResultPost.Processes = await _processProvider.ProcessSearch(Contains, CurrentUser.Id);
                ResultPost.Projects = await _projectProvider.ProjectSearch(Contains, CurrentUser.Id);
                ResultPost.Page = await _searchProvider.GlobalPostPage(CurrentUser.Id);
                ResultPost.Page.PageSections = await _searchProvider.GlobalPostPageSection(CurrentUser.Id, ResultPost.Page.PageId);
                return Ok(ResultPost);
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
    }
}