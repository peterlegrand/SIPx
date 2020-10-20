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
    public class ClassificationValueRoleController : ControllerBase
    {
        private readonly IRoleProvider _roleProvider;
        private readonly IClassificationValueRoleProvider _classificationValueRoleProvider;
        private readonly IClassificationRelationTypeProvider _classificationRelationTypeProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly ICheckProvider _checkProvider;
        private  IClaimCheck _claimCheck;
        private readonly IClassificationProvider _classificationProvider;
        private readonly UserManager<SipUser> _userManager;

        public ClassificationValueRoleController(IRoleProvider roleProvider, IClassificationValueRoleProvider classificationValueRoleProvider, IClassificationRelationTypeProvider classificationRelationTypeProvider, IClassificationValueProvider classificationValueProvider, IMasterProvider masterProvider, ICheckProvider checkProvider, IClaimCheck claimCheck, IClassificationProvider classificationProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _roleProvider = roleProvider;
            _classificationValueRoleProvider = classificationValueRoleProvider;
            _classificationRelationTypeProvider = classificationRelationTypeProvider;
            _classificationValueProvider = classificationValueProvider;
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
                var ClassificationValueRoleCreateGet = new ClassificationValueRoleCreateGet();
                var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(CurrentUser.Id);
                var x = await _classificationValueRoleProvider.ClassificationValueRoleCreateGetClassificationName(CurrentUser.Id, Id);
                ClassificationValueRoleCreateGet.ClassificationId = x.ClassificationId;
                ClassificationValueRoleCreateGet.ClassificationValueName= x.ClassificationValueName;
                ClassificationValueRoleCreateGet.ClassificationRelationTypes = ClassificationRelationTypes;
                ClassificationValueRoleCreateGet.ClassificationValueId = Id;
                ClassificationValueRoleCreateGet.Roles = await _roleProvider.List(CurrentUser.Id);
                return Ok(ClassificationValueRoleCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ClassificationValueRoleCreateGet ClassificationValueRole)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ClassificationValueRole.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                //var CheckString = await _classificationValueRoleProvider.CreatePostCheck(ClassificationValueRole);
                //if (CheckString.Length == 0)
                //{
                    _classificationValueRoleProvider.CreatePost(ClassificationValueRole);
                    return Ok(ClassificationValueRole);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "46"))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationValueRoles", "ClassificationValueID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                return Ok(await _classificationValueRoleProvider.IndexGet(CurrentUser.Id, Id));
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
                var ClassificationValueRole = await _classificationValueRoleProvider.UpdateGet(CurrentUser.Id, Id);
                var ClassificationRelationTypes = await _classificationRelationTypeProvider.List(CurrentUser.Id);
                ClassificationValueRole.ClassificationRelationTypes = ClassificationRelationTypes;
                ClassificationValueRole.Roles = await _roleProvider.List(CurrentUser.Id);

                return Ok(ClassificationValueRole);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ClassificationValueRoleUpdateGet ClassificationValueRole)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationValueRole.UserId = CurrentUser.Id;
                //var CheckString = await _classificationProvider.UpdatePostCheck(Classification);
                //if (CheckString.Length == 0)
                //{
                _classificationValueRoleProvider.UpdatePost(ClassificationValueRole);
                return Ok(ClassificationValueRole);
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
                if (await _checkProvider.CheckIfRecordExists("ClassificationValueRoles", "ClassificationValueRoleID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _classificationValueRoleProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ClassificationValueRoleDeleteGet ClassificationValueRole)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ClassificationValueRole.CreatorId = CurrentUser.Id;
                //var CheckString = await _ClassificationValueRoleProvider.DeletePostCheck(ClassificationValueRole);
                //if (CheckString.Length == 0)
                //{
                _classificationValueRoleProvider.DeletePost(ClassificationValueRole.ClassificationValueRoleId);
                return Ok(ClassificationValueRole);
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