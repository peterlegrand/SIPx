﻿using System;
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
    public class PageSectionContentConditionController : ControllerBase
    {
        private readonly IMasterProvider _masterProvider;
        private readonly IPageSectionContentConditionProvider _pageSectionContentConditionProvider;
        private readonly IPageSectionContentConditionTypeProvider _pageSectionContentConditionTypeProvider;
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

        public PageSectionContentConditionController(IPageSectionContentConditionProvider pageSectionContentConditionProvider,
            IPageSectionContentConditionTypeProvider pageSectionContentConditionTypeProvider,
            IUserProvider userProvider, IOrganizationProvider organizationProvider,
            IProjectProvider projectProvider, IContentStatusProvider contentStatusProvider, IContentTypeProvider contentTypeProvider,
            ILanguageProvider languageProvider, IClassificationProvider classificationProvider, ISecurityLevelProvider securityLevelProvider,
            IMasterListProvider masterListProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterProvider = masterProvider;
            _pageSectionContentConditionProvider = pageSectionContentConditionProvider;
            _pageSectionContentConditionTypeProvider = pageSectionContentConditionTypeProvider;
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
        private async Task<PageSectionContentConditionCreateGet> CreateAddDropDownBoxes(PageSectionContentConditionCreateGet PageSectionContentCondition, string UserId, int PageSectionId)
        {
            PageSectionContentCondition.PageSectionContentConditionTypes = await _pageSectionContentConditionTypeProvider.ListExtended(UserId);
            PageSectionContentCondition.Users = await _userProvider.List();
            PageSectionContentCondition.Projects = await _projectProvider.List(UserId);
            PageSectionContentCondition.ContentTypes = await _contentTypeProvider.List(UserId);
            PageSectionContentCondition.ContentStatuses = await _contentStatusProvider.List(UserId);
            PageSectionContentCondition.Languages = await _languageProvider.List(UserId);
            PageSectionContentCondition.SecurityLevels = await _securityLevelProvider.List(UserId);
            PageSectionContentCondition.Classifications = await _pageSectionContentConditionProvider.CreateGetClassifications(UserId);
            for (int i = 0; i < PageSectionContentCondition.Classifications.Count(); i++)
            {
                PageSectionContentCondition.Classifications[i].ClassificationValues = await _pageSectionContentConditionProvider.CreateGetClassificationValues(UserId, PageSectionContentCondition.Classifications[i].ClassificationId);
            }
            PageSectionContentCondition.PageSectionId = PageSectionId;
            var SortBys = await _masterListProvider.SortByList(UserId);

            return PageSectionContentCondition;
        }
        private async Task<PageSectionContentConditionUpdateGet> UpdateAddDropDownBoxes(PageSectionContentConditionUpdateGet PageSectionContentCondition, string UserId)
        {
            return PageSectionContentCondition;
        }
        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var PageSectionContentCondition= new PageSectionContentConditionCreateGet();
                PageSectionContentCondition = await CreateAddDropDownBoxes(PageSectionContentCondition, CurrentUser.Id, Id);
              return Ok(PageSectionContentCondition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PageSectionContentConditionCreateGet PageSectionContentCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PageSectionContentCondition.UserId = CurrentUser.Id;



            //PETER TO DO add the below somehow. also in both updates
            //var ErrorMessages = new List<ErrorMessage>();
            //if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            //{
            //    ErrorMessages = await _classificationProvider.CreatePostCheck(Classification);
            //    if (ErrorMessages.Count > 0)
            //    {
            //        Classification = await CreateAddDropDownBoxes(Classification, CurrentUser.Id);
            //    }
            //    else
            //    {
            //        _classificationProvider.CreatePost(Classification);
            //    }
            //    ClassificationCreateGetWithErrorMessages ClassificationWithErrorMessage = new ClassificationCreateGetWithErrorMessages { Classification = Classification, ErrorMessages = ErrorMessages };
            //    return Ok(ClassificationWithErrorMessage);
            //}
            //ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            //ClassificationCreateGetWithErrorMessages ClassificationWithNoRights = new ClassificationCreateGetWithErrorMessages { Classification = Classification, ErrorMessages = ErrorMessages };
            //return Ok(ClassificationWithNoRights);




                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PageSectionContentCondition.PageSectionContentConditionDate = DateTime.Now;
                if (PageSectionContentCondition.PageSectionContentConditionTypeIdExtended.Substring(0, 1) == "V")
                {
                    PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.Classifications.Find(x => x.ClassificationId == int.Parse(PageSectionContentCondition.PageSectionContentConditionTypeIdExtended.Substring(1))).ClassificationValueId;
                    PageSectionContentCondition.PageSectionContentConditionTypeId = 11;

                }
                else
                {
                    PageSectionContentCondition.PageSectionContentConditionTypeId = int.Parse(PageSectionContentCondition.PageSectionContentConditionTypeIdExtended.Substring(1));
                    switch (PageSectionContentCondition.PageSectionContentConditionTypeIdExtended)
                    {
                        case "T1":
                            PageSectionContentCondition.PageSectionContentConditionString = PageSectionContentCondition.UserId;
                            break;
                        case "T3":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.OrganizationId;
                            break;
                        case "T4":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.ProjectId;
                            break;
                        case "T5":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.ContentTypeId;
                            break;
                        case "T6":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.ContentStatusId;
                            break;
                        case "T7":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.LanguageId;
                            break;
                        case "T8":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.SecurityLevelId;
                            break;
                        case "T9":
                            PageSectionContentCondition.PageSectionContentConditionString = PageSectionContentCondition.SelectedCreatorId;
                            break;
                        case "T10":
                            PageSectionContentCondition.PageSectionContentConditionString = PageSectionContentCondition.SelectedModifierId;
                            break;
                        case "T12":
                            PageSectionContentCondition.PageSectionContentConditionDate = PageSectionContentCondition.CreatedFromDate;
                            break;
                        case "T13":
                            PageSectionContentCondition.PageSectionContentConditionDate = PageSectionContentCondition.CreatedToDate;
                            break;
                        case "T14":
                            PageSectionContentCondition.PageSectionContentConditionDate = PageSectionContentCondition.ModifiedFromDate;
                            break;
                        case "T15":
                            PageSectionContentCondition.PageSectionContentConditionDate = PageSectionContentCondition.ModifiedToDate;
                            break;
                    }
                }
                //                var CheckString = await _pageSectionProvider.CreatePostCheck(PageSection);
                //              if (CheckString.Length == 0)
                _pageSectionContentConditionProvider.CreatePost(PageSectionContentCondition);
                return Ok(PageSectionContentCondition);
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
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _pageSectionContentConditionProvider.IndexGet(CurrentUser.Id, Id));
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("PageSectionContentConditions", "PageSectionID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var PageSectionContentCondition = await _pageSectionContentConditionProvider.UpdateGet(CurrentUser.Id, Id);
                PageSectionContentCondition.PageSectionContentConditionTypes = await _pageSectionContentConditionTypeProvider.ListExtended(CurrentUser.Id);
                PageSectionContentCondition.Users = await _userProvider.List();
                PageSectionContentCondition.Projects = await _projectProvider.List(CurrentUser.Id);
                PageSectionContentCondition.ContentTypes = await _contentTypeProvider.List(CurrentUser.Id);
                PageSectionContentCondition.ContentStatuses = await _contentStatusProvider.List(CurrentUser.Id);
                PageSectionContentCondition.Languages = await _languageProvider.List(CurrentUser.Id);
                PageSectionContentCondition.SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                PageSectionContentCondition.Classifications = await _pageSectionContentConditionProvider.CreateGetClassifications(CurrentUser.Id);
                PageSectionContentCondition.UserId = CurrentUser.Id;

                if (PageSectionContentCondition.PageSectionContentConditionTypeIdExtended.Substring(0, 1) == "V")
                {
                    PageSectionContentCondition.Classifications.Find(x => x.ClassificationId == int.Parse(PageSectionContentCondition.PageSectionContentConditionTypeIdExtended.Substring(1))).ClassificationValueId = PageSectionContentCondition.PageSectionContentConditionInt;
                }
                else
                {
                    switch (PageSectionContentCondition.PageSectionContentConditionTypeIdExtended)
                    {
                        case "T1":
                            PageSectionContentCondition.UserId = PageSectionContentCondition.PageSectionContentConditionString;
                            break;
                        case "T3":
                            PageSectionContentCondition.OrganizationId = PageSectionContentCondition.PageSectionContentConditionInt;
                            break;
                        case "T4":
                            PageSectionContentCondition.ProjectId = PageSectionContentCondition.PageSectionContentConditionInt;
                            break;
                        case "T5":
                            PageSectionContentCondition.ContentTypeId = PageSectionContentCondition.PageSectionContentConditionInt;
                            break;
                        case "T6":
                            PageSectionContentCondition.ContentStatusId = PageSectionContentCondition.PageSectionContentConditionInt;
                            break;
                        case "T7":
                            PageSectionContentCondition.LanguageId = PageSectionContentCondition.PageSectionContentConditionInt;
                            break;
                        case "T8":
                            PageSectionContentCondition.SecurityLevelId = PageSectionContentCondition.PageSectionContentConditionInt;
                            break;
                        case "T9":
                            PageSectionContentCondition.SelectedCreatorId = PageSectionContentCondition.PageSectionContentConditionString;
                            break;
                        case "T10":
                            PageSectionContentCondition.SelectedModifierId = PageSectionContentCondition.PageSectionContentConditionString;
                            break;
                        case "T12":
                            PageSectionContentCondition.CreatedFromDate = PageSectionContentCondition.PageSectionContentConditionDate;
                            break;
                        case "T13":
                            PageSectionContentCondition.CreatedToDate = PageSectionContentCondition.PageSectionContentConditionDate;
                            break;
                        case "T14":
                            PageSectionContentCondition.ModifiedFromDate = PageSectionContentCondition.PageSectionContentConditionDate;
                            break;
                        case "T15":
                            PageSectionContentCondition.ModifiedToDate = PageSectionContentCondition.PageSectionContentConditionDate;
                            break;
                    }
                }




                for (int i = 0; i < PageSectionContentCondition.Classifications.Count(); i++)
                {
                    PageSectionContentCondition.Classifications[i].ClassificationValues = await _pageSectionContentConditionProvider.CreateGetClassificationValues(CurrentUser.Id, PageSectionContentCondition.Classifications[i].ClassificationId);
                }
                PageSectionContentCondition.PageSectionContentConditionId = Id;
                //if (PageSectionContentCondition.PageSectionContentConditionTypeId == 11)
                //{ PageSectionContentCondition.PageSectionContentConditionTypeIdExtended = "V" + PageSectionContentCondition.PageSectionContentConditionInt; }
                //else
                //{ PageSectionContentCondition.PageSectionContentConditionTypeIdExtended = "T" + PageSectionContentCondition.PageSectionContentConditionTypeId; }
                //if (new[] { "T1", "T2", "T9", "T10" }.Contains(PageSectionContentCondition.PageSectionContentConditionTypeIdExtended))
                //{
                //    PageSectionContentCondition.PageSectionContentConditionTypes.Find(x => x.ExtendedId == PageSectionContentCondition.PageSectionContentConditionTypeIdExtended).StringValue = PageSectionContentCondition.PageSectionContentConditionString;
                //}
                //else
                //{
                //    if (new[] { "T12", "T13", "T13", "T15" }.Contains(PageSectionContentCondition.PageSectionContentConditionTypeIdExtended))
                //    {
                //        PageSectionContentCondition.PageSectionContentConditionTypes.Find(x => x.ExtendedId == PageSectionContentCondition.PageSectionContentConditionTypeIdExtended).DateValue = PageSectionContentCondition.PageSectionContentConditionDate;
                //    }
                //    else
                //    {
                //        PageSectionContentCondition.PageSectionContentConditionTypes.Find(x => x.ExtendedId == PageSectionContentCondition.PageSectionContentConditionTypeIdExtended).IntValue = PageSectionContentCondition.PageSectionContentConditionInt;
                //    }
                //}
                return Ok(PageSectionContentCondition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PageSectionContentConditionUpdateGet PageSectionContentCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PageSectionContentCondition.UserId = CurrentUser.Id;
                //var CheckString = await _PageSectionProvider.UpdatePostCheck(PageSection);
                //if (CheckString.Length == 0)
                //{
                PageSectionContentCondition.PageSectionContentConditionTypeId = int.Parse(PageSectionContentCondition.PageSectionContentConditionTypeIdExtended.Substring(1));


                PageSectionContentCondition.PageSectionContentConditionDate = DateTime.Now;
                if (PageSectionContentCondition.PageSectionContentConditionTypeIdExtended.Substring(0, 1) == "V")
                {
                    PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.Classifications.Find(x => x.ClassificationId == int.Parse(PageSectionContentCondition.PageSectionContentConditionTypeIdExtended.Substring(1))).ClassificationValueId;
                    PageSectionContentCondition.PageSectionContentConditionTypeId = 11;

                }
                else
                {
                    PageSectionContentCondition.PageSectionContentConditionTypeId = int.Parse(PageSectionContentCondition.PageSectionContentConditionTypeIdExtended.Substring(1));
                    switch (PageSectionContentCondition.PageSectionContentConditionTypeIdExtended)
                    {
                        case "T1":
                            PageSectionContentCondition.PageSectionContentConditionString = PageSectionContentCondition.UserId;
                            break;
                        case "T3":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.OrganizationId;
                            break;
                        case "T4":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.ProjectId;
                            break;
                        case "T5":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.ContentTypeId;
                            break;
                        case "T6":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.ContentStatusId;
                            break;
                        case "T7":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.LanguageId;
                            break;
                        case "T8":
                            PageSectionContentCondition.PageSectionContentConditionInt = PageSectionContentCondition.SecurityLevelId;
                            break;
                        case "T9":
                            PageSectionContentCondition.PageSectionContentConditionString = PageSectionContentCondition.SelectedCreatorId;
                            break;
                        case "T10":
                            PageSectionContentCondition.PageSectionContentConditionString = PageSectionContentCondition.SelectedModifierId;
                            break;
                        case "T12":
                            PageSectionContentCondition.PageSectionContentConditionDate = PageSectionContentCondition.CreatedFromDate;
                            break;
                        case "T13":
                            PageSectionContentCondition.PageSectionContentConditionDate = PageSectionContentCondition.CreatedToDate;
                            break;
                        case "T14":
                            PageSectionContentCondition.PageSectionContentConditionDate = PageSectionContentCondition.ModifiedFromDate;
                            break;
                        case "T15":
                            PageSectionContentCondition.PageSectionContentConditionDate = PageSectionContentCondition.ModifiedToDate;
                            break;
                    }
                }




                _pageSectionContentConditionProvider.UpdatePost(PageSectionContentCondition);
                return Ok(PageSectionContentCondition);
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("PageSections", "PageSectionID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                var x = await _pageSectionContentConditionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PageSectionContentConditionDeleteGet PageSectionContentCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PageSectionContentCondition.UserId= CurrentUser.Id;
                //var CheckString = await _PageSectionProvider.DeletePostCheck(PageSection);
                //if (CheckString.Length == 0)
                //{
                _pageSectionContentConditionProvider.DeletePost(CurrentUser.Id, PageSectionContentCondition.PageSectionContentConditionId);
                return Ok(PageSectionContentCondition);
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
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
        //               if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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