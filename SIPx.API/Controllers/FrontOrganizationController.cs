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
    public class FrontOrganizationController : ControllerBase
    {
        private readonly IPersonProvider _personProvider;
        private readonly IOrganizationTypeProvider _organizationTypeProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IFrontOrganizationProvider _frontOrganizationProvider;
        private readonly IClassificationPageProvider _classificationPageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontOrganizationController (IPersonProvider personProvider, IOrganizationTypeProvider organizationTypeProvider, IOrganizationProvider organizationProvider, IFrontOrganizationProvider frontOrganizationProvider, IClassificationPageProvider classificationPageProvider, IMasterProvider masterProvider, IMasterListProvider masterListProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _personProvider = personProvider;
            _organizationTypeProvider = organizationTypeProvider;
            _organizationProvider = organizationProvider;
            _frontOrganizationProvider = frontOrganizationProvider;
            _classificationPageProvider = classificationPageProvider;
            _masterProvider = masterProvider;
            _masterListProvider = masterListProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "188"))
            {
                var Organization = new FrontOrganizationIndexGet();
                Organization =  await _frontOrganizationProvider.IndexGet(CurrentUser.Id, Id);
                var subOrganization = await _frontOrganizationProvider.IndexGetSubOrganization(CurrentUser.Id, Id);
                var Content = await _frontOrganizationProvider.IndexGetContent(CurrentUser.Id, Id);
                var Process = await _frontOrganizationProvider.IndexGetProcess(CurrentUser.Id, Id);
                var Member = await _frontOrganizationProvider.IndexGetMember(CurrentUser.Id, Id);
                Organization.SubOrganizations = subOrganization;
                Organization.Contents = Content;
                Organization.Processes= Process;
                Organization.Members = Member;
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                if (await _checkProvider.CheckIfRecordExists("Classifications", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationProvider.UpdateGet(CurrentUser.Id, Id);
                var y = await _classificationPageProvider.List(CurrentUser.Id, Id);
                var u = await _classificationProvider.CreateGetSequence(CurrentUser.Id);
                var z = await _masterListProvider.StatusList(CurrentUser.Id);
                var icons = await _masterListProvider.IconList(CurrentUser.Id);
                x.Icons = icons;

                x.DropDownSequences = u;
                x.DefaultPages = y;
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                Classification.CreatorId = CurrentUser.Id;
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                Classification.CreatorId = CurrentUser.Id;
                //var CheckString = await _classificationProvider.DeletePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _classificationProvider.DeletePost(Classification.ClassificationId);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "193"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "193"))  
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var OrganizationCreateGet = new OrganizationCreateGet();
                var Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
                var OrganizationTypes = await _organizationTypeProvider.List(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                OrganizationCreateGet.LanguageId = UserLanguage.LanguageId;
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
        public async Task<IActionResult> Post(OrganizationCreatePost Organization)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Organization.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _organizationProvider.CreatePostCheck(Organization);
                if (CheckString.Length == 0)
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