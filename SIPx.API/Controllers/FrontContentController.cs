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
        private readonly ICheckProvider _checkProvider;
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

        public FrontContentController(ICheckProvider checkProvider, IClassificationProvider classificationProvider
            , IClassificationValueProvider classificationValueProvider
            , IContentTypeProvider contentTypeProvider
            , ILanguageProvider languageProvider
            , IContentStatusProvider contentStatusProvider
            , ISecurityLevelProvider securityLevelProvider
            , IOrganizationProvider organizationProvider
            , IProjectProvider projectProvider
            , IFrontContentProvider frontContentProvider
            , IContentProvider contentProvider
            , IClaimCheck claimCheck
            , IFrontProvider frontProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
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


        private async Task<FrontContentRightsEditUserCreateGet> FrontContentRightsEditUserCreateAddDropDownBoxes(FrontContentRightsEditUserCreateGet FrontContentRightsEditUser)
        {
            FrontContentRightsEditUser.SelectedUsers = await _frontContentProvider.RightsUpdateGetEditUsers(FrontContentRightsEditUser);
            return FrontContentRightsEditUser;
        }
        private async Task<FrontContentRightsReadUserCreateGet> FrontContentRightsReadUserCreateAddDropDownBoxes(FrontContentRightsReadUserCreateGet FrontContentRightsReadUser)
        {
            FrontContentRightsReadUser.SelectedUsers = await _frontContentProvider.RightsUpdateGetReadUsers(FrontContentRightsReadUser);
            return FrontContentRightsReadUser;
        }
        [HttpGet("ContentType")]
        public async Task<IActionResult> ContentType()
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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

        [HttpGet("ShowContentRights/{Id:int}")]
        public async Task<IActionResult> ShowContentRights(int Id)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {

                var FrontContentShowContentRights = await _frontContentProvider.ShowContentRightsGet( Id);
                if(FrontContentShowContentRights.OwnerId ==CurrentUser.Id)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No rights",
                    });

                }

                return Ok(FrontContentShowContentRights);
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ContentNew = new FrontContentContentNew();
                ContentNew = await _frontContentProvider.ContentNewGetContentType(Id);
                ContentNew.ContentTypeId = Id;
                ContentNew.Organizations = await _organizationProvider.ListofUser(CurrentUser.Id);
                ContentNew.Projects = await _projectProvider.ListofUser(CurrentUser.Id);
                ContentNew.Languages = await _languageProvider.ActiveList(CurrentUser.Id);
                ContentNew.SecurityLevels = await _securityLevelProvider.ListofUser(CurrentUser.Id);
                ContentNew.ContentStatuses = await _contentStatusProvider.List(CurrentUser.Id);
                ContentNew.Classifications = await _frontContentProvider.NewClassifications(CurrentUser.Id, Id);
                ContentNew.ContentTypeName = await _contentTypeProvider.ReturnName(CurrentUser.Id, Id);
                    ContentNew.OrganizationId = ContentNew.Organizations.First().OrganizationId;
                foreach (var Classification in ContentNew.Classifications)
                {


                    Classification.ClassificationLevels = await _frontContentProvider.NewClassificationLevels(Classification.ClassificationId);
                    foreach(var Classificationlevel in Classification.ClassificationLevels )
                    {
                        Classificationlevel.ClassificationValues = await _frontContentProvider.NewClassificationValues(CurrentUser.Id, Classification.ClassificationId, Classificationlevel.Sequence, Classificationlevel.Alphabetically);
                    }

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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Content.UserId= CurrentUser.Id;
               var NewId = await _frontContentProvider.FrontContentCreatePost(CurrentUser.Id, Content);
                Content.NewId = NewId;
                return Ok(Content);
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
                var ContentSearch = new ContentAdvancedSearchPost();
                ContentSearch.Classifications = await _classificationProvider.ClassificationsWithValues(CurrentUser.Id);
                ContentSearch.Organizations = await _organizationProvider.List(CurrentUser.Id);
                ContentSearch.Projects = await _projectProvider.List(CurrentUser.Id);
                ContentSearch.ContentTypes = await _contentTypeProvider.List(CurrentUser.Id);
                ContentSearch.ContentStatuses = await _contentStatusProvider.List(CurrentUser.Id);
                ContentSearch.Languages = await _languageProvider.List(CurrentUser.Id);
                ContentSearch.SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);

                foreach (var x in ContentSearch.Classifications)
                {
                    x.ClassificationValues = await _classificationValueProvider.ListPerClassification(CurrentUser.Id, x.ClassificationId);
                }

                return Ok(ContentSearch);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpPost("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch(ContentAdvancedSearchPost AdvancedSearch)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            AdvancedSearch.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _ContentProvider.CreatePostCheck(Content);
                //if (CheckString.Length == 0)
                //{
                if (AdvancedSearch.Contains == null)
                { AdvancedSearch.Contains = ""; }
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

                foreach (var x in AdvancedSearch.Classifications)
                {
                    if (x.ClassificationValueId == null)
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
                Message = "No rights",
            });
        }

        [HttpGet("RightsUpdate/{Id:int}")]
        public async Task<IActionResult> RightsUpdate(int Id)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {

                var FrontContentShowContentRights = await _frontContentProvider.RightsUpdateGet( Id);
                if (FrontContentShowContentRights.OwnerId != CurrentUser.Id)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No rights",
                    });

                }

                FrontContentShowContentRights.Owners = await _frontContentProvider.RightsUpdateGetOwners(CurrentUser.Id, FrontContentShowContentRights.IsRelationBasedOwnership, FrontContentShowContentRights.IsProjectBasedOwnership, FrontContentShowContentRights.IsOrganizationBasedOwnership, FrontContentShowContentRights.IsFreeOwnership);
                return Ok(FrontContentShowContentRights);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("RightsUpdate")]
        public async Task<IActionResult> RightsUpdate(FrontContentRightsUpdateGet FrontContentRights)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            FrontContentRights.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _frontContentProvider.RightsUpdatePostCheck(FrontContentRights);
                if (ErrorMessages.Count == 0)
                {
                    _frontContentProvider.RightsUpdatePost(FrontContentRights);
                }
                FrontContentRightsUpdateGetWithErrorMessages FrontContentRightsUpdateGetWithErrorMessage = new FrontContentRightsUpdateGetWithErrorMessages { FrontContentRights = FrontContentRights, ErrorMessages = ErrorMessages };
                return Ok(FrontContentRightsUpdateGetWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            FrontContentRightsUpdateGetWithErrorMessages FrontContentRightsUpdateGetWithNoRights = new FrontContentRightsUpdateGetWithErrorMessages { FrontContentRights = FrontContentRights, ErrorMessages = ErrorMessages };
            return Ok(FrontContentRightsUpdateGetWithNoRights);
        }

        [HttpGet("RightsEditUserCreate/{Id:int}")]
        public async Task<IActionResult> RightsEditUserCreate(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var FrontContentRightsEditUser = new FrontContentRightsEditUserCreateGet();
                FrontContentRightsEditUser.UserId = CurrentUser.Id;
                FrontContentRightsEditUser.ContentId= Id;

                FrontContentRightsEditUser = await FrontContentRightsEditUserCreateAddDropDownBoxes(FrontContentRightsEditUser);
                return Ok(FrontContentRightsEditUser);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("RightsEditUserCreate")]
        public async Task<IActionResult> RightsEditUserCreate(FrontContentRightsEditUserCreateGet FrontContentRightsEditUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            FrontContentRightsEditUser.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _frontContentProvider.RightsEditUserCreatePostCheck(FrontContentRightsEditUser);
                if (ErrorMessages.Count > 0)
                {
                    FrontContentRightsEditUser = await FrontContentRightsEditUserCreateAddDropDownBoxes(FrontContentRightsEditUser);
                }
                else
                {
                    _frontContentProvider.RightsEditUserCreatePost(FrontContentRightsEditUser);
                }
                FrontContentRightsEditUserCreateGetWithErrorMessages FrontContentRightsEditUserWithErrorMessage = new FrontContentRightsEditUserCreateGetWithErrorMessages { FrontContentRightsEditUser = FrontContentRightsEditUser, ErrorMessages = ErrorMessages };
                return Ok(FrontContentRightsEditUserWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            FrontContentRightsEditUserCreateGetWithErrorMessages FrontContentRightsEditUserWithNoRights = new FrontContentRightsEditUserCreateGetWithErrorMessages { FrontContentRightsEditUser = FrontContentRightsEditUser, ErrorMessages = ErrorMessages };
            return Ok(FrontContentRightsEditUserWithNoRights);
        }

        [HttpGet("RightsEditUserIndex/{Id:int}")]
        public async Task<IActionResult> RightsEditUserIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _frontContentProvider.RightsEditUserIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpGet("RightsEditUserDelete/{Id:int}")]
        public async Task<IActionResult> RightsEditUserDelete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ContentUserEdit", "ContentUserEditId", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _frontContentProvider.RightsEditUserDeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("RightsEditUserDelete")]
        public async Task<IActionResult> RightsEditUserDelete(FrontContentRightsEditUserDeleteGet FrontContentRightsEditUser)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                FrontContentRightsEditUser.UserId = CurrentUser.Id;
                //var CheckString = await _FrontContentRightsEditUserProvider.DeletePostCheck(FrontContentRightsEditUser);
                //if (CheckString.Length == 0)
                //{
                _frontContentProvider.RightsEditUserDeletePost(FrontContentRightsEditUser.ContentUserEditId);
                return Ok(FrontContentRightsEditUser);
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