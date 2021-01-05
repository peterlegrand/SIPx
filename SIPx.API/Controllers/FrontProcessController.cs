using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
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

        private readonly IUserRoleProvider _userRoleProvider;
        private readonly IProcessTemplateStageTypeProvider _processTemplateStageTypeProvider;
        private readonly IPersonProvider _personProvider;
        private readonly IRoleProvider _roleProvider;
        private readonly ISecurityLevelProvider _securityLevelProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IClassificationProvider _classificationProvider;
        private readonly IContentProvider _contentProvider;
        private readonly ILanguageProvider _languageProvider;
        private readonly IMasterListProvider _masterListProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IUserProvider _userProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IFrontProcessProvider _frontProcessProvider;
        private readonly IProcessProvider _processProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontProcessController(IUserRoleProvider userRoleProvider
            , IProcessTemplateStageTypeProvider processTemplateStageTypeProvider
            , IPersonProvider personProvider
            , IRoleProvider roleProvider
            , ISecurityLevelProvider securityLevelProvider
            , IClassificationValueProvider classificationValueProvider
            , IClassificationProvider classificationProvider
            , IContentProvider contentProvider
            , ILanguageProvider languageProvider
            , IMasterListProvider masterListProvider
            , IOrganizationProvider organizationProvider
            , IUserProvider userProvider
            , IProjectProvider projectProvider
            , IClaimCheck claimCheck
            , IFrontProcessProvider frontProcessProvider
            , IProcessProvider processProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _userRoleProvider = userRoleProvider;
            _processTemplateStageTypeProvider = processTemplateStageTypeProvider;
            _personProvider = personProvider;
            _roleProvider = roleProvider;
            _securityLevelProvider = securityLevelProvider;
            _classificationValueProvider = classificationValueProvider;
            _classificationProvider = classificationProvider;
            _contentProvider = contentProvider;
            _languageProvider = languageProvider;
            _masterListProvider = masterListProvider;
            _organizationProvider = organizationProvider;
            _userProvider = userProvider;
            _projectProvider = projectProvider;
            _claimCheck = claimCheck;
            _frontProcessProvider = frontProcessProvider;
            _processProvider = processProvider;
            _userManager = userManager;
        }

        [HttpGet("Templates")]
        public async Task<IActionResult> Templates()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ListOfProcessTemplateGroups = await _frontProcessProvider.NewProcessShowTemplateGroup(CurrentUser.Id);
                var TemplateLogic = new FrontProcessNewProcessLogic(_userProvider, _processProvider, _frontProcessProvider);
                var ListOfProcessTemplates = await TemplateLogic.ReturnProcessTemplateList(CurrentUser);


                // var  = await _frontProcessProvider.NewProcessShowTemplate(CurrentUser.Id);
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


        [HttpGet("Create/{Id:int}")]
        public async Task<IActionResult> Create(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var testifallowed = new FrontProcessNewProcessLogic(_userProvider, _processProvider, _frontProcessProvider);

                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  //11
            {
                List<NewProcessTemplateList> x = await testifallowed.ReturnProcessTemplateList(CurrentUser);

                if (x.Exists(x => x.ProcessTemplateId == Id))
                {
                    //TOFIX PETER
                    var newprocess = await _processProvider.CreateGet(CurrentUser.Id, Id);
                    var newProcessWithMaster = new FrontProcessNewProcessWithMaster();

                    newProcessWithMaster.ProcessTemplateId = Id;
                    newProcessWithMaster.ProcessFields = newprocess;
                    foreach(var y in newprocess)
                    {
                        if(y.ProcessTemplateStageFieldStatusId == 4)
                        {
                            var xd = @$"function {y.ControlIdOnFocusOutFunction.Trim()} {{var x = document.getElementById('{y.ControlId.Trim()}');console.log(x);if (x.value==='') {{ document.getElementById('{y.ControlIdWarning.Trim()}').style.display = 'block';}}else{{ document.getElementById('{y.ControlIdWarning.Trim()}').style.display = 'none';}}}}";
                              //var xd = @$"function {y.ControlIdOnFocusOutFunction.Trim()} {{var x = document.getElementById('{y.ControlId.Trim()}');if (x.value==='') {{alert('{y.MissingValueText.Trim()}a');}}else{{alert('{y.MissingValueText.Trim()}b');}}}}";
                            // var xe = String.Format($"function {0} {{var x = document.getElementById(\"{1}\");if (x.value===\"\") {{alert(\"{2}\");}}}}", y.ControlIdOnFocusOutFunction.Trim(), y.ControlId.Trim(), y.MissingValueText.Trim());
                            newProcessWithMaster.ErrorHandlingScript = newProcessWithMaster.ErrorHandlingScript + xd; 
                                //@"function " +
                                //y.ControlIdOnFocusOutFunction + @" {var x = document.getElementById("""+ 
                                //y.ControlId + "\");if (x.value===\"\") {alert(\"" +
                                //y.MissingValueText + "\");}}";
                        }
                    }
                    //for(int i = 0; i < newprocess.Count; i++)
                    //{ 
                    //if(newprocess[i].ValueUpdateTypeId==2 && new[] { 1, 2 }.Contains(newprocess[i].ProcessTemplateFieldTypeId))
                    //    {
                    //        newprocess[i].StringValue
                    //    }

                    //}
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 12) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 13))
                    {
                        var Users = await _userProvider.List();
                        newProcessWithMaster.Users = Users;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 14) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 15))
                    {
                        var organizations = await _organizationProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Organizations = organizations;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 16) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 17))
                    {
                        var projects = await _projectProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Projects = projects;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 18) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 19))
                    {
                        var Languages = await _languageProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Languages = Languages;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 20) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 21))
                    {
                        var Classifications = await _classificationProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Classifications = Classifications;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 22) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 23))
                    {
                        var ClassificationValues = await _classificationValueProvider.List(CurrentUser.Id);
                        newProcessWithMaster.ClassificationValues = ClassificationValues;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 24) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 25))
                    {
                        var Contents = await _contentProvider.List();
                        newProcessWithMaster.Contents = Contents;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 26) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 27))
                    {
                        var Countries = await _masterListProvider.CountryList(CurrentUser.Id);
                        newProcessWithMaster.Countries = Countries;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 28) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 29))
                    {
                        var SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                        newProcessWithMaster.SecurityLevels = SecurityLevels;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 30) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 31))
                    {
                        var Roles = await _roleProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Roles = Roles;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 36) || newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 37))
                    {
                        var Persons = await _personProvider.List();
                        newProcessWithMaster.Persons = Persons;
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

    

        [HttpPost("Create")]
        public async Task<IActionResult> Create(FrontProcessNewProcessWithMaster Fields)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var testifallowed = new FrontProcessNewProcessLogic(_userProvider, _processProvider, _frontProcessProvider);
            Fields.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  //11
            {

                //Check if the template is allowed to be created
                var Condition = await testifallowed.ReturnProcessTemplateList(CurrentUser);
                var Pass = await testifallowed.ReturnProcessTemplateFlowPass(CurrentUser, Fields);
                if (Condition.Any(x => x.ProcessTemplateId == Fields.ProcessTemplateId) && Pass != 0)
                {
                    Fields.ProcessTemplateFlowId = Pass;
                    _frontProcessProvider.FrontProcessCreatePost(Fields);
                    return Ok(Fields);// CurrentUser.LanguageId));
                }



            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpGet("ToDo")]
        public async Task<IActionResult> ToDo()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ToDoLogic = new FrontProcessToDoLogic(_projectProvider, _organizationProvider, _userRoleProvider, _roleProvider, _userProvider, _processProvider, _frontProcessProvider);
                var ToDo = await ToDoLogic.ReturnProcessList(CurrentUser);
                return Ok(ToDo);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Edit(int Id)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            var ToDoLogic = new FrontProcessToDoLogic(_projectProvider, _organizationProvider, _userRoleProvider, _roleProvider, _userProvider, _processProvider, _frontProcessProvider);
            var ToDo = await ToDoLogic.ReturnProcessList(CurrentUser);
            if (ToDo.Any(x => x.ProcessId == Id))
            {
                var Process = await _frontProcessProvider.FrontProcessUpdateGet(CurrentUser.Id, Id);
                Process.Fields = await _frontProcessProvider.FrontProcessUpdateGetFields(CurrentUser.Id, Id);
                Process.Classifications = await _classificationProvider.List(CurrentUser.Id);
                Process.ClassificationValues = await _classificationValueProvider.List(CurrentUser.Id);
                Process.Contents = await _contentProvider.List();
                Process.Languages = await _languageProvider.List(CurrentUser.Id);
                Process.Organizations = await _organizationProvider.List(CurrentUser.Id);
                Process.Persons = await _personProvider.List();
                Process.Projects = await _projectProvider.List(CurrentUser.Id);
                Process.Countries = await _masterListProvider.CountryList(CurrentUser.Id);
                Process.SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                //Process.Users = await _userManager.List();
                for (int i = 0; i < Process.Fields.Count; i++)
                {
                    if (Process.Fields[i].ValueUpdateTypeId == 3)
                    {
                        Process.Fields[i].StringValue = Process.Fields[i].DefaultStringValue;
                        Process.Fields[i].IntValue = Process.Fields[i].DefaultIntValue;
                        Process.Fields[i].DateTimeValue = Process.Fields[i].DefaultDateTimeValue;
                    }
                    if (Process.Fields[i].ValueUpdateTypeId == 2)
                    {
                        if (Process.Fields[i].StringValue == null)
                        {
                            Process.Fields[i].StringValue = Process.Fields[i].DefaultStringValue;
                        }
                        if (Process.Fields[i].IntValue == null)
                        {
                            Process.Fields[i].IntValue = Process.Fields[i].DefaultIntValue;
                        }
                        if (Process.Fields[i].DateTimeValue == null)
                        {
                            Process.Fields[i].DateTimeValue = Process.Fields[i].DefaultDateTimeValue;
                        }
                    }
                    //User
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 12 || x.ProcessTemplateFieldTypeId == 13))
                    {
                    }
                    //Organization
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 14 || x.ProcessTemplateFieldTypeId == 15))
                    {
                    }
                    //Project
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 16 || x.ProcessTemplateFieldTypeId == 17))
                    {
                    }
                    //Language
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 18 || x.ProcessTemplateFieldTypeId == 19))
                    {
                    }
                    //Classification
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 20 || x.ProcessTemplateFieldTypeId == 21))
                    {
                    }
                    //Classification value
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 22 || x.ProcessTemplateFieldTypeId == 23))
                    {
                    }
                    //Content
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 24 || x.ProcessTemplateFieldTypeId == 25))
                    {
                    }
                    //Country
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 26 || x.ProcessTemplateFieldTypeId == 27))
                    {
                    }
                    //Security level
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 28 || x.ProcessTemplateFieldTypeId == 29))
                    {
                    }
                    //Role
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 30 || x.ProcessTemplateFieldTypeId == 31))
                    {
                    }
                    //Person
                    if (Process.Fields.Any(x => x.ProcessTemplateFieldTypeId == 36 || x.ProcessTemplateFieldTypeId == 37))
                    {
                    }
                }
                return Ok(Process);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Update(FrontProcessUpdateGet Process)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {

                var testifallowed = new FrontProcessToDoLogic(_projectProvider, _organizationProvider, _userRoleProvider, _roleProvider, _userProvider, _processProvider, _frontProcessProvider);
                var Pass = await testifallowed.ReturnProcessTemplateFlowPass(CurrentUser, Process);
                if (Pass != 0)
                {
                    Process.ProcessTemplateFlowId = Pass;

                }
                _frontProcessProvider.FrontProcessEditPost(Process, CurrentUser.Id);
                return Ok(Process);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("View/{Id:int}")]
        public async Task<IActionResult> View(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationLevels", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                var Process = await _frontProcessProvider.FrontProcessView(CurrentUser.Id, Id);
                Process.ProcessFields = await _frontProcessProvider.FrontProcessViewGetField(CurrentUser.Id, Id);
                return Ok(Process);
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                var ProcessSearch = new ProcessAdvancedSearchPost();
                ProcessSearch.SelectedUsers = await _userProvider.List();
                ProcessSearch.Organizations = await _organizationProvider.List(CurrentUser.Id);
                ProcessSearch.Projects = await _projectProvider.List(CurrentUser.Id);
                ProcessSearch.Languages = await _languageProvider.ActiveList(CurrentUser.Id);
                ProcessSearch.Classifications = await _classificationProvider.List(CurrentUser.Id);
                ProcessSearch.ClassificationValues = await _classificationValueProvider.List(CurrentUser.Id);
                ProcessSearch.Contents = await _contentProvider.List();
                ProcessSearch.Countries = await _masterListProvider.CountryList(CurrentUser.Id);
                ProcessSearch.SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                ProcessSearch.Roles = await _roleProvider.List(CurrentUser.Id);
                ProcessSearch.Persons = await _personProvider.List();
                ProcessSearch.ProcessTemplateStageTypes = await _processTemplateStageTypeProvider.List(CurrentUser.Id);
                return Ok(ProcessSearch);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
        [HttpPost("AdvancedSearch")]
        public async Task<IActionResult> AdvancedSearch(ProcessAdvancedSearchPost AdvancedSearch)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            AdvancedSearch.UserId = CurrentUser.Id;
                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                //var CheckString = await _ProcessProvider.CreatePostCheck(Process);
                //if (CheckString.Length == 0)
                //{
                if (AdvancedSearch.Contains == null)
                { AdvancedSearch.Contains = ""; }
                if (AdvancedSearch.RoleId == null)
                { AdvancedSearch.RoleId = ""; }
                if (AdvancedSearch.SelectedUserId == null)
                { AdvancedSearch.SelectedUserId = ""; }
                var Result = await _processProvider.AdvancedSearch(CurrentUser.Id, AdvancedSearch);
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
    public class JavaScriptResult : ContentResult
    {
        public JavaScriptResult(string script)
        {
            this.Content = script;
            this.ContentType = "application/javascript";
        }
    }
}