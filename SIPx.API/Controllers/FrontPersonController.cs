﻿using System.Threading.Tasks;
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
        private readonly IFrontUserProvider _frontUserProvider;
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

        public FrontPersonController(IFrontUserProvider frontUserProvider
            , IPersonProvider personProvider
            , IRoleProvider roleProvider
            , IMasterListProvider masterListProvider
            , IProjectProvider projectProvider
            ,  IOrganizationProvider organizationProvider
            , IClassificationValueProvider classificationValueProvider
            , IFrontPersonProvider frontPersonProvider
            , ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , IClassificationProvider classificationProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _frontUserProvider = frontUserProvider;
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

    
        [HttpGet("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
        [HttpGet("Dashboard/{Id:int}")]
        public async Task<IActionResult> Dashboard(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var User = new FrontUserIndexGet();
                User = await _frontUserProvider.IndexGet(CurrentUser.Id, Id);
                var Address = await _frontUserProvider.IndexGetAddress(CurrentUser.Id, Id);
                var Telecom = await _frontUserProvider.IndexGetTelecom(CurrentUser.Id, Id);
                var Project = await _frontUserProvider.IndexGetProject(CurrentUser.Id, Id);
                var Organization = await _frontUserProvider.IndexGetOrganization(CurrentUser.Id, Id);
                var Content = await _frontUserProvider.IndexGetContent(CurrentUser.Id, Id);
                var Process = await _frontUserProvider.IndexGetProcess(CurrentUser.Id, Id);
                //Relations                var Member = await _frontUserProvider.IndexGetMember(CurrentUser.Id, Id);
                User.Addresses = Address;
                User.Telecoms = Telecom;
                User.Projects = Project;
                User.Organizations = Organization;
                User.Processes = Process;
                User.Contents = Content;
                //      var x= await _frontUserProvider.IndexGetSubUserTree(CurrentUser.Id, Id);
                //    User.SubUserTree = JObject.Parse(x);

                return Ok(User);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}