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

        public SearchController(ISearchProvider searchProvider, IClassificationValueProvider classificationValueProvider, IContentProvider contentProvider, IOrganizationProvider organizationProvider, IPersonProvider personProvider, IProcessProvider processProvider, IProjectProvider projectProvider, IClaimCheck claimCheck, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
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
                ResultPost.ClassificationValues = await _classificationValueProvider.Search(Contains, CurrentUser.Id);
                ResultPost.Contents = await _contentProvider.Search(Contains, CurrentUser.Id);
                ResultPost.Organizations = await _organizationProvider.Search(Contains, CurrentUser.Id);
                ResultPost.Persons = await _personProvider.Search(Contains, CurrentUser.Id);
                ResultPost.Processes = await _processProvider.Search(Contains, CurrentUser.Id);
                ResultPost.Projects = await _projectProvider.Search(Contains, CurrentUser.Id);
                ResultPost.Page = await _searchProvider.GlobalPostPage(CurrentUser.Id);
                ResultPost.Page.PageSections = await _searchProvider.GlobalPostPageSection(CurrentUser.Id, ResultPost.Page.PageId);
                var RowPosition = 0;
                var AddRowPosition = 0;
                foreach (var x in ResultPost.Page.PageSections)
                {
                    x.DashboardRow = AddRowPosition;
                    if (x.PageSectionDataTypeId == 1)
                    {
                        if (ResultPost.Contents.Count > 5)
                        {
                            x.SizeY = 3;
                            AddRowPosition =+ 3;
                        }
                        else
                        {
                            x.SizeY = 2;
                            AddRowPosition =+ 2;
                        }
                    }
                    if (x.PageSectionDataTypeId == 2)
                    {
                        if (ResultPost.Processes.Count > 5)
                        {
                            x.SizeY = 3;
                            AddRowPosition =+ 3;
                        }
                        else
                        {
                            x.SizeY = 2;
                            AddRowPosition = +2;
                        }
                    }
                    if (x.PageSectionDataTypeId == 3)
                    {
                        if (ResultPost.Organizations.Count > 5)
                        {
                            x.SizeY = 3;
                            AddRowPosition =+ 3;
                        }
                        else
                        {
                            x.SizeY = 2;
                            AddRowPosition = +2;
                        }
                    }
                    if (x.PageSectionDataTypeId == 4)
                    {
                        if (ResultPost.Persons.Count > 5)
                        {
                            x.SizeY = 3;
                            AddRowPosition =+ 3;
                        }
                        else
                        {
                            x.SizeY = 2;
                            AddRowPosition = +2;
                        }
                    }
                    if (x.PageSectionDataTypeId == 5)
                    {
                        if (ResultPost.Projects.Count > 5)
                        {
                            x.SizeY = 3;
                            AddRowPosition =+ 3;
                        }
                        else
                        {
                            x.SizeY = 2;
                            AddRowPosition = +2;
                        }
                    }
                    if (x.PageSectionDataTypeId == 7)
                    {
                        if (ResultPost.ClassificationValues.Count > 5)
                        {
                            x.SizeY = 3;
                            AddRowPosition =+ 3;
                        }
                        else
                        {
                            x.SizeY = 2;
                            AddRowPosition =+ 2;
                        }
                    }

                }
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