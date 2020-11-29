using System;
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
    public class ClassificationValueController : ControllerBase
    {
        private readonly IPersonProvider _personProvider;
        private readonly IDateLevelProvider _dateLevelProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationValueController(IPersonProvider personProvider, IDateLevelProvider dateLevelProvider, IMasterListProvider masterListProvider, IClassificationValueProvider classificationValueProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _personProvider = personProvider;
            _dateLevelProvider = dateLevelProvider;
            _masterListProvider = masterListProvider;
            _classificationValueProvider = classificationValueProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id, [FromQuery(Name = "ParentId")] int ParentId =0)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ClassificationValueCreateGet = new ClassificationValueCreateGet();
                var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                var DateLevel = await _classificationValueProvider.CreateGetDateLevel(Id, ParentId);
                ClassificationValueCreateGet.LanguageId = UserLanguage.LanguageId;
                ClassificationValueCreateGet.LanguageName = UserLanguage.Name;
                ClassificationValueCreateGet.ClassificationId = Id;
                ClassificationValueCreateGet.ParentId = ParentId;
                ClassificationValueCreateGet.DateLevel = DateLevel;
                ClassificationValueCreateGet.DateFrom = DateTime.Now;
                ClassificationValueCreateGet.DateTo = DateTime.Now;
                return Ok(ClassificationValueCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationValueCreatePost ClassificationValue)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationValue.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _classificationValueProvider.CreatePostCheck(ClassificationValue);
                //if (CheckString.Length == 0)
                //{
                if (ClassificationValue.DateFrom == Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    ClassificationValue.DateFrom = null;
                }
                if (ClassificationValue.DateTo == Convert.ToDateTime("1/1/0001 12:00:00 AM"))
                {
                    ClassificationValue.DateTo = null;
                }
                await _classificationValueProvider.CreatePost(ClassificationValue);
                    return Ok(ClassificationValue);
                //}
                return BadRequest(new
                {
                    IsSuccess = false,
                   // Message = CheckString,
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "6"))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationValues", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}
                var x = await _classificationValueProvider.IndexGet(CurrentUser.Id, Id);
                return Ok(x);
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationValues", "ClassificationValueID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationValueProvider.UpdateGet(CurrentUser.Id, Id);
                var z = await _masterListProvider.StatusList(CurrentUser.Id);

                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationValueUpdateGet ClassificationValue)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationValue.UserId = CurrentUser.Id;
                //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _classificationValueProvider.UpdatePost(ClassificationValue);
                return Ok(ClassificationValue);
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationValues", "ClassificationValueID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationValueProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationValueDeleteGet ClassificationValue)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationValue.CreatorId = CurrentUser.Id;
                //var CheckString = await _ClassificationValueProvider.DeletePostCheck(ClassificationValue);
                //if (CheckString.Length == 0)
                //{
                _classificationValueProvider.DeletePost(ClassificationValue.ClassificationValueId);
                return Ok(ClassificationValue);
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
        public async Task<IActionResult> LanguagesIndex(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "16"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueLanguages", "ClassificationValueID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }


                return Ok(await _classificationValueProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueLanguages", "ClassificationValueLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationValueProvider.LanguageUpdateGet(CurrentUser.Id, Id));
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var ClassificationValueSearch = new ClassificationValueAdvancedSearchPost();
                ClassificationValueSearch.DateLevels = await _dateLevelProvider.List(CurrentUser.Id);
                ClassificationValueSearch.Classifications = await _classificationProvider.List(CurrentUser.Id);
                ClassificationValueSearch.Persons = await _personProvider.List();
                return Ok(ClassificationValueSearch);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }


        [HttpPost("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch(ClassificationValueAdvancedSearchPost AdvancedSearch)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            AdvancedSearch.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _ClassificationValueProvider.CreatePostCheck(ClassificationValue);
                //if (CheckString.Length == 0)
                //{
                if (AdvancedSearch.Contains == null)
                { AdvancedSearch.Contains = ""; }
                if (AdvancedSearch.ClassificationId == null)
                { AdvancedSearch.ClassificationId = 0; }
                if (AdvancedSearch.DateLevelId == null)
                { AdvancedSearch.DateLevelId = 1; }
                if (AdvancedSearch.PersonId == null)
                { AdvancedSearch.PersonId = 0; }
                var Result = await _classificationValueProvider.AdvancedSearch(CurrentUser.Id, AdvancedSearch);
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
    }
}