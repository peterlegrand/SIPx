using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Classes;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class FrontProcessController : Controller
    {
        private readonly IPeopleProvider _peopleProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IFrontProcessProvider _frontProcessProvider;
        private readonly IProcessProvider _processProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontProcessController(IPeopleProvider peopleProvider, IProjectProvider projectProvider, IClaimCheck claimCheck, IFrontProcessProvider frontProcessProvider, IProcessProvider processProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _peopleProvider = peopleProvider;
            _projectProvider = projectProvider;
            _claimCheck = claimCheck;
            _frontProcessProvider = frontProcessProvider;
            _processProvider = processProvider;
            _userManager = userManager;
        }

        [HttpGet("Template")]
        public async Task<IActionResult> Template()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var ListOfProcessTemplateGroups = await _frontProcessProvider.NewProcessShowTemplateGroup(CurrentUser.Id);
                var ListOfProcessTemplates = await _frontProcessProvider.NewProcessShowTemplate(CurrentUser.Id);
                foreach (var group in ListOfProcessTemplateGroups)
                {
                    var ProcessTemplates = ListOfProcessTemplates.FindAll(x => x.ProcessTemplateGroupId == group.ProcessTemplateGroupId);
                    group.templates = ProcessTemplates;
                }
                return Ok(ListOfProcessTemplateGroups);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpGet("New/{Id:int}")]
        public async Task<IActionResult> New(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var testifallowed = new NewProcessCheckAllowed(_processProvider);

            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "5"))  //11
            {
                List<NewProcessTemplateList> x = await testifallowed.CheckProcessTemplateID(CurrentUser, Id);

                if (x.Exists(x => x.ProcessTemplateId == Id))
                {
                    //TOFIX PETER
                    var newprocess = await _processProvider.NewProcessGet(CurrentUser.Id, Id);
                    var newProcessWithMaster = new NewProcessWithMaster();
                    newProcessWithMaster.ProcessFields = newprocess;
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 16))
                    {
                        var projects = await _projectProvider.ProjectList(CurrentUser.Id);
                        newProcessWithMaster.Projects = projects;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 12))
                    {
                        var Users = await _peopleProvider.UserList();
                        newProcessWithMaster.Users = Users;
                    }
                    return Ok(newProcessWithMaster);// CurrentUser.LanguageId));
                }
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }
    }
}
