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
    public class FrontClassificationValueController : Controller
    {
        private readonly IDateLevelProvider _dateLevelProvider;
        private readonly IClassificationProvider _classificationProvider;
        private readonly IPersonProvider _personProvider;
        private readonly IFrontClassificationValueProvider _frontClassificationValueProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IFrontProvider _frontProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontClassificationValueController(IDateLevelProvider dateLevelProvider
            , IClassificationProvider classificationProvider
            , IPersonProvider personProvider
            , IFrontClassificationValueProvider frontClassificationValueProvider
            ,  IClaimCheck claimCheck
            , IClassificationValueProvider classificationValueProvider
            , IFrontProvider frontProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _dateLevelProvider = dateLevelProvider;
            _classificationProvider = classificationProvider;
            _personProvider = personProvider;
            _frontClassificationValueProvider = frontClassificationValueProvider;
            _claimCheck = claimCheck;
            _classificationValueProvider = classificationValueProvider;
            _frontProvider = frontProvider;
            _userManager = userManager;
        }

        [HttpGet("Dashboard/{Id:int}")]
        public async Task<IActionResult> Dashboard(int Id)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {

                var ClassificationValue = await _frontClassificationValueProvider.Dashboard(CurrentUser.Id, Id);
                return Ok(ClassificationValue);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationValueSearch = new ClassificationValueAdvancedSearchPost();
                ClassificationValueSearch.DateLevels = await _dateLevelProvider.List(CurrentUser.Id);
                ClassificationValueSearch.Classifications = await _classificationProvider.List(CurrentUser.Id);
                ClassificationValueSearch.Persons = await _personProvider.List();
                return Ok(ClassificationValueSearch);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpPost("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch(ClassificationValueAdvancedSearchPost AdvancedSearch)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            AdvancedSearch.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _ClassificationValueProvider.CreatePostCheck(ClassificationValue);
                //if (CheckString.Length == 0)
                //{
                if (AdvancedSearch.Contains == null)
                { AdvancedSearch.Contains = ""; }
                if (AdvancedSearch.ClassificationId == null)
                { AdvancedSearch.ClassificationId = 0; }
                if (AdvancedSearch.DateLevelId == null)
                { AdvancedSearch.DateLevelId = 1; }
                if (AdvancedSearch.PersonId == null)
                { AdvancedSearch.PersonId = 0; }
                var Result = await _classificationValueProvider.AdvancedSearch(CurrentUser.Id, AdvancedSearch);
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
