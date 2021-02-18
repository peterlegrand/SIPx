using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Classes;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class FrontController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IUserRoleProvider _userRoleProvider;
        private readonly IRoleProvider _roleProvider;
        private readonly IUserProvider _userProvider;
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IPersonProvider _personProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IFrontUserPreferenceProvider _frontUserPreferenceProvider;
        private readonly IProcessProvider _processProvider;
        private readonly IFrontProcessProvider _frontProcessProvider;
        private readonly IContentProvider _contentProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IFrontProvider _frontProvider;
        private readonly UserManager<SipUser> _userManager;
      //  private readonly FrontPanels _frontPanels;

        public FrontController(IHostingEnvironment hostingEnvironment, IUserRoleProvider userRoleProvider
            , IRoleProvider roleProvider 
            , IUserProvider userProvider
            , IClassificationValueProvider classificationValueProvider
            , IOrganizationProvider organizationProvider
            , IPersonProvider personProvider
            , IProjectProvider projectProvider
            , IFrontUserPreferenceProvider frontUserPreferenceProvider
            , IProcessProvider processProvider
            , IFrontProcessProvider frontProcessProvider
            , IContentProvider contentProvider
            , IClaimCheck claimCheck
            , IFrontProvider frontProvider
            , Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _hostingEnvironment = hostingEnvironment;
            _userRoleProvider = userRoleProvider;
            _roleProvider = roleProvider;
            _userProvider = userProvider;
            _classificationValueProvider = classificationValueProvider;
            _organizationProvider = organizationProvider;
            _personProvider = personProvider;
            _projectProvider = projectProvider;
            _frontUserPreferenceProvider = frontUserPreferenceProvider;
            _processProvider = processProvider;
            _frontProcessProvider = frontProcessProvider;
            _contentProvider = contentProvider;
            _claimCheck = claimCheck;
            _frontProvider = frontProvider;
            _userManager = userManager;
        }

        [HttpGet("Index/{Id}")]
        public async Task<IActionResult> Index(int Id)
        {
            SIPUserManager SIPUser = new SIPUserManager(_hostingEnvironment, _userManager);
            var CurrentUser = await SIPUser.GetUser(User);

//            var CurrentUser = await _userManager.GetUserAsync(User);
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                if (Id == 0)
                {
                    var PageOfUser = await _frontUserPreferenceProvider.GetOnePreference(CurrentUser.Id, 2); //2 is to get the preference of the homepage
                    Id = PageOfUser.IntPreference;
                }
                var dashboard = await _frontProvider.FrontIndexGetDashboard(CurrentUser.Id, Id);
                var panels = await _frontProvider.FrontIndexPanels(CurrentUser.Id, Id);
                var FrontPanels = new FrontPanels(_classificationValueProvider, _contentProvider, _processProvider, _organizationProvider, _personProvider, _projectProvider);
                foreach (var panel in panels)
                {
                    switch (panel.PageSectionTypeId)
                    {
                        case 1: //List (TYPE)
                            switch (panel.PageSectionDataTypeId)
                            {
                               case 1: //Content (DATA TYPE)
                                    //                                    string ContentConditionSQLFrom = 


                                    //                                    " DECLARE @LanguageId int; " +
                                    //                                    " SELECT @LanguageId = IntPreference " +
                                    //                                    " FROM UserPreferences " +
                                    //                                    " WHERE USerId = '" + CurrentUser.Id + "' " +
                                    //                                    " AND UserPreferences.PreferenceTypeId = 1; " +
                                    //                                    " SELECT Contents.ContentID " +
                                    //    ", Contents.Title " +
                                    //    ", Contents.Description " +
                                    //    ", ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, 'No name for this ContentType')) ContentTypeName " +
                                    //    ", Creator.FirstName + ' ' + Creator.LastName CreatorName " +
                                    //    ", Creator.PersonID CreatorID " +
                                    //    ", Contents.CreatedDate " +
                                    //    ", Modifier.FirstName + ' ' + Modifier.LastName ModifierName " +
                                    //    ", Modifier.PersonId ModifierID " +
                                    //    ", Contents.ModifiedDate " +
                                    //    ", CONCAT('controlID', Contents.ContentId) ControlId " +
                                    // " FROM Contents " +
                                    // " JOIN ContentTypes " +
                                    // " ON Contents.ContentTypeID = ContentTypes.ContentTypeID " +
                                    //" LEFT JOIN(SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage " +
                                    //   " ON UserLanguage.ContentTypeID = ContentTypes.ContentTypeID " +
                                    //" LEFT JOIN(SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
                                    //  " ON DefaultLanguage.ContentTypeId = ContentTypes.ContentTypeID " +
                                    //" JOIN Persons Creator " +
                                    //    " ON Creator.UserId = Contents.CreatorID " +
                                    //" JOIN Persons Modifier " +
                                    //    " ON Modifier.UserId = Contents.ModifierID "
                                    //                                        ;
                                    //                                    string ContentConditionSQLWhere = " WHERE 1=1 ";
                                    //                                    string ContentConditionSQLContains = "";
                                    //                                    var ContentConditions = await _contentProvider.ContentForPanelCondition(panel.PageSectionId);
                                    //                                    foreach(var ContentCondition in ContentConditions)
                                    //                                    {
                                    //                                        switch(ContentCondition.PageSectionContentConditionTypeId)
                                    //                                        {
                                    //                                            case 1: // User
                                    //                                                ContentConditionSQLWhere += "";
                                    //                                                break;
                                    //                                            case 2: // Contains
                                    //                                                ContentConditionSQLContains += "";
                                    //                                                break;

                                    //                                            case 3: // Organization
                                    //                                                ContentConditionSQLWhere += " AND Contents.OrganizationId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                    //                                                break;
                                    //                                            case 4: // Project
                                    //                                                ContentConditionSQLWhere += " AND Contents.ProjectId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                    //                                                break;
                                    //                                            case 5: // Content type
                                    //                                                ContentConditionSQLWhere += " AND Contents.ContentTypeId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                    //                                                break;
                                    //                                            case 6: // Content status
                                    //                                                ContentConditionSQLWhere += " AND Contents.ContentStatusId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                    //                                                break;
                                    //                                            case 7: // Language
                                    //                                                ContentConditionSQLWhere += " AND Contents.LanguageId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                    //                                                break;
                                    //                                            case 8: // Security level
                                    //                                                ContentConditionSQLWhere += " AND Contents.SecurityLevelId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                    //                                                break;
                                    //                                            case 9: // Creator
                                    //                                                ContentConditionSQLWhere += " AND Contents.CreatorId = '" + ContentCondition.PageSectionContentConditionString + "' ";
                                    //                                                break;
                                    //                                            case 10: // Modifier
                                    //                                                ContentConditionSQLWhere += " AND Contents.ModifierId = '" + ContentCondition.PageSectionContentConditionString + "' ";
                                    //                                                break;
                                    //                                            case 11: // ClassificationValue
                                    //                                                ContentConditionSQLWhere += " AND Contents.ContentId IN (SELECT CotentId FROM ContentClassificationValues WHERE ClassificationValueId = " + ContentCondition.PageSectionContentConditionInt+ ") ";
                                    //                                                break;
                                    //                                            case 12: // Created from date
                                    //                                                ContentConditionSQLWhere += " AND Contents.CreatedDate > '" + ContentCondition.PageSectionContentConditionDate + "' ";
                                    //                                                break;
                                    //                                            case 13: // Created to date
                                    //                                                ContentConditionSQLWhere += " AND Contents.CreatedDate < '" + ContentCondition.PageSectionContentConditionDate + "' ";
                                    //                                                break;
                                    //                                            case 14: // Created from date
                                    //                                                ContentConditionSQLWhere += " AND Contents.ModifiedDate > '" + ContentCondition.PageSectionContentConditionDate + "' ";
                                    //                                                break;
                                    //                                            case 15: // Created to date
                                    //                                                ContentConditionSQLWhere += " AND Contents.ModifiedDate < '" + ContentCondition.PageSectionContentConditionDate + "' ";
                                    //                                                break;

                                    //                                        }
                                    //                                    }
                                    //                                    var ContentList = await _contentProvider.ContentForPanel( ContentConditionSQLFrom, ContentConditionSQLWhere, ContentConditionSQLContains);
                                    //                                    panel.Contents = ContentList;
                                    panel.Contents = await FrontPanels.ContentList(CurrentUser, panel.PageSectionId);
                                    break;
                                case 2: //Pocess (DATA TYPE) List (Type)

                                    //string ProcessConditionSQLFrom = " SELECT Processes.ProcessId, ISNULL(ProcessFieldSubject.StringValue,'') As Subject, ProcessTypeLanguages.Name ProcessTypeName FROM Processes JOIN ProcessFields ProcessFieldSubject ON ProcessFieldSubject.ProcessId = Processes.ProcessId " +
                                    //    " JOIN ProcessTypefields ProcessTypeFieldSubject ON  ProcessTypeFieldSubject.ProcessTypefieldId = ProcessFieldSubject.ProcessTypefieldId  " +
                                    //    " JOIN ProcessTypes ON Processes.ProcessTypeId =  ProcessTypes.ProcessTypeId JOIN ProcessTypeStages ON Processes.ProcessTypeStageId = ProcessTypeStages.ProcessTypeStageID ";
                                    //string ProcessConditionSQLWhere = " WHERE ProcessTypeFieldSubject.ProcessTypeFieldTypeId = 1 AND ProcessTypeStages.InToDo = 1 ";
                                    //string ProcessConditionSQLContains = "";
                                    //var ProcessConditions = await _processProvider.ProcessForPanelCondition(panel.PageSectionId);
                                    //foreach (var ProcessCondition in ProcessConditions)
                                    //{
                                    //    switch (ProcessCondition.PageSectionProcessConditionTypeId)
                                    //    {
                                    //        case 1: // Template
                                    //            ProcessConditionSQLWhere += " AND TemplateId = " + ProcessCondition.PageSectionProcessConditionInt;
                                    //            break;
                                    //        case 2: // Template group
                                    //            ProcessConditionSQLFrom += " JOIN ProcessTypeGroups ON ProcessTypes.ProcessTypeGroupId = ProcessTypeGroups.ProcessTypeGroupId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessTypeGroups.TemplateGroupId = " + ProcessCondition.PageSectionProcessConditionInt;
                                    //            break;

                                    //        case 3: // My calendar
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldMyCalendar ON Processes.ProcessId = ProcessFieldMyCalendar.ProcessId JOIN ProcessTypeFields ProcessTypeFieldMyCalendar ON ProcessTypeFieldMyCalendar.ProcessTypeFieldId = ProcessFieldMyCalendar.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessTypes.ShowInPersonalCalendar = 1 AND ProcessFieldMyCalendar.StringValue = '" + CurrentUser.Id  + "' AND ProcessTypeFieldMyCalendar.ProcessTypefieldTypeId = 12 ";
                                    //            break;
                                    //        case 4: // Personal calendar
                                    //            ProcessConditionSQLWhere += " AND ProcessTypes.ShowInPersonalCalendar = 1 ";
                                    //            break;
                                    //        case 5: // Organization calendar
                                    //            ProcessConditionSQLWhere += " AND ProcessTypes.ShowInOrganizationCalendar = 1 ";
                                    //            break;
                                    //        case 6: // Project calendar
                                    //            ProcessConditionSQLWhere += " AND ProcessTypes.ShowInProjectCalendar = 1 ";
                                    //            break;
                                    //        case 7: // Event calendar
                                    //            ProcessConditionSQLWhere += " AND ProcessTypes.ShowInEventCalendar = 1 ";
                                    //            break;
                                    //        case 8: // Is personal
                                    //            ProcessConditionSQLWhere += " AND ProcessTypes.IsPersonal = 1 " ;
                                    //            break;
                                    //        case 9: // Show new
                                    //            ProcessConditionSQLWhere += " AND ProcessTypes.ShowInNew = 1 ";
                                    //            break;
                                    //        case 10: // Show search
                                    //            ProcessConditionSQLWhere += " AND ProcessTypes.ShowInSearch = 1 ";
                                    //            break;
                                    //        case 11: // show report
                                    //            ProcessConditionSQLWhere += " AND ProcessTypes.ShowInReport = 1 ";
                                    //            break;
                                    //        case 12: // Organization
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldOrganization ON Processes.ProcessId = ProcessFieldOrganization.ProcessId  JOIN ProcessTypeFields ProcessTypeFieldOrganization ON ProcessTypeFieldOrganization.ProcessTypeFieldId = ProcessFieldOrganization.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldOrganization.IntValue = " + ProcessCondition.PageSectionProcessConditionInt + " AND (ProcessTypeFieldOrganization.ProcessTypefieldTypeId = 14 OR ProcessTypeFieldOrganization.ProcessTypefieldTypeId = 15 ) ";
                                    //            break;
                                    //        case 13: // Project
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldProject ON Processes.ProcessId = ProcessFieldProject.ProcessId JOIN ProcessTypeFields ProcessTypeFieldProject ON ProcessTypeFieldProject.ProcessTypeFieldId = ProcessFieldProject.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldProject.IntValue = " + ProcessCondition.PageSectionProcessConditionInt + "' AND (ProcessTypeFieldProject.ProcessTypefieldTypeId = 16 OR ProcessTypeFieldProject.ProcessTypefieldTypeId = 17) ";
                                    //            break;
                                    //        case 14: // creator is user
                                    //            ProcessConditionSQLWhere += " AND Processes.CreatorId = '" + CurrentUser.Id + "' ";
                                    //            break;
                                    //        case 15: // role
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldRole ON Processes.ProcessId = ProcessFieldRole.ProcessId JOIN ProcessTypeFields ProcessTypeFieldRole ON ProcessTypeFieldRole.ProcessTypeFieldId = ProcessFieldRole.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldRole.stringValue = '" + ProcessCondition.PageSectionProcessConditionString + "' AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 30 ";
                                    //            break;
                                    //        case 16: // securitylevel
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldSecurityLevel ON Processes.ProcessId = ProcessFieldSecurityLevel.ProcessId JOIN ProcessTypeFields ProcessTypeFieldSecurityLevel ON ProcessTypeFieldSecurityLevel.ProcessTypeFieldId = ProcessFieldSecurityLevel.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldSecurityLevel.IntValue <= '" + ProcessCondition.PageSectionProcessConditionInt + "' AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 28 ";
                                    //            break;
                                    //        case 18: // Default Organization
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldOrganization.IntValue = @DefaultOrganization AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 14 ";
                                    //            break;
                                    //        case 19: // UserOrganization
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldUserOrganization ON Processes.ProcessId = ProcessFieldUserOrganization.ProcessId JOIN ProcessTypeFields ProcessTypeFieldUserOrganization ON ProcessTypeFieldUserOrganization.ProcessTypeFieldId = ProcessFieldUserOrganization.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldUserOrganization.IntValue IN (SELECT OrganizationId FROM AspNetRoles JOIN AspNetUserRoles ON AspNetRoles.Id = AspNetUserRoles.RoleId WHERE UserId = '" + CurrentUser.Id + "') AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 14 ";
                                    //            break;

                                    //        case 20: // Specific Organization
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldOrganizationRole ON Processes.ProcessId = ProcessFieldOrganizationRole.ProcessId JOIN ProcessTypeFields ProcessTypeFieldOrganizationRole ON ProcessTypeFieldOrganizationRole.ProcessTypeFieldId = ProcessFieldOrganizationRole.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldOrganizationRole.StringValue = '" + ProcessCondition.PageSectionProcessConditionString + "' AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 30 ";
                                    //            break;
                                    //        case 21: // UserProject
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldUserProject ON Processes.ProcessId = ProcessFieldUserProject.ProcessId JOIN ProcessTypeFields ProcessTypeFieldUserProject ON ProcessTypeFieldUserProject.ProcessTypeFieldId = ProcessFieldUserProject.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldUserProject.IntValue IN (SELECT ProjectId FROM AspNetRoles JOIN AspNetUserRoles ON AspNetRoles.Id = AspNetUserRoles.RoleId WHERE UserId = '" + CurrentUser.Id + "') AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 16 ";
                                    //            break;

                                    //        case 22: // Specific project
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldProjectRole ON Processes.ProcessId = ProcessFieldProjectRole.ProcessId JOIN ProcessTypeFields ProcessTypeFieldProjectRole ON ProcessFieldProjectRole.ProcessTypeFieldId = ProcessTypeFieldProjectRole.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldProjectRole.StringValue = '" + ProcessCondition.PageSectionProcessConditionString + "' AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 30 ";
                                    //            break;

                                    //        case 25: // Content
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldContent ON Processes.ProcessId = ProcessFieldContent.ProcessId JOIN ProcessTypeFields ProcessTypeFieldContent ON ProcessFieldContent.ProcessTypeFieldId = ProcessTypeFieldContent.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldContent.IntValue = " + ProcessCondition.PageSectionProcessConditionInt + " AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 24  ";
                                    //            break;

                                    //        case 26: // Content type
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldContentType ON Processes.ProcessId = ProcessFieldContentType.ProcessId JOIN ProcessTypeFields ProcessTypeFieldContentType ON ProcessFieldContentType.ProcessTypeFieldId = ProcessTypeFieldContentType.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldContentType.IntValue IN (SELECT ContentId FROM Contents WHERE ContentTypeID = " + ProcessCondition.PageSectionProcessConditionInt + ") AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 24  ";
                                    //            break;
                                    //        case 27: // User is user
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldUserIsUser ON Processes.ProcessId = ProcessFieldUserIsUser.ProcessId JOIN ProcessTypeFields ProcessTypeFieldUserIsUser ON ProcessFieldUserIsUser.ProcessTypeFieldId = ProcessTypeFieldUserIsUser.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldUserIsUser.StringValue = '" + ProcessCondition.PageSectionProcessConditionString + "' AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 12  ";
                                    //            break;
                                    //        case 32: // From date
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldFromDate ON Processes.ProcessId = ProcessFieldFromDate.ProcessId JOIN ProcessTypeFields ProcessTypeFieldFromDate ON ProcessFieldFromDate.ProcessTypeFieldId = ProcessTypeFieldFromDate.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldFromDate.DateTimeValue >= '" + ProcessCondition.PageSectionProcessConditionDate + "' AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 4  ";
                                    //            //PETER TO DO the date time and date time range and date range
                                    //            break;
                                    //        case 33: // To date
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldToDate ON Processes.ProcessId = ProcessFieldToDate.ProcessId JOIN ProcessTypeFields ProcessTypeFieldToDate ON ProcessFieldToDate.ProcessTypeFieldId = ProcessTypeFieldToDate.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldToDate.DateTimeValue <= '" + ProcessCondition.PageSectionProcessConditionDate + "' AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 4  ";
                                    //            break;
                                    //        case 37: // Person
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldPerson ON Processes.ProcessId = ProcessFieldPerson.ProcessId JOIN ProcessTypeFields ProcessTypeFieldPerson ON ProcessFieldPerson.ProcessTypeFieldId = ProcessTypeFieldPerson.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldPerson.IntValue = " + ProcessCondition.PageSectionProcessConditionInt + " AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 36 ";
                                    //            break;
                                    //        case 38: // Content type group
                                    //            ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldContentTypeGroup ON Processes.ProcessId = ProcessFieldContentTypeGroup.ProcessId JOIN ProcessTypeFields ProcessTypeFieldContentTypeGroup ON ProcessFieldContentTypeGroup.ProcessTypeFieldId = ProcessTypeFieldContentTypeGroup.ProcessTypeFieldId ";
                                    //            ProcessConditionSQLWhere += " AND ProcessFieldContentTypeGroup.IntValue IN (SELECT ContentId FROM Contents JOIN ContentTypes ON Contents.ContentTypeId = ContentTypes.ContentTypeId WHERE ContentTypeGroupID = " + ProcessCondition.PageSectionProcessConditionInt + ") AND ProcessTypeFieldUser.ProcessTypefieldTypeId = 24 ";
                                    //            break;

                                    //    }
                                    //}
                                    //var ProcessList = await _processProvider.ProcessForPanel(CurrentUser.Id, ProcessConditionSQLFrom, ProcessConditionSQLWhere, ProcessConditionSQLContains);
                                    //panel.Processes = ProcessList;
                                    panel.Processes = await FrontPanels.ProcessList(CurrentUser, panel.PageSectionId);
                                    break;
                                case 3: //Organizatio (DATA TYPE) List (Type)
                                    panel.Organizations = await FrontPanels.OrganizationList(CurrentUser, panel.PageSectionId);
                                    break;
                                case 4: //Person (DATA TYPE) List (Type)
                                    panel.Persons = await FrontPanels.PersonList(CurrentUser, panel.PageSectionId);
                                    break;
                                case 5: //Project (DATA TYPE) List (Type)
                                    panel.Projects = await FrontPanels.ProjectList(CurrentUser, panel.PageSectionId);
                                    break;
                                case 6: //Favorites (DATA TYPE) List (Type)
                                    //PETER TODO Add this functionality
                                    break;
                                case 7: //Classification (DATA TYPE) List (Type)
                                    panel.ClassificationValues = await FrontPanels.ClassificationValueList(CurrentUser, panel.PageSectionId);
                                    break;
                            }
                            break;
                        case 2: //Index only classification (TYPE)
                            break;

                        case 3: //Chat not yet (TYPE)
                            break;

                        case 4: //Personal canendar (TYPE)
                            var PersonalCalendar = await _frontProvider.FrontIndexPersonalCalendar(CurrentUser.Id);
                            panel.PersonalCalendars = PersonalCalendar;
                            break;

                        case 5: //Organization calendar (TYPE)
                            var OrganizationCalendar = await _frontProvider.FrontIndexOrganizationCalendar(CurrentUser.Id);
                            panel.OrganizationCalendars = OrganizationCalendar;
                            break;
                        case 6: //Project calendar (TYPE)
                            var ProjectCalendar = await _frontProvider.FrontIndexProjectCalendar(CurrentUser.Id);
                            panel.ProjectCalendars = ProjectCalendar;
                            break;
                        case 7: //Platform calendar (TYPE)
                            var EventCalendar = await _frontProvider.FrontIndexEventCalendar();
                            panel.EventCalendars = EventCalendar;
                            break;
                        case 8: //General calendar (TYPE)
                            break;

                        case 9: //to do
                                
                            var todo = new FrontProcessToDoLogic(_projectProvider,_organizationProvider,_userRoleProvider, _roleProvider, _userProvider, _processProvider, _frontProcessProvider);

                            panel.ToDos = await todo.ReturnProcessList(CurrentUser);                           
                            break;
                    }
                }
                dashboard.Panels = panels;
                return Ok(dashboard);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}
