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
        private readonly IMasterListProvider _masterListProvider;
        private readonly IClassificationLevelProvider _classificationLevelProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationLevelController(IMasterListProvider masterListProvider, IClassificationLevelProvider classificationLevelProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterListProvider = masterListProvider;
            _classificationLevelProvider = classificationLevelProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ClassificationLevelCreateGet = new ClassificationLevelCreateGet();
                var ClassificationLevelCreateGetSequences = await _classificationLevelProvider.CreateGetSequence(CurrentUser.Id, Id);
                var DateLevels = await _masterListProvider.DateLevelList(CurrentUser.Id);
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                ClassificationLevelCreateGetSequences.Add(new SequenceList { Sequence = ClassificationLevelCreateGetSequences.Count, Name = "Add at the end" });
                ClassificationLevelCreateGet.LanguageId = UserLanguage.LanguageId;
                ClassificationLevelCreateGet.LanguageName = UserLanguage.Name;
                ClassificationLevelCreateGet.DateLevels = DateLevels;
                ClassificationLevelCreateGet.Sequences = ClassificationLevelCreateGetSequences;
                ClassificationLevelCreateGet.ClassificationId = Id;
                return Ok(ClassificationLevelCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationLevelCreatePost ClassificationLevel)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationLevel.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _classificationLevelProvider.CreatePostCheck(ClassificationLevel);
                //if (CheckString.Length == 0)
                //{
                    _classificationLevelProvider.CreatePost(ClassificationLevel);
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

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationLevelUpdateGet ClassificationLevel)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationLevel.ModifierId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _classificationLevelProvider.UpdatePostCheck(ClassificationLevel);
                //if (CheckString.Length == 0)
                //{
                    _classificationLevelProvider.UpdatePost(ClassificationLevel);
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


        [HttpGet("Index/{Id:int}")]
        public async Task<IActionResult> Index(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationLevels", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }


                return Ok(await _classificationLevelProvider.IndexGet(CurrentUser.Id, Id));
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationLevels", "ClassificationLevelID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var classificationLevel = await _classificationLevelProvider.UpdateGet(CurrentUser.Id, Id);
                classificationLevel.DateLevels = await _masterListProvider.DateLevelList(CurrentUser.Id);
                classificationLevel.Sequences = await _classificationLevelProvider.CreateGetSequence(CurrentUser.Id, classificationLevel.ClassificationId);
                return Ok(classificationLevel);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationLevel.CreatorId = CurrentUser.Id;
                //var CheckString = await _ClassificationLevelProvider.DeletePostCheck(ClassificationLevel);
                //if (CheckString.Length == 0)
                //{
                _classificationLevelProvider.DeletePost(ClassificationLevel.ClassificationLevelId);
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
        public async Task<IActionResult> lLanguageIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "16"))
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "16"))
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