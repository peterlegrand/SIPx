using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;
using System;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class FrontPersonController : ControllerBase
    {
        private readonly IPersonProvider _personProvider;
        private readonly IRoleProvider _roleProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IFrontPersonProvider _frontPersonProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontPersonController(IPersonProvider personProvider, IRoleProvider roleProvider, IMasterListProvider masterListProvider, IProjectProvider projectProvider,  IOrganizationProvider organizationProvider, IClassificationValueProvider classificationValueProvider, IFrontPersonProvider frontPersonProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _personProvider = personProvider;
            _roleProvider = roleProvider;
            _masterListProvider = masterListProvider;
            _projectProvider = projectProvider;
            _organizationProvider = organizationProvider;
            _classificationValueProvider = classificationValueProvider;
            _frontPersonProvider = frontPersonProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        //[HttpGet("AdvancedSearch")]
        //public async Task<IActionResult> AdvancedSearch()
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
        //    {
        //        var PersonAdvancedSearch = new FrontPersonAdvancedSearchGet();
        //        PersonAdvancedSearch = await _frontPersonProvider.FrontPersonAdvancedSearchGet(CurrentUser.Id);
        //        PersonAdvancedSearch.ToAge = 120;
        //        return Ok(PersonAdvancedSearch);
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });

        //}

        //[HttpPost("AdvancedSearch")]
        //public async Task<IActionResult> AdvancedSearch(FrontPersonAdvancedSearchGet SearchData)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
        //    {
        //        SearchData.UserId= CurrentUser.Id;
        //        //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
        //        //if (CheckString.Length == 0)
        //        //{
        //       var SearchResult = await _frontPersonProvider.FrontPersonAdvancedSearchPost(SearchData);
        //        SearchData.SearchResult = SearchResult;
        //        return Ok(SearchData);
        //        //}
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            //Message = CheckString,
        //        });

        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });

        //}
        [HttpGet("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var PersonSearch = new PersonAdvancedSearchPost();
                PersonSearch.Classifications = await _classificationProvider.List(CurrentUser.Id);
                PersonSearch.ClassificationValues = await _classificationValueProvider.List(CurrentUser.Id);
                PersonSearch.Organizations = await _organizationProvider.List(CurrentUser.Id);
                PersonSearch.Projects = await _projectProvider.List(CurrentUser.Id);
                PersonSearch.Countries = await _masterListProvider.CountryList(CurrentUser.Id);
                PersonSearch.Roles = await _roleProvider.List(CurrentUser.Id);
                return Ok(PersonSearch);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpPost("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch(PersonAdvancedSearchPost AdvancedSearch)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            AdvancedSearch.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _personProvider.CreatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                if (AdvancedSearch.Contains == null)
                { AdvancedSearch.Contains = ""; }
                if (AdvancedSearch.Age == null)
                { AdvancedSearch.Age = 0; }
                if (AdvancedSearch.BirthDate == null)
                { AdvancedSearch.BirthDate = Convert.ToDateTime("1-1-1"); }
                if (AdvancedSearch.MainOrganizationId == null)
                { AdvancedSearch.MainOrganizationId = 0; }
                if (AdvancedSearch.IsUser == null)
                { AdvancedSearch.IsUser = 2; }
                if (AdvancedSearch.RoleId == null)
                { AdvancedSearch.RoleId = ""; }
                if (AdvancedSearch.OrganizationId == null)
                { AdvancedSearch.OrganizationId = 0; }
                if (AdvancedSearch.ProjectId == null)
                { AdvancedSearch.ProjectId = 0; }
                if (AdvancedSearch.CountryId == null)
                { AdvancedSearch.CountryId = 0; }
                if (AdvancedSearch.ProvinceState == null)
                { AdvancedSearch.ProvinceState = ""; }
                if (AdvancedSearch.County == null)
                { AdvancedSearch.County = ""; }
                if (AdvancedSearch.City == null)
                { AdvancedSearch.City = ""; }
                if (AdvancedSearch.ClassificationId == null)
                { AdvancedSearch.ClassificationId = 0; }
                if (AdvancedSearch.ClassificationValueId == null)
                { AdvancedSearch.ClassificationValueId = 0; }

                var Result = await _personProvider.AdvancedSearch(CurrentUser.Id, AdvancedSearch);

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
                Message = "No rights",
            });
        }
    }
}