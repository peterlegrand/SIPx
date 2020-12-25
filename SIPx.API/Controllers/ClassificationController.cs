using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class ClassificationController : ControllerBase
    {
        private readonly IMasterProvider _masterProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly ICheckProvider _checkProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationController( IMasterProvider masterProvider, IMasterListProvider masterListProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterProvider = masterProvider;
            _masterListProvider = masterListProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        private async Task<ClassificationCreateGet> CreateAddDropDownBoxes(ClassificationCreateGet Classification, string UserId)
        {
            var ClassificationCreateGetSequences = await _classificationProvider.CreateGetSequence(UserId);
            var Statuses = await _masterListProvider.StatusList(UserId);
            var icons = await _masterListProvider.IconList(UserId); 
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            Classification.LanguageId = UserLanguage.LanguageId;
            Classification.LanguageName = UserLanguage.Name;
            Classification.Icons = icons;
            Classification.Statuses = Statuses;
            Classification.Sequences = ClassificationCreateGetSequences;
            Classification.Sequences.Add(new SequenceList { Sequence = ClassificationCreateGetSequences.Count + 1, Name = "Add at the end" });
            return Classification;
        }

        private async Task<ClassificationUpdateGet> UpdateAddDropDownBoxes(ClassificationUpdateGet Classification, string UserId)
        {
            Classification = await _classificationProvider.UpdateGet(UserId, Classification.ClassificationId);
            var Sequences = await _classificationProvider.CreateGetSequence(UserId);
            var Statuses = await _masterListProvider.StatusList(UserId);
            var icons = await _masterListProvider.IconList(UserId);
            Classification.Icons = icons;

            Classification.DropDownSequences = Sequences;
          //  Classification.DefaultPages = Pages;
            Classification.Statuses = Statuses;
            return Classification;
        }


        [HttpGet("Create")]
        public async Task<IActionResult> Create()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var Classification = new ClassificationCreateGet();
                Classification = await CreateAddDropDownBoxes(Classification, CurrentUser.Id);
                return Ok(Classification);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationCreateGet Classification)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            Classification.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationProvider.CreatePostCheck(Classification);
                if(ErrorMessages.Count>0)
                {
                    Classification = await CreateAddDropDownBoxes(Classification, CurrentUser.Id);     }
                else
                { 
                _classificationProvider.CreatePost(Classification);
                }
                ClassificationCreateGetWithErrorMessages ClassificationWithErrorMessage = new ClassificationCreateGetWithErrorMessages { Classification = Classification, ErrorMessages = ErrorMessages };
                return Ok(ClassificationWithErrorMessage);              
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationCreateGetWithErrorMessages ClassificationWithNoRights = new ClassificationCreateGetWithErrorMessages { Classification = Classification, ErrorMessages = ErrorMessages };
            return Ok(ClassificationWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                return Ok(await _classificationProvider.IndexGet(CurrentUser.Id));
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("Classifications", "ClassificationID", Id) == 0)
                {
                    //PETER TODO see if this is the best way
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var Classification = await _classificationProvider.UpdateGet(CurrentUser.Id, Id);
                Classification = await UpdateAddDropDownBoxes(Classification, CurrentUser.Id);
                return Ok(Classification);
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
            Classification.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationProvider.UpdatePostCheck(Classification);
                if (ErrorMessages.Count > 0)
                {
                    Classification = await UpdateAddDropDownBoxes(Classification, CurrentUser.Id);
                }
                else
                {
                    _classificationProvider.UpdatePost(Classification);
                }
                ClassificationUpdateGetWithErrorMessages ClassificationWithErrorMessage = new ClassificationUpdateGetWithErrorMessages { Classification = Classification, ErrorMessages = ErrorMessages };
                return Ok(ClassificationWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationUpdateGetWithErrorMessages ClassificationWithNoRights = new ClassificationUpdateGetWithErrorMessages { Classification = Classification, ErrorMessages = ErrorMessages };
            return Ok(ClassificationWithNoRights);
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString()+"\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  
            {
                return Ok(await _classificationProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}