﻿using System.Threading.Tasks;
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
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationController(IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _masterProvider = masterProvider;
            _checkProvider = checkProvider;
            _claimCheck = claimCheck;
            _classificationProvider = classificationProvider;
            _userManager = userManager;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "188"))
            {
                return Ok(await _classificationProvider.GetClassifications(CurrentUser.Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Languages/{Id:int}")]
        public async Task<IActionResult> GetLanguages(int Id)
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

                return Ok(await _classificationProvider.GetClassificationLanguages(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Values/{Id:int}")]
        public async Task<IActionResult> GetValues(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "6"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValues", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationValues(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("{Id:int}")]
        public async Task<IActionResult> Get(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "188"))
            {
                if(await _checkProvider.CheckIfRecordExists("Classifications", "ClassificationID", Id) == 0)
                    {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationProvider.GetClassification(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
            
        }

        [HttpGet("Language/{Id:int}")]
        public async Task<IActionResult> GetLanguage(int Id)
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
                return Ok(await _classificationProvider.GetClassificationLanguage(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Edit/{Id:int}")]
        public async Task<IActionResult> EditGet(int Id)
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
                var x = await _classificationProvider.GetClassificationEdit(CurrentUser.Id, Id);
                var y = await _classificationProvider.GetClassificationPageList(CurrentUser.Id, Id);
                var z = await _masterProvider.GetStatusList(CurrentUser.Id);

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

        [HttpPut]
        public async Task<IActionResult> Put(ClassificationUpdatePut Classification)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                var CheckString = await _classificationProvider.PutClassificationCheck(Classification);
                if (CheckString.Length==0)
                { 
                 _classificationProvider.PutClassification(Classification);
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

        [HttpPost]
        public async Task<IActionResult> Post(ClassificationCreatePost Classification)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _classificationProvider.PostClassificationCheck(Classification);
                if (CheckString.Length == 0)
                {
                    _classificationProvider.PostClassification(Classification);
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
    }
}