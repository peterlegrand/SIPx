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
        [HttpGet("Levels/{Id:int}")]
        public async Task<IActionResult> GetLevels(int Id)
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


                return Ok(await _classificationProvider.GetClassificationLevels(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("LevelLanguages/{Id:int}")]
        public async Task<IActionResult> GetLevelLanguages(int Id)
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


                return Ok(await _classificationProvider.GetClassificationLevelLanguages(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Pages/{Id:int}")]
        public async Task<IActionResult> GetPages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "10"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPages", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }


                return Ok(await _classificationProvider.GetClassificationPages(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("PageLanguages/{Id:int}")]
        public async Task<IActionResult> GetPageLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "24"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPageLanguages", "ClassificationPageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationPageLanguages(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("PageSections/{Id:int}")]
        public async Task<IActionResult> GetPageSections(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "13"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPageSections", "ClassificationPageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationPageSections(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("PageSectionLanguages/{Id:int}")]
        public async Task<IActionResult> GetPageSectionLanguages(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "27"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassficationPageSectionLanguages", "ClassficationPageSectionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationPageSectionLanguages(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("RelationTypes")]
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
        [HttpGet("RelationTypeLanguages/{Id:int}")]
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

        [HttpGet("Roles/{Id:int}")]
        public async Task<IActionResult> GetRoles(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "38"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationRoles", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationRoles(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Users/{Id:int}")]
        public async Task<IActionResult> GetUsers(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "42"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationUsers", "ClassificationID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationUsers(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("ValueRoles/{Id:int}")]
        public async Task<IActionResult> GetValueRoles(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "46"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueRoles", "ClassificationValueID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationValueRoles(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("ValueUsers/{Id:int}")]
        public async Task<IActionResult> GetValueUsers(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "50"))  //PETER TODO looks like there is also a value 54
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueUsers", "ClassificationValueID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationValueUsers(CurrentUser.Id, Id));
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
        /// <summary>
        /// INDIVIDUAL RECORDS
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
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
        [HttpGet("Level/{Id:int}")]
        public async Task<IActionResult> GetLevel(int Id)
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
                return Ok(await _classificationProvider.GetClassificationLevel(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("LevelLanguage/{Id:int}")]
        public async Task<IActionResult> GetLevelLanguage(int Id)
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

                return Ok(await _classificationProvider.GetClassificationLevelLanguage(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("Page/{Id:int}")]
        public async Task<IActionResult> GetPage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "10"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPages", "ClassificationPageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationPage(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("PageLanguage/{Id:int}")]
        public async Task<IActionResult> GetPageLanguage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "24"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPageLanguages", "ClassificationPageLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationPageLanguage(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("PageSection/{Id:int}")]
        public async Task<IActionResult> GetPageSection(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "13"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPageSections", "ClassificationPageSectionID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationPageSection(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("PageSectionLanguage/{Id:int}")]
        public async Task<IActionResult> GetPageSectionLanguage(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "27"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationPageSectionLanguages", "ClassificationPageSectionLanguageID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationPageSectionLanguage(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("RelationType/{Id:int}")]
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
        [HttpGet("RelationTypeLanguage/{Id:int}")]
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

        [HttpGet("Role/{Id:int}")]
        public async Task<IActionResult> GetRole(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "38"))
            {
                if (await _checkProvider.CheckIfRecordExists("Classificationroles", "ClassificationRoleID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationRole(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("User/{Id:int}")]
        public async Task<IActionResult> GetUser(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "42"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationUsers", "ClassificationUserID", Id) == 0)  
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationUser(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("ValueRole/{Id:int}")]
        public async Task<IActionResult> GetValueRole(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "46"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueRoles", "ClassificationValueRoleID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationValueRole(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("ValueUser/{Id:int}")]
        public async Task<IActionResult> GetValueUser(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "50"))
            {
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueUsers", "ClassificationValueUserID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }

                return Ok(await _classificationProvider.GetClassificationValueUser(CurrentUser.Id, Id));
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