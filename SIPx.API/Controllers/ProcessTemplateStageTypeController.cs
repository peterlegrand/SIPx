using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.Shared;
using SIPx.DataAccess;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class ProcessTemplateStageTypeController : ControllerBase
    {
        private readonly ICheckProvider _checkProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IProcessTemplateStageTypeProvider _processTemplateStageTypeProvider;
        private readonly IMasterProvider _masterProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProjectProvider _ProjectProvider;
        private readonly UserManager<SipUser> _userManager;

        public ProcessTemplateStageTypeController(ICheckProvider checkProvider, IMasterListProvider masterListProvider, IProcessTemplateStageTypeProvider ProcessTemplateStageTypeProvider, IMasterProvider masterProvider, IClaimCheck claimCheck, IProjectProvider ProjectProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _checkProvider = checkProvider;
            _masterListProvider = masterListProvider;
            _processTemplateStageTypeProvider = ProcessTemplateStageTypeProvider;
            _masterProvider = masterProvider;
            _claimCheck = claimCheck;
            _ProjectProvider = ProjectProvider;
            _userManager = userManager;
        }


        [HttpGet("Create")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var ProcessTemplateStageTypeCreateGet = new ProcessTemplateStageTypeCreateGet();
                var icons = await _masterListProvider.IconList(CurrentUser.Id);
                ProcessTemplateStageTypeCreateGet.Icons = icons;

                //var UserLanguage = await _masterProvider.UserLanguageUpdateGet(CurrentUser.Id);
                //ProcessTemplateStageTypeCreateGet.LanguageId = UserLanguage.LanguageId;
                //ProcessTemplateStageTypeCreateGet.LanguageName = UserLanguage.Name;
                return Ok(ProcessTemplateStageTypeCreateGet);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            ProcessTemplateStageType.CreatorId = CurrentUser.Id;
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "191"))
            {
                var CheckString = await _processTemplateStageTypeProvider.CreatePostCheck(ProcessTemplateStageType);
                if (CheckString.Length == 0)
                {
                    _processTemplateStageTypeProvider.CreatePost(ProcessTemplateStageType);
                    return Ok(ProcessTemplateStageType);
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

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _processTemplateStageTypeProvider.IndexGet(CurrentUser.Id));
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var x = await _processTemplateStageTypeProvider.UpdateGet(CurrentUser.Id, Id);
                var icons = await _masterListProvider.IconList(CurrentUser.Id);
                x.Icons = icons;

                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(ProcessTemplateStageTypeUpdateGet ProcessTemplateStageType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ProcessTemplateStageType.ModifierId = CurrentUser.Id;
                //var CheckString = await _PersonProvider.UpdatePostCheck(Person);
                //if (CheckString.Length == 0)
                //{
                _processTemplateStageTypeProvider.UpdatePost(ProcessTemplateStageType);
                return Ok(ProcessTemplateStageType);
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
                if (await _checkProvider.CheckIfRecordExists("ProcessTemplateStageTypes", "ProcessTemplateStageTypeID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processTemplateStageTypeProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessTemplateStageTypeDeleteGet ProcessTemplateStageType)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                ProcessTemplateStageType.CreatorId = CurrentUser.Id;
                //var CheckString = await _ProcessTemplateStageTypeProvider.DeletePostCheck(ProcessTemplateStageType);
                //if (CheckString.Length == 0)
                //{
                _processTemplateStageTypeProvider.DeletePost(ProcessTemplateStageType.ProcessTemplateStageTypeId);
                return Ok(ProcessTemplateStageType);
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _processTemplateStageTypeProvider.LanguageIndexGet(CurrentUser.Id, Id));
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
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                return Ok(await _processTemplateStageTypeProvider.LanguageUpdateGet(CurrentUser.Id, Id));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

    }
}