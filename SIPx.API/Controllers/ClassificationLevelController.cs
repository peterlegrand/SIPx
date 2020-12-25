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
    public class ClassificationLevelController : ControllerBase
    {
        private readonly IDateLevelProvider _dateLevelProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IClassificationLevelProvider _classificationLevelProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationLevelController(IDateLevelProvider dateLevelProvider, IMasterListProvider masterListProvider, IClassificationLevelProvider classificationLevelProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _dateLevelProvider = dateLevelProvider;
            _masterListProvider = masterListProvider;
            _classificationLevelProvider = classificationLevelProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        private async Task<ClassificationLevelCreateGet> CreateAddDropDownBoxes(ClassificationLevelCreateGet ClassificationLevel, string UserId, int ClassificationId)
        {
            var ClassificationLevelCreateGetSequences = await _classificationLevelProvider.CreateGetSequence(UserId, ClassificationId);
            var DateLevels = await _dateLevelProvider.List(UserId);
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ClassificationLevelCreateGetSequences.Add(new SequenceList { Sequence = ClassificationLevelCreateGetSequences.Count + 1, Name = "Add at the end" });
            ClassificationLevel.LanguageId = UserLanguage.LanguageId;
            ClassificationLevel.LanguageName = UserLanguage.Name;
            ClassificationLevel.DateLevels = DateLevels;
            ClassificationLevel.Sequences = ClassificationLevelCreateGetSequences;
            ClassificationLevel.ClassificationId = ClassificationId;
            return ClassificationLevel;
        }

        private async Task<ClassificationLevelUpdateGet> UpdateAddDropDownBoxes(ClassificationLevelUpdateGet ClassificationLevel, string UserId)
        {
            ClassificationLevel.DateLevels = await _dateLevelProvider.List(UserId);
            ClassificationLevel.Sequences = await _classificationLevelProvider.CreateGetSequence(UserId, ClassificationLevel.ClassificationId);
            return ClassificationLevel;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationLevel = new ClassificationLevelCreateGet();
                ClassificationLevel = await CreateAddDropDownBoxes(ClassificationLevel, CurrentUser.Id, Id);
                return Ok(ClassificationLevel);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationLevelCreateGet ClassificationLevel)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationLevel.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationLevelProvider.CreatePostCheck(ClassificationLevel);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationLevel = await CreateAddDropDownBoxes(ClassificationLevel, CurrentUser.Id, ClassificationLevel.ClassificationId);
                }
                else
                {
                    _classificationLevelProvider.CreatePost(ClassificationLevel);
                }
                ClassificationLevelCreateGetWithErrorMessages ClassificationLevelWithErrorMessage = new ClassificationLevelCreateGetWithErrorMessages { ClassificationLevel = ClassificationLevel, ErrorMessages = ErrorMessages };
                return Ok(ClassificationLevelWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationLevelCreateGetWithErrorMessages ClassificationLevelWithNoRights = new ClassificationLevelCreateGetWithErrorMessages { ClassificationLevel = ClassificationLevel, ErrorMessages = ErrorMessages };
            return Ok(ClassificationLevelWithNoRights);
        }

        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {

                return Ok(await _classificationLevelProvider.IndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationLevelUpdateGet ClassificationLevel)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationLevel.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationLevelProvider.UpdatePostCheck(ClassificationLevel);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationLevel = await UpdateAddDropDownBoxes(ClassificationLevel, CurrentUser.Id);
                }
                else
                {
                    _classificationLevelProvider.UpdatePost(ClassificationLevel);
                }
                ClassificationLevelUpdateGetWithErrorMessages ClassificationLevelWithErrorMessage = new ClassificationLevelUpdateGetWithErrorMessages { ClassificationLevel = ClassificationLevel, ErrorMessages = ErrorMessages };
                return Ok(ClassificationLevelWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationLevelUpdateGetWithErrorMessages ClassificationLevelWithNoRights = new ClassificationLevelUpdateGetWithErrorMessages { ClassificationLevel = ClassificationLevel, ErrorMessages = ErrorMessages };
            return Ok(ClassificationLevelWithNoRights);
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationLevels", "ClassificationLevelID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var ClassificationLevel = await _classificationLevelProvider.UpdateGet(CurrentUser.Id, Id);
                ClassificationLevel = await UpdateAddDropDownBoxes(ClassificationLevel, CurrentUser.Id);
                return Ok(ClassificationLevel);
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationLevels", "ClassificationLevelID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationLevelProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationLevelDeleteGet ClassificationLevel)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ClassificationLevel.UserId = CurrentUser.Id;
                //var CheckString = await _ClassificationLevelProvider.DeletePostCheck(ClassificationLevel);
                //if (CheckString.Length == 0)
                //{
                _classificationLevelProvider.DeletePost(CurrentUser.Id, ClassificationLevel.ClassificationLevelId);
                return Ok(ClassificationLevel);
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

        [HttpGet("LanguageIndex/{Id:int}")]
        public async Task<IActionResult> LanguageIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationLevelLanguages", "ClassificationLevelID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }


                return Ok(await _classificationLevelProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationLevelLanguages", "ClassificationLevelLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationLevelProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}