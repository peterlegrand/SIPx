using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using SIPx.API.Classes;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class FrontOrganizationController : ControllerBase
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IOrganizationAddressProvider _organizationAddressProvider;
        private readonly IOrganizationTelecomProvider _organizationTelecomProvider;
        private readonly IPersonProvider _personProvider;
        private readonly IOrganizationTypeProvider _organizationTypeProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IFrontOrganizationProvider _frontOrganizationProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontOrganizationController (IHostingEnvironment hostingEnvironment, IOrganizationAddressProvider organizationAddressProvider
            , IOrganizationTelecomProvider organizationTelecomProvider
            , IPersonProvider personProvider
            , IOrganizationTypeProvider organizationTypeProvider
            , IOrganizationProvider organizationProvider
            , IFrontOrganizationProvider frontOrganizationProvider
            , IMasterProvider masterProvider
            , IMasterListProvider masterListProvider
            , ICheckProvider checkProvider
            , IClaimCheck claimCheck
            , IClassificationProvider classificationProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _hostingEnvironment = hostingEnvironment;
            _organizationAddressProvider = organizationAddressProvider;
            _organizationTelecomProvider = organizationTelecomProvider;
            _personProvider = personProvider;
            _organizationTypeProvider = organizationTypeProvider;
            _organizationProvider = organizationProvider;
            _frontOrganizationProvider = frontOrganizationProvider;
            _masterProvider = masterProvider;
            _masterListProvider = masterListProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("Dashboard/{Id:int}")]
        public async Task<IActionResult> Dashboard(int Id)
        {
            SIPUserManager SIPUser = new SIPUserManager(_hostingEnvironment, _userManager);
            var CurrentUser = await SIPUser.GetUser(User);
//            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var Organization = new FrontOrganizationDashboard();
                Organization =  await _frontOrganizationProvider.Dashboard(CurrentUser.Id, Id);
                var subOrganization = await _frontOrganizationProvider.DashboardSubOrganization(CurrentUser.Id, Id);
                var Content = await _frontOrganizationProvider.DashboardContent(CurrentUser.Id, Id);
                var Process = await _frontOrganizationProvider.DashboardProcess(CurrentUser.Id, Id);
                var PersonRoles = await _frontOrganizationProvider.DashboardPersonRoles(CurrentUser.Id, Id);
                var PersonPositions = await _frontOrganizationProvider.DashboardPersonPositions(CurrentUser.Id, Id);
                var Address = await _frontOrganizationProvider.DashboardAddress(CurrentUser.Id, Id);
                var Telecom = await _frontOrganizationProvider.DashboardTelecom(CurrentUser.Id, Id);
                Organization.SubOrganizations = subOrganization;
                Organization.Contents = Content;
                Organization.Processes= Process;
                Organization.PersonRoles = PersonRoles;
                Organization.PersonPositions = PersonPositions;
                Organization.Addresses= Address;
                Organization.Telecoms = Telecom;
                //      var x= await _frontOrganizationProvider.IndexGetSubOrganizationTree(CurrentUser.Id, Id);
                //    Organization.SubOrganizationTree = JObject.Parse(x);

                return Ok(Organization);
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
                if (await _checkProvider.CheckIfRecordExists("Classifications", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                //PETER TODO this is organization why is tehre classification here?
                var x = await _classificationProvider.UpdateGet(CurrentUser.Id, Id);
                var u = await _classificationProvider.CreateGetSequence(CurrentUser.Id);
                var z = await _masterListProvider.StatusList(CurrentUser.Id);
                var icons = await _masterListProvider.IconList(CurrentUser.Id);
                x.Icons = icons;

                x.DropDownSequences = u;
                x.Statuses = z;
                return Ok(x);
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
                var OrganizationAdvancedSearch = new OrganizationAdvancedSearchPost();
                OrganizationAdvancedSearch.ParentOrganizations = await _organizationProvider.List(CurrentUser.Id);
                OrganizationAdvancedSearch.Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
                OrganizationAdvancedSearch.OrganizationTypes = await _organizationTypeProvider.List(CurrentUser.Id);
                OrganizationAdvancedSearch.Persons =await _personProvider.List();
//                OrganizationAdvancedSearch = await _organizationProvider.FrontOrganizationAdvancedSearchGet(CurrentUser.Id);
                return Ok(OrganizationAdvancedSearch);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch(OrganizationAdvancedSearchPost SearchData)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                SearchData.UserId= CurrentUser.Id;
                //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                if (SearchData.Contains == null)
                { SearchData.Contains = ""; }
                var SearchResult = await _organizationProvider.AdvancedSearch(SearchData);
                return Ok(SearchResult);
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

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationUpdateGet Classification)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Classification.UserId= CurrentUser.Id;
                //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _classificationProvider.UpdatePost(Classification);
                return Ok(Classification);
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
                if (await _checkProvider.CheckIfRecordExists("Classifications", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationDeleteGet Classification)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Classification.UserId= CurrentUser.Id;
                //var CheckString = await _classificationProvider.DeletePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _classificationProvider.DeletePost(CurrentUser.Id, Classification.ClassificationId);
                return Ok(Classification);
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

        [HttpPost("LanguageCreate")]
        public async Task<IActionResult> LanguageCreate(ObjectLanguageCreatePost Classification)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Classification.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var CheckString = await _masterProvider.PostObjectLanguageCheck("CLassification", Classification.LanguageId, Classification.ObjectId);
                if (CheckString)
                {
                    Classification.TableName = "Classification";
                    _masterProvider.PostObjectLanguage(Classification);
                    return Ok(Classification);
                }
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = CheckString,
                });

            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpGet("LanguageCreate/{Id:int}")]
        public async Task<IActionResult> LanguageCreate(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationCreateGet = new ObjectLanguageCreateGet();
                ClassificationCreateGet.ObjectId = Id;
                var LanguageList = await _classificationProvider.LangugageCreateGetLanguageList(CurrentUser.Id, Id);
                if (LanguageList.Count == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No active languages",
                    });
                }
                ClassificationCreateGet.Languages = LanguageList;
                return Ok(ClassificationCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> LanguageIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationLanguages", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.LanguageIndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("LanguageUpdate/{Id:int}")]
        public async Task<IActionResult> LanguageUpdate(int Id)
        {
            if (await _checkProvider.CheckIfRecordExists("ClassificationLanguages", "ClassificationLanguageID", Id) == 0)
            {
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = "No record with this ID",
                });
            }

            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  
            {
                return Ok(await _classificationProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var OrganizationCreateGet = new OrganizationCreateGet();
                string ParentOrganizationName = "No parent";
                if (Id != 0)
                {
                    ParentOrganizationName = await _organizationProvider.GetOrganizationName(CurrentUser.Id, Id);
                }
//PETER TODO                Have to do something with "No parent"
                var Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
                var OrganizationTypes = await _organizationTypeProvider.ListExternal(CurrentUser.Id);
                if(OrganizationTypes.Count==0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No types",
                    });
                    //PETER TODO the receiving API should do something with this instead of redirecting

                }
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                OrganizationCreateGet.LanguageId = UserLanguage.LanguageId;
                OrganizationCreateGet.ParentOrganizationName = ParentOrganizationName;
                OrganizationCreateGet.LanguageName = UserLanguage.Name;
                OrganizationCreateGet.OrganizationTypes = OrganizationTypes;
                OrganizationCreateGet.Statuses = Statuses;
                OrganizationCreateGet.ParentOrganizationId = Id;
                return Ok(OrganizationCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Post(OrganizationCreateGet Organization)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Organization.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var CheckString = await _organizationProvider.CreatePostCheck(Organization);
                if (CheckString.Count == 0)
                {
                    _organizationProvider.CreatePost(Organization);
                    return Ok(Organization);
                }
                return BadRequest(new
                {
                    IsSuccess = false,
                    Message = CheckString,
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