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
    public class ClassificationRelationTypeController : ControllerBase
    {
        private readonly IClassificationRelationTypeProvider _classificationRelationTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationRelationTypeController(IClassificationRelationTypeProvider classificationRelationTypeProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _classificationRelationTypeProvider = classificationRelationTypeProvider;
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }
        private async Task<ClassificationRelationTypeUpdateGet> UpdateAddDropDownBoxes(ClassificationRelationTypeUpdateGet ClassificationRelationType, string UserId)
        {
            //PETER At the moment not used as there is nothing to load on update
            return ClassificationRelationType;
        }
        private async Task<ClassificationRelationTypeCreateGet> CreateAddDropDownBoxes(ClassificationRelationTypeCreateGet ClassificationRelationType, string UserId)
        {
            var UserLanguage = await _masterProvider.UserLanguageUpdateGet(UserId);
            ClassificationRelationType.LanguageId = UserLanguage.LanguageId;
            ClassificationRelationType.LanguageName = UserLanguage.Name;
            return ClassificationRelationType;
        }

        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ClassificationRelationType = new ClassificationRelationTypeCreateGet();
                ClassificationRelationType = await CreateAddDropDownBoxes(ClassificationRelationType, CurrentUser.Id);
                return Ok(ClassificationRelationType);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationRelationTypeCreateGet ClassificationRelationType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationRelationType.UserId = CurrentUser.Id;
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationRelationTypeProvider.CreatePostCheck(ClassificationRelationType);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationRelationType = await CreateAddDropDownBoxes(ClassificationRelationType, CurrentUser.Id);
                }
                else
                {
                    _classificationRelationTypeProvider.CreatePost(ClassificationRelationType);
                }
                ClassificationRelationTypeCreateGetWithErrorMessages ClassificationRelationTypeWithErrorMessage = new ClassificationRelationTypeCreateGetWithErrorMessages { ClassificationRelationType = ClassificationRelationType, ErrorMessages = ErrorMessages };
                return Ok(ClassificationRelationTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationRelationTypeCreateGetWithErrorMessages ClassificationRelationTypeWithNoRights = new ClassificationRelationTypeCreateGetWithErrorMessages { ClassificationRelationType = ClassificationRelationType, ErrorMessages = ErrorMessages };
            return Ok(ClassificationRelationTypeWithNoRights);
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index() //int Id) PETER CHECK it had this Id but I think no need
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationRelationTypes", "ClassificationRelationTypeID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                return Ok(await _classificationRelationTypeProvider.IndexGet(CurrentUser.Id));
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationRelationTypes", "ClassificationRelationTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationRelationTypeProvider.UpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationRelationTypeUpdateGet ClassificationRelationType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var ErrorMessages = new List<ErrorMessage>();
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ErrorMessages = await _classificationRelationTypeProvider.UpdatePostCheck(ClassificationRelationType);
                if (ErrorMessages.Count > 0)
                {
                    ClassificationRelationType = await UpdateAddDropDownBoxes(ClassificationRelationType, CurrentUser.Id);
                }
                else
                {
                    _classificationRelationTypeProvider.UpdatePost(ClassificationRelationType);
                }
                ClassificationRelationTypeUpdateGetWithErrorMessages ClassificationRelationTypeWithErrorMessage = new ClassificationRelationTypeUpdateGetWithErrorMessages { ClassificationRelationType = ClassificationRelationType, ErrorMessages = ErrorMessages };
                return Ok(ClassificationRelationTypeWithErrorMessage);
            }
            ErrorMessages = await _checkProvider.NoRightsMessage(CurrentUser.Id);
            ClassificationRelationTypeUpdateGetWithErrorMessages ClassificationRelationTypeWithNoRights = new ClassificationRelationTypeUpdateGetWithErrorMessages { ClassificationRelationType = ClassificationRelationType, ErrorMessages = ErrorMessages };
            return Ok(ClassificationRelationTypeWithNoRights);

        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationRelationTypes", "ClassificationRelationTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationRelationTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationRelationTypeDeleteGet ClassificationRelationType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                ClassificationRelationType.UserId= CurrentUser.Id;
                //var CheckString = await _ClassificationRelationTypeProvider.DeletePostCheck(ClassificationRelationType);
                //if (CheckString.Length == 0)
                //{
                _classificationRelationTypeProvider.DeletePost(ClassificationRelationType.ClassificationRelationTypeId);
                return Ok(ClassificationRelationType);
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationRelationTypeLanguages", "ClassificationRelationTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationRelationTypeProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationRelationTypeLanguages", "ClassificationRelationTypeLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationRelationTypeProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
    }