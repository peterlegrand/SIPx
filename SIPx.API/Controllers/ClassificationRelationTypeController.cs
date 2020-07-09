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
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationRelationTypeController(IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet("TypeIndex")]
        public async Task<IActionResult> GetRelationTypes() //int Id) PETER CHECK it had this Id but I think no need
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "30"))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationRelationTypes", "ClassificationRelationTypeID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                return Ok(await _classificationProvider.GetClassificationRelationTypes(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("TypeLanguageIndex/{Id:int}")]
        public async Task<IActionResult> GetRelationTypeLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "34"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationRelationTypeLanguages", "ClassificationRelationTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationRelationTypeLanguages(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("TypeEdit/{Id:int}")]
        public async Task<IActionResult> GetRelationType(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User); 
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "30"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationRelationTypes", "ClassificationRelationTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationRelationType(CurrentUser.Id, Id));
            }
            return BadRequest(new
            { 
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("TypeLanguageEdit/{Id:int}")]
        public async Task<IActionResult> GetRelationTypeLanguage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "34"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationRelationTypeLanguages", "ClassificationRelationTypeLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationRelationTypeLanguage(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}