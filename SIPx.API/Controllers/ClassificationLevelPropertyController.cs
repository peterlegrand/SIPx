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
    public class ClassificationLevelPropertyController : ControllerBase
    {
        private readonly IClassificationLevelPropertyStatusProvider _classificationLevelPropertyStatusProvider;
        private readonly IClassificationLevelPropertyProvider _classificationLevelPropertyProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationLevelPropertyController(IClassificationLevelPropertyStatusProvider classificationLevelPropertyStatusProvider, IClassificationLevelPropertyProvider classificationLevelPropertyProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _classificationLevelPropertyStatusProvider = classificationLevelPropertyStatusProvider;
            _classificationLevelPropertyProvider = classificationLevelPropertyProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _userManager = userManager;
        }

        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ClassificationLevelPropertyCreateGet = await _classificationLevelPropertyProvider.CreateGet(CurrentUser.Id, Id);
                var Properties = await _classificationLevelPropertyProvider.CreateGetPropertyList(CurrentUser.Id, Id);
                ClassificationLevelPropertyCreateGet.Properties = Properties;
                ClassificationLevelPropertyCreateGet.ClassificationLevelPropertyStatuses = await _classificationLevelPropertyStatusProvider.List(CurrentUser.Id);
                return Ok(ClassificationLevelPropertyCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationLevelPropertyCreateGet ClassificationLevelProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationLevelProperty.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _classificationLevelPropertyProvider.CreatePostCheck(ClassificationLevelProperty);
                //if (CheckString.Length == 0)
                //{
                _classificationLevelPropertyProvider.CreatePost(ClassificationLevelProperty);
                return Ok(ClassificationLevelProperty);
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
                //if (await _checkProvider.CheckIfRecordExists("ClassificationLevelPropertys", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}


                return Ok(await _classificationLevelPropertyProvider.IndexGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationLevelPropertyUpdateGet ClassificationLevelProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationLevelProperty.UserId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _classificationLevelPropertyProvider.UpdatePostCheck(ClassificationLevelProperty);
                //if (CheckString.Length == 0)
                //{
                ClassificationLevelProperty.UserId = CurrentUser.Id;
                    _classificationLevelPropertyProvider.UpdatePost(ClassificationLevelProperty);
                    return Ok(ClassificationLevelProperty);
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

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Update(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationLevelProperties", "ClassificationLevelPropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var classificationLevelProperty = await _classificationLevelPropertyProvider.UpdateGet(CurrentUser.Id, Id);
                classificationLevelProperty.ClassificationLevelPropertyStatuses = await _classificationLevelPropertyStatusProvider.List(CurrentUser.Id);

                return Ok(classificationLevelProperty);
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationLevelProperties", "ClassificationLevelPropertyID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationLevelPropertyProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationLevelPropertyDeleteGet ClassificationLevelProperty)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationLevelProperty.UserId= CurrentUser.Id;
                //var CheckString = await _ClassificationLevelPropertyProvider.DeletePostCheck(ClassificationLevelProperty);
                //if (CheckString.Length == 0)
                //{
                _classificationLevelPropertyProvider.DeletePost(ClassificationLevelProperty.ClassificationLevelPropertyId);
                return Ok(ClassificationLevelProperty);
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
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "16"))
        //    {
        //        if (await _checkProvider.CheckIfRecordExists("ClassificationLevelPropertyLanguages", "ClassificationLevelPropertyID", Id) == 0)
        //        {
        //            return BadRequest(new
        //            {
        //                IsSuccess = false,
        //                Message = "No record with this ID",
        //            });
        //        }


        //        return Ok(await _classificationLevelPropertyProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
        //    if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "16"))
        //    {
        //        if (await _checkProvider.CheckIfRecordExists("ClassificationLevelPropertyLanguages", "ClassificationLevelPropertyLanguageID", Id) == 0)
        //        {
        //            return BadRequest(new
        //            {
        //                IsSuccess = false,
        //                Message = "No record with this ID",
        //            });
        //        }

        //        return Ok(await _classificationLevelPropertyProvider.LanguageUpdateGet(CurrentUser.Id, Id));
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}
    }
}