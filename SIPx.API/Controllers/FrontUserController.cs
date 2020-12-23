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
    public class FrontUserController : ControllerBase
    {
        private readonly IFrontUserProvider _frontUserProvider;
        private readonly IClassificationPageProvider _classificationPageProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontUserController( IFrontUserProvider frontUserProvider, IClassificationPageProvider classificationPageProvider, IMasterProvider masterProvider, IMasterListProvider masterListProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _frontUserProvider = frontUserProvider;
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
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var User = new FrontUserIndexGet();
                User =  await _frontUserProvider.IndexGet(CurrentUser.Id, Id);
                var Address = await _frontUserProvider.IndexGetAddress(CurrentUser.Id, Id);
                var Telecom = await _frontUserProvider.IndexGetTelecom(CurrentUser.Id, Id);
                var Project = await _frontUserProvider.IndexGetProject(CurrentUser.Id, Id);
                var Organization = await _frontUserProvider.IndexGetOrganization(CurrentUser.Id, Id);
                var Content = await _frontUserProvider.IndexGetContent(CurrentUser.Id, Id);
                var Process = await _frontUserProvider.IndexGetProcess(CurrentUser.Id, Id);
//Relations                var Member = await _frontUserProvider.IndexGetMember(CurrentUser.Id, Id);
                User.Addresses= Address;
                User.Telecoms = Telecom;
                User.Projects= Project;
                User.Organizations = Organization;
                User.Processes= Process;
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

        //[HttpGet("Create/{Id:int}")]
        //public async Task<IActionResult> Create(int Id)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //                if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        var UserCreateGet = new UserCreateGet();
        //        var Statuses = await _masterListProvider.StatusList(CurrentUser.Id);
        //        var UserTypes = await _organizationTypeProvider.List(CurrentUser.Id);
        //        var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
        //        UserCreateGet.LanguageId = UserLanguage.LanguageId;
        //        UserCreateGet.LanguageName = UserLanguage.Name;
        //        UserCreateGet.UserTypes = UserTypes;
        //        UserCreateGet.Statuses = Statuses;
        //        UserCreateGet.ParentUserId = Id;
        //        return Ok(UserCreateGet);
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}
        //[HttpPost("Create")]
        //public async Task<IActionResult> Post(UserCreatePost User)
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //    User.CreatorId = CurrentUser.Id;
        //                if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
        //    {
        //        var CheckString = await _organizationProvider.CreatePostCheck(User);
        //        if (CheckString.Length == 0)
        //        {
        //            _organizationProvider.CreatePost(User);
        //            return Ok(User);
        //        }
        //        return BadRequest(new
        //        {
        //            IsSuccess = false,
        //            Message = CheckString,
        //        });
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}
    }
}