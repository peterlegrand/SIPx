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
    public class PageSectionProcessConditionController : ControllerBase
    {
        private readonly IMasterProvider _masterProvider;
        private readonly IPageSectionContentConditionProvider _pageSectionContentConditionProvider;
        private readonly IContentProvider _contentProvider;
        private readonly IContentTypeProvider _contentTypeProvider;
        private readonly IContentTypeGroupProvider _contentTypeGroupProvider;
        private readonly IPersonProvider _personProvider;
        private readonly IProcessTemplateStageTypeProvider _processTemplateStageTypeProvider;
        private readonly IRoleProvider _roleProvider;
        private readonly IProcessTemplateGroupProvider _processTemplateGroupProvider;
        private readonly IProcessTemplateProvider _processTemplateProvider;
        private readonly IPageSectionProcessConditionProvider _pageSectionProcessConditionProvider;
        private readonly IPageSectionProcessConditionTypeProvider _pageSectionProcessConditionTypeProvider;
        private readonly IUserProvider _userProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IProjectProvider _projectProvider;
        //private readonly IProcessStatusProvider _ProcessStatusProvider;
        private readonly ILanguageProvider _languageProvider;
        private readonly IClassificationProvider _classificationProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        //private readonly IProcessTypeProvider _ProcessTypeProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public PageSectionProcessConditionController(
                IPageSectionContentConditionProvider pageSectionContentConditionProvider
                , IContentProvider   contentProvider
                , IContentTypeProvider contentTypeProvider
                , IContentTypeGroupProvider contentTypeGroupProvider
                , IPersonProvider personProvider
                , IProcessTemplateStageTypeProvider processTemplateStageTypeProvider
                , IRoleProvider roleProvider
                , IProcessTemplateGroupProvider processTemplateGroupProvider
                , IProcessTemplateProvider processTemplateProvider
                , IPageSectionProcessConditionProvider pageSectionProcessConditionProvider
                , IPageSectionProcessConditionTypeProvider pageSectionProcessConditionTypeProvider
                , IUserProvider userProvider
                , IOrganizationProvider organizationProvider
                , IProjectProvider projectProvider
                , ILanguageProvider languageProvider
                , IClassificationProvider classificationProvider
                , ISecurityLevelProvider securityLevelProvider
                , IMasterListProvider masterListProvider
                , IMasterProvider masterProvider
                , ICheckProvider checkProvider
                , IClaimCheck claimCheck
                , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterProvider = masterProvider;
            _pageSectionContentConditionProvider = pageSectionContentConditionProvider;
            _contentProvider = contentProvider;
            _contentTypeProvider = contentTypeProvider;
            _contentTypeGroupProvider = contentTypeGroupProvider;
            _personProvider = personProvider;
            _processTemplateStageTypeProvider = processTemplateStageTypeProvider;
            _roleProvider = roleProvider;
            _processTemplateGroupProvider = processTemplateGroupProvider;
            _processTemplateProvider = processTemplateProvider;
            _pageSectionProcessConditionProvider = pageSectionProcessConditionProvider;
            _pageSectionProcessConditionTypeProvider = pageSectionProcessConditionTypeProvider;
            _userProvider = userProvider;
            _organizationProvider = organizationProvider;
            _projectProvider = projectProvider;
            _languageProvider = languageProvider;
            _classificationProvider = classificationProvider;
            _securityLevelProvider = securityLevelProvider;
            _masterListProvider = masterListProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //PETER TODO add security with message like missing in contentcondition
                var PageSectionProcessConditionCreateGet = new PageSectionProcessConditionCreateGet();
                PageSectionProcessConditionCreateGet.PageSectionProcessConditionTypes = await _pageSectionProcessConditionTypeProvider.ListExtended(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.ProcessTemplates = await _processTemplateProvider.List(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.ProcessTemplateGroups = await _processTemplateGroupProvider.List(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.Organizations = await _organizationProvider.List(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.Projects = await _projectProvider.List(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.Roles = await _roleProvider.List(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.Users = await _userProvider.List();
                PageSectionProcessConditionCreateGet.ProcessTemplateStageTypes = await _processTemplateStageTypeProvider.List(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.Languages = await _languageProvider.List(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.Persons = await _personProvider.List();
                PageSectionProcessConditionCreateGet.Contents = await _contentProvider.List();
                PageSectionProcessConditionCreateGet.ContentTypes = await _contentTypeProvider.List(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.ContentTypeGroups = await _contentTypeGroupProvider.List(CurrentUser.Id);


                //PageSectionProcessConditionCreateGet.ProcessTypes = await _ProcessTypeProvider.List(CurrentUser.Id);
                //PageSectionProcessConditionCreateGet.ProcessStatuses = await _ProcessStatusProvider.List(CurrentUser.Id);
                PageSectionProcessConditionCreateGet.Classifications = await _pageSectionProcessConditionProvider.CreateGetClassifications(CurrentUser.Id);
                for (int i = 0; i < PageSectionProcessConditionCreateGet.Classifications.Count(); i++)
                {
                    PageSectionProcessConditionCreateGet.Classifications[i].ClassificationValues = await _pageSectionProcessConditionProvider.CreateGetClassificationValues(CurrentUser.Id, PageSectionProcessConditionCreateGet.Classifications[i].ClassificationId);
                }
                PageSectionProcessConditionCreateGet.PageSectionId = Id;
                //PageSectionProcessConditionCreateGet.Classifications = await _classificationProvider.List(CurrentUser.Id);
                //  var PageSectionCreateGetSequences = await _pageSectionProvider.CreateGetSequence(CurrentUser.Id, Id);
                var SortBys = await _masterListProvider.SortByList(CurrentUser.Id);

                //                PageSectionCreateGet.Sequences = PageSectionCreateGetSequences;
                return Ok(PageSectionProcessConditionCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(PageSectionProcessConditionCreateGet PageSectionProcessCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            PageSectionProcessCondition.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PageSectionProcessCondition.PageSectionProcessConditionDate = DateTime.Now;
                if (PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended.Substring(0, 1) == "V")
                {
                    PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.Classifications.Find(x => x.ClassificationId == int.Parse(PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended.Substring(1))).ClassificationValueId;
                    PageSectionProcessCondition.PageSectionProcessConditionTypeId = 11;

                }
                else
                {
                    PageSectionProcessCondition.PageSectionProcessConditionTypeId = int.Parse(PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended.Substring(1));
                    switch (PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended)
                    {
                        case "T1":
                            PageSectionProcessCondition.PageSectionProcessConditionInt= PageSectionProcessCondition.ProcessTemplateId;
                            break;
                        case "T2":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ProcessTemplateGroupId;
                            break;
                        case "T12":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.OrganizationId;
                            break;
                        case "T13":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ProjectId;
                            break;
                        case "T15":
                            PageSectionProcessCondition.PageSectionProcessConditionString = PageSectionProcessCondition.RoleId;
                            break;
                        case "T16":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.SecurityLevelId;
                            break;
                        case "T20":
                            PageSectionProcessCondition.PageSectionProcessConditionString = PageSectionProcessCondition.SpecificOrganizationRoleOfUserId;
                            break;
                        case "T22":
                            PageSectionProcessCondition.PageSectionProcessConditionString = PageSectionProcessCondition.SpecificProjectRoleOfUserId;
                            break;
                        case "T23":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.RelationUserId;
                            break;
                        case "T24":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.RelationToClassificationValueId;
                            break;
                        case "T25":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ContentId;
                            break;
                        case "T26":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ContentTypeId;
                            break;
                        case "T27":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ContentTypeGroupId;
                            break;
                        case "T28":
                            PageSectionProcessCondition.PageSectionProcessConditionString = PageSectionProcessCondition.UserId;
                            break;
                        case "T37":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.PersonId;
                            break;
                    }
                }
                //                var CheckString = await _pageSectionProvider.CreatePostCheck(PageSection);
                //              if (CheckString.Length == 0)
                _pageSectionProcessConditionProvider.CreatePost(PageSectionProcessCondition);
                return Ok(PageSectionProcessCondition);
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
                return Ok(await _pageSectionProcessConditionProvider.IndexGet(CurrentUser.Id, Id));
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
                //if (await _checkProvider.CheckIfRecordExists("PageSectionProcessConditions", "PageSectionID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var PageSectionProcessCondition = await _pageSectionProcessConditionProvider.UpdateGet(CurrentUser.Id, Id);

                PageSectionProcessCondition.PageSectionProcessConditionTypes = await _pageSectionProcessConditionTypeProvider.ListExtended(CurrentUser.Id);
                PageSectionProcessCondition.ProcessTemplates = await _processTemplateProvider.List(CurrentUser.Id);
                PageSectionProcessCondition.ProcessTemplateGroups = await _processTemplateGroupProvider.List(CurrentUser.Id);
                PageSectionProcessCondition.Organizations = await _organizationProvider.List(CurrentUser.Id);
                PageSectionProcessCondition.Projects = await _projectProvider.List(CurrentUser.Id);
                PageSectionProcessCondition.Roles = await _roleProvider.List(CurrentUser.Id);
                PageSectionProcessCondition.SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                PageSectionProcessCondition.Users = await _userProvider.List();
                PageSectionProcessCondition.ProcessTemplateStageTypes = await _processTemplateStageTypeProvider.List(CurrentUser.Id);
                PageSectionProcessCondition.Languages = await _languageProvider.List(CurrentUser.Id);
                PageSectionProcessCondition.Persons = await _personProvider.List();
                PageSectionProcessCondition.Contents = await _contentProvider.List();
                PageSectionProcessCondition.ContentTypes = await _contentTypeProvider.List(CurrentUser.Id);
                PageSectionProcessCondition.ContentTypeGroups = await _contentTypeGroupProvider.List(CurrentUser.Id);



                PageSectionProcessCondition.Classifications = await _pageSectionProcessConditionProvider.CreateGetClassifications(CurrentUser.Id);


                for (int i = 0; i < PageSectionProcessCondition.Classifications.Count(); i++)
                {
                    PageSectionProcessCondition.Classifications[i].ClassificationValues = await _pageSectionProcessConditionProvider.CreateGetClassificationValues(CurrentUser.Id, PageSectionProcessCondition.Classifications[i].ClassificationId);
                }
                PageSectionProcessCondition.PageSectionProcessConditionId = Id;


                PageSectionProcessCondition.UserId = CurrentUser.Id;

                if (PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended.Substring(0, 1) == "V")
                {
                    PageSectionProcessCondition.Classifications.Find(x => x.ClassificationId == int.Parse(PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended.Substring(1))).ClassificationValueId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                }
                else
                {
                    switch (PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended)
                    {


                        case "T1":
                            PageSectionProcessCondition.ProcessTemplateId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;
                        case "T2":
                            PageSectionProcessCondition.ProcessTemplateGroupId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;
                        case "T12":
                            PageSectionProcessCondition.OrganizationId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;
                        case "T13":
                            PageSectionProcessCondition.ProjectId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;
                        case "T15":
                            PageSectionProcessCondition.RoleId = PageSectionProcessCondition.PageSectionProcessConditionString;
                            break;
                        case "T16":
                            PageSectionProcessCondition.SecurityLevelId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;
                        case "T20":
                            PageSectionProcessCondition.SpecificOrganizationRoleOfUserId = PageSectionProcessCondition.PageSectionProcessConditionString;
                            break;
                        case "T22":
                            PageSectionProcessCondition.SpecificProjectRoleOfUserId = PageSectionProcessCondition.PageSectionProcessConditionString;
                            break;
                        case "T23":
                            PageSectionProcessCondition.RelationUserId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;
                        case "T24":
                            PageSectionProcessCondition.RelationToClassificationValueId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;
                        case "T25":
                            PageSectionProcessCondition.ContentId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;
                        case "T26":
                            PageSectionProcessCondition.ContentTypeId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;
                        case "T27":
                            PageSectionProcessCondition.ContentTypeGroupId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;
                        case "T28":
                            PageSectionProcessCondition.UserId = PageSectionProcessCondition.PageSectionProcessConditionString;
                            break;
                        case "T37":
                            PageSectionProcessCondition.PersonId = PageSectionProcessCondition.PageSectionProcessConditionInt;
                            break;


                    }
                }




                for (int i = 0; i < PageSectionProcessCondition.Classifications.Count(); i++)
                {
                    PageSectionProcessCondition.Classifications[i].ClassificationValues = await _pageSectionProcessConditionProvider.CreateGetClassificationValues(CurrentUser.Id, PageSectionProcessCondition.Classifications[i].ClassificationId);
                }
                PageSectionProcessCondition.PageSectionProcessConditionId = Id;
                //if (PageSectionProcessCondition.PageSectionProcessConditionTypeId == 11)
                //{ PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended = "V" + PageSectionProcessCondition.PageSectionProcessConditionInt; }
                //else
                //{ PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended = "T" + PageSectionProcessCondition.PageSectionProcessConditionTypeId; }
                //if (new[] { "T1", "T2", "T9", "T10" }.Contains(PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended))
                //{
                //    PageSectionProcessCondition.PageSectionProcessConditionTypes.Find(x => x.ExtendedId == PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended).StringValue = PageSectionProcessCondition.PageSectionProcessConditionString;
                //}
                //else
                //{
                //    if (new[] { "T12", "T13", "T13", "T15" }.Contains(PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended))
                //    {
                //        PageSectionProcessCondition.PageSectionProcessConditionTypes.Find(x => x.ExtendedId == PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended).DateValue = PageSectionProcessCondition.PageSectionProcessConditionDate;
                //    }
                //    else
                //    {
                //        PageSectionProcessCondition.PageSectionProcessConditionTypes.Find(x => x.ExtendedId == PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended).IntValue = PageSectionProcessCondition.PageSectionProcessConditionInt;
                //    }
                //}
                return Ok(PageSectionProcessCondition);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(PageSectionProcessConditionUpdateGet PageSectionProcessCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PageSectionProcessCondition.UserId = CurrentUser.Id;
                //var CheckString = await _PageSectionProvider.UpdatePostCheck(PageSection);
                //if (CheckString.Length == 0)
                //{
                PageSectionProcessCondition.PageSectionProcessConditionTypeId = int.Parse(PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended.Substring(1));

                if(PageSectionProcessCondition.PageSectionProcessConditionDate==null || PageSectionProcessCondition.PageSectionProcessConditionDate == DateTime.MinValue)
                { 
                PageSectionProcessCondition.PageSectionProcessConditionDate = DateTime.Now;
                }
                if (PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended.Substring(0, 1) == "V")
                {
                    PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.Classifications.Find(x => x.ClassificationId == int.Parse(PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended.Substring(1))).ClassificationValueId;
                    PageSectionProcessCondition.PageSectionProcessConditionTypeId = 39;

                }
                else
                {
                    PageSectionProcessCondition.PageSectionProcessConditionTypeId = int.Parse(PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended.Substring(1));
                    switch (PageSectionProcessCondition.PageSectionProcessConditionTypeIdExtended)
                    {


                        case "T1":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ProcessTemplateId;
                            break;
                        case "T2":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ProcessTemplateGroupId;
                            break;
                        case "T12":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.OrganizationId;
                            break;
                        case "T13":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ProjectId;
                            break;
                        case "T15":
                            PageSectionProcessCondition.PageSectionProcessConditionString = PageSectionProcessCondition.RoleId;
                            break;
                        case "T16":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.SecurityLevelId;
                            break;
                        case "T20":
                            PageSectionProcessCondition.PageSectionProcessConditionString = PageSectionProcessCondition.SpecificOrganizationRoleOfUserId;
                            break;
                        case "T22":
                            PageSectionProcessCondition.PageSectionProcessConditionString = PageSectionProcessCondition.SpecificProjectRoleOfUserId;
                            break;
                        case "T23":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.RelationUserId;
                            break;
                        case "T24":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.RelationToClassificationValueId;
                            break;
                        case "T25":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ContentId;
                            break;
                        case "T26":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ContentTypeId;
                            break;
                        case "T27":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.ContentTypeGroupId;
                            break;
                        case "T28":
                            PageSectionProcessCondition.PageSectionProcessConditionString = PageSectionProcessCondition.UserId;
                            break;
                        case "T37":
                            PageSectionProcessCondition.PageSectionProcessConditionInt = PageSectionProcessCondition.PersonId;
                            break;


                    }
                }




                _pageSectionProcessConditionProvider.UpdatePost(PageSectionProcessCondition);
                return Ok(PageSectionProcessCondition);
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

                var x = await _pageSectionProcessConditionProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(PageSectionProcessConditionDeleteGet PageSectionProcessCondition)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                PageSectionProcessCondition.UserId= CurrentUser.Id;
                //var CheckString = await _PageSectionProvider.DeletePostCheck(PageSection);
                //if (CheckString.Length == 0)
                //{
                _pageSectionProcessConditionProvider.DeletePost(PageSectionProcessCondition.PageSectionProcessConditionId);
                return Ok(PageSectionProcessCondition);
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