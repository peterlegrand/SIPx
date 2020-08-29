using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class FrontPersonController : ControllerBase
    {
        private readonly IFrontPersonProvider _frontPersonProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public FrontPersonController( IFrontPersonProvider frontPersonProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _frontPersonProvider = frontPersonProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        [HttpGet("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                var PersonAdvancedSearch = new FrontPersonAdvancedSearchGet();
                PersonAdvancedSearch = await _frontPersonProvider.FrontPersonAdvancedSearchGet(CurrentUser.Id);
                PersonAdvancedSearch.ToAge = 120;
                return Ok(PersonAdvancedSearch);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch(FrontPersonAdvancedSearchGet SearchData)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                SearchData.UserId= CurrentUser.Id;
                //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
               var SearchResult = await _frontPersonProvider.FrontPersonAdvancedSearchPost(SearchData);
                SearchData.SearchResult = SearchResult;
                return Ok(SearchData);
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