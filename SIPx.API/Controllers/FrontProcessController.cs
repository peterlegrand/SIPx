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
        private readonly IProcessTypeStageTypeProvider _processTypeStageTypeProvider;
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
            , IProcessTypeStageTypeProvider processTypeStageTypeProvider
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
            _processTypeStageTypeProvider = processTypeStageTypeProvider;
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
                var ListOfProcessTypeGroups = await _frontProcessProvider.NewProcessShowTemplateGroup(CurrentUser.Id);
                var TemplateLogic = new FrontProcessNewProcessLogic(_userProvider, _processProvider, _frontProcessProvider);
                var ListOfProcessTypes = await TemplateLogic.ReturnProcessTypeList(CurrentUser);


                // var  = await _frontProcessProvider.NewProcessShowTemplate(CurrentUser.Id);
                foreach (var group in ListOfProcessTypeGroups)
                {
                    var ProcessTypes = ListOfProcessTypes.FindAll(x => x.ProcessTypeGroupId == group.ProcessTypeGroupId);
                    group.templates = ProcessTypes;
                }
                return Ok(ListOfProcessTypeGroups);
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
                List<NewProcessTypeList> x = await testifallowed.ReturnProcessTypeList(CurrentUser);

                if (x.Exists(x => x.ProcessTypeId == Id))
                {
                    //TOFIX PETER
                    var newprocess = await _processProvider.CreateGet(CurrentUser.Id, Id);
                    var newProcessWithMaster = new FrontProcessNewProcessWithMaster();

                    newProcessWithMaster.ProcessTypeId = Id;
                    newProcessWithMaster.ProcessFields = newprocess;
                    foreach(var y in newprocess)
                    {
                        if(y.ProcessTypeStageFieldStatusId == 4)
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
                    //if(newprocess[i].ValueUpdateTypeId==2 && new[] { 1, 2 }.Contains(newprocess[i].ProcessTypeFieldTypeId))
                    //    {
                    //        newprocess[i].StringValue
                    //    }

                    //}
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 12) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 13))
                    {
                        var Users = await _userProvider.List();
                        newProcessWithMaster.Users = Users;
                    }
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 14) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 15))
                    {
                        var organizations = await _organizationProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Organizations = organizations;
                    }
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 16) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 17))
                    {
                        var projects = await _projectProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Projects = projects;
                    }
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 18) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 19))
                    {
                        var Languages = await _languageProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Languages = Languages;
                    }
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 20) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 21))
                    {
                        var Classifications = await _classificationProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Classifications = Classifications;
                    }
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 22) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 23))
                    {
                        var ClassificationValues = await _classificationValueProvider.List(CurrentUser.Id);
                        newProcessWithMaster.ClassificationValues = ClassificationValues;
                    }
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 24) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 25))
                    {
                        var Contents = await _contentProvider.List();
                        newProcessWithMaster.Contents = Contents;
                    }
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 26) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 27))
                    {
                        var Countries = await _masterListProvider.CountryList(CurrentUser.Id);
                        newProcessWithMaster.Countries = Countries;
                    }
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 28) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 29))
                    {
                        var SecurityLevels = await _securityLevelProvider.List(CurrentUser.Id);
                        newProcessWithMaster.SecurityLevels = SecurityLevels;
                    }
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 30) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 31))
                    {
                        var Roles = await _roleProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Roles = Roles;
                    }
                    if (newprocess.Exists(x => x.ProcessTypeFieldTypeId == 36) || newprocess.Exists(x => x.ProcessTypeFieldTypeId == 37))
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
                var Condition = await testifallowed.ReturnProcessTypeList(CurrentUser);
                var Pass = await testifallowed.ReturnProcessTypeFlowPass(CurrentUser, Fields);
                if (Condition.Any(x => x.ProcessTypeId == Fields.ProcessTypeId) && Pass != 0)
                {
                    Fields.ProcessTypeFlowId = Pass;
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
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 12 || x.ProcessTypeFieldTypeId == 13))
                    {
                    }
                    //Organization
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 14 || x.ProcessTypeFieldTypeId == 15))
                    {
                    }
                    //Project
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 16 || x.ProcessTypeFieldTypeId == 17))
                    {
                    }
                    //Language
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 18 || x.ProcessTypeFieldTypeId == 19))
                    {
                    }
                    //Classification
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 20 || x.ProcessTypeFieldTypeId == 21))
                    {
                    }
                    //Classification value
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 22 || x.ProcessTypeFieldTypeId == 23))
                    {
                    }
                    //Content
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 24 || x.ProcessTypeFieldTypeId == 25))
                    {
                    }
                    //Country
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 26 || x.ProcessTypeFieldTypeId == 27))
                    {
                    }
                    //Security level
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 28 || x.ProcessTypeFieldTypeId == 29))
                    {
                    }
                    //Role
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 30 || x.ProcessTypeFieldTypeId == 31))
                    {
                    }
                    //Person
                    if (Process.Fields.Any(x => x.ProcessTypeFieldTypeId == 36 || x.ProcessTypeFieldTypeId == 37))
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
                var Pass = await testifallowed.ReturnProcessTypeFlowPass(CurrentUser, Process);
                if (Pass != 0)
                {
                    Process.ProcessTypeFlowId = Pass;

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
                ProcessSearch.ProcessTypeStageTypes = await _processTypeStageTypeProvider.List(CurrentUser.Id);
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