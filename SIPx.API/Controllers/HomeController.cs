using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
    public class HomeController : Controller
    {
        private readonly IHomeProvider _homeProvider;
        private readonly IUserPreferenceProvider _userPreferenceProvider;
        private readonly IProcessProvider _processProvider;
        private readonly IFrontProcessProvider _frontProcessProvider;
        private readonly IContentProvider _contentProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IFrontProvider _frontProvider;
        private readonly UserManager<SipUser> _userManager;

        public HomeController(IHomeProvider  homeProvider, IUserPreferenceProvider userPreferenceProvider, IProcessProvider processProvider, IFrontProcessProvider frontProcessProvider, IContentProvider contentProvider, IClaimCheck claimCheck, IFrontProvider frontProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _homeProvider = homeProvider;
            _userPreferenceProvider = userPreferenceProvider;
            _processProvider = processProvider;
            _frontProcessProvider = frontProcessProvider;
            _contentProvider = contentProvider;
            _claimCheck = claimCheck;
            _frontProvider = frontProvider;
            _userManager = userManager;
        }

        [HttpGet("Index")]
        public async Task<IActionResult> Index()
        {
            
            var CurrentUserId = await _homeProvider.StringSetting(4);
            //if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var dashboard = await _homeProvider.HomeIndexGetDashboard();
                var panels = await _homeProvider.HomeIndexGetPanels();
                foreach(var panel in panels)
                {
                    switch (panel.PageSectionTypeId)
                    {
                        case 1: //List (TYPE)
                            switch (panel.PageSectionDataTypeId)
                            {
                                case 1: //Content (DATA TYPE)
                                    string ContentConditionSQLFrom = 


                                    " DECLARE @LanguageId int; " +
                                    " select @LanguageId  =IntValue  from settings where SettingID = 1 ; " +
                                    " SELECT Contents.ContentID " +
    ", Contents.Title " +
    ", Contents.Description " +
    ", ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, 'No name for this ContentType')) ContentTypeName " +
    ", Creator.FirstName + ' ' + Creator.LastName CreatorName " +
    ", Creator.PersonID CreatorID " +
    ", Contents.CreatedDate " +
    ", Modifier.FirstName + ' ' + Modifier.LastName ModifierName " +
    ", Modifier.PersonId ModifierID " +
    ", Contents.ModifiedDate " +
    ", CONCAT('controlID', Contents.ContentId) ControlId " +
 " FROM Contents " +
 " JOIN ContentTypes " +
 " ON Contents.ContentTypeID = ContentTypes.ContentTypeID " +
" LEFT JOIN(SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage " +
   " ON UserLanguage.ContentTypeID = ContentTypes.ContentTypeID " +
" LEFT JOIN(SELECT ContentTypeId, Name, Description, MenuName, MouseOver, ContentTypeLanguageID FROM ContentTypeLanguages JOIN Settings ON ContentTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
  " ON DefaultLanguage.ContentTypeId = ContentTypes.ContentTypeID " +
" JOIN Persons Creator " +
    " ON Creator.UserId = Contents.CreatorID " +
" JOIN Persons Modifier " +
    " ON Modifier.UserId = Contents.ModifierID "
                                        ;
                                    string ContentConditionSQLWhere = " WHERE Contents.SecurityLevelId = 1 ";
                                    string ContentConditionSQLContains = "";
                                    var ContentConditions = await _contentProvider.ContentForPanelCondition(panel.PageSectionId);
                                    foreach(var ContentCondition in ContentConditions)
                                    {
                                        switch(ContentCondition.PageSectionContentConditionTypeId)
                                        {
                                            case 1: // User
                                                ContentConditionSQLWhere += "";
                                                break;
                                            case 2: // Contains
                                                ContentConditionSQLContains += "";
                                                break;

                                            case 3: // Organization
                                                ContentConditionSQLWhere += " AND Contents.OrganizationId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                                break;
                                            case 4: // Project
                                                ContentConditionSQLWhere += " AND Contents.ProjectId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                                break;
                                            case 5: // Content type
                                                ContentConditionSQLWhere += " AND Contents.ContentTypeId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                                break;
                                            case 6: // Content status
                                                ContentConditionSQLWhere += " AND Contents.ContentStatusId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                                break;
                                            case 7: // Language
                                                ContentConditionSQLWhere += " AND Contents.LanguageId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                                break;
                                            case 8: // Security level
                                                ContentConditionSQLWhere += " AND Contents.SecurityLevelId = " + ContentCondition.PageSectionContentConditionInt + " ";
                                                break;
                                            case 9: // Creator
                                                ContentConditionSQLWhere += " AND Contents.CreatorId = '" + ContentCondition.PageSectionContentConditionString + "' ";
                                                break;
                                            case 10: // Modifier
                                                ContentConditionSQLWhere += " AND Contents.ModifierId = '" + ContentCondition.PageSectionContentConditionString + "' ";
                                                break;
                                            case 11: // ClassificationValue
                                                ContentConditionSQLWhere += " AND Contents.ContentId IN (SELECT CotentId FROM ContentClassificationValues WHERE ClassificationValueId = " + ContentCondition.PageSectionContentConditionInt+ ") ";
                                                break;
                                            case 12: // Created from date
                                                ContentConditionSQLWhere += " AND Contents.CreatedDate > '" + ContentCondition.PageSectionContentConditionDate + "' ";
                                                break;
                                            case 13: // Created to date
                                                ContentConditionSQLWhere += " AND Contents.CreatedDate < '" + ContentCondition.PageSectionContentConditionDate + "' ";
                                                break;
                                            case 14: // Created from date
                                                ContentConditionSQLWhere += " AND Contents.ModifiedDate > '" + ContentCondition.PageSectionContentConditionDate + "' ";
                                                break;
                                            case 15: // Created to date
                                                ContentConditionSQLWhere += " AND Contents.ModifiedDate < '" + ContentCondition.PageSectionContentConditionDate + "' ";
                                                break;

                                        }
                                    }
                                    var ContentList = await _contentProvider.ContentForPanel(ContentConditionSQLFrom, ContentConditionSQLWhere, ContentConditionSQLContains);
                                    panel.Contents = ContentList;
                                    break;

                                case 2: //Pocess (DATA TYPE) List (Type)
                                    string ProcessConditionSQLFrom = " SELECT Processes.ProcessId, ISNULL(ProcessFieldSubject.StringValue,'') As Subject, ProcessTemplateLanguages.Name ProcessTemplateName FROM Processes JOIN ProcessFields ProcessFieldSubject ON ProcessFieldSubject.ProcessId = Processes.ProcessId " +
                                        " JOIN ProcessTemplatefields ProcessTemplateFieldSubject ON  ProcessTemplateFieldSubject.ProcessTemplatefieldId = ProcessFieldSubject.ProcessTemplatefieldId  " +
                                        " JOIN ProcessTemplates ON Processes.ProcessTemplateId =  ProcessTemplates.ProcessTemplateId  " +
                                        " JOIN ProcessTemplateFields SecurityTemplateField ON Processes.ProcessTemplateID = SecurityTemplateField.ProcessTemplateID JOIN ProcessFields SecurityField ON Processes.ProcessID = SecurityField.ProcessID AND SecurityField.ProcessTemplateFieldID = SecurityTemplateField.ProcessTemplateFieldID ";
                                    string ProcessConditionSQLWhere = " WHERE SecurityTemplateField.ProcessTemplateFieldTypeID = 28 AND SecurityField.IntValue = 1 ";
                                    string ProcessConditionSQLContains = "";
                                    var ProcessConditions = await _processProvider.ProcessForPanelCondition(panel.PageSectionId);
                                    foreach (var ProcessCondition in ProcessConditions)
                                    {
                                        switch (ProcessCondition.PageSectionProcessConditionTypeId)
                                        {
                                            case 1: // Template
                                                ProcessConditionSQLWhere += " AND TemplateId = " + ProcessCondition.PageSectionProcessConditionInt;
                                                break;
                                            case 2: // Template group
                                                ProcessConditionSQLFrom += " JOIN ProcessTemplateGroups ON ProcessTemplates.ProcessTemplateGroupId = ProcessTemplateGroups.ProcessTemplateGroupId ";
                                                ProcessConditionSQLWhere += " AND ProcessTemplateGroups.TemplateGroupId = " + ProcessCondition.PageSectionProcessConditionInt;
                                                break;

                                            case 3: // My calendar
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldMyCalendar ON Processes.ProcessId = ProcessFieldMyCalendar.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldMyCalendar ON ProcessTemplateFieldMyCalendar.ProcessTemplateFieldId = ProcessFieldMyCalendar.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessTemplates.ShowInPersonalCalendar = 1  AND ProcessTemplateFieldMyCalendar.ProcessTemplatefieldTypeId = 12 ";
                                                break;
                                            case 4: // Personal calendar
                                                ProcessConditionSQLWhere += " AND ProcessTemplates.ShowInPersonalCalendar = 1 ";
                                                break;
                                            case 5: // Organization calendar
                                                ProcessConditionSQLWhere += " AND ProcessTemplates.ShowInOrganizationCalendar = 1 ";
                                                break;
                                            case 6: // Project calendar
                                                ProcessConditionSQLWhere += " AND ProcessTemplates.ShowInProjectCalendar = 1 ";
                                                break;
                                            case 7: // Event calendar
                                                ProcessConditionSQLWhere += " AND ProcessTemplates.ShowInEventCalendar = 1 ";
                                                break;
                                            case 8: // Is personal
                                                ProcessConditionSQLWhere += " AND ProcessTemplates.IsPersonal = 1 " ;
                                                break;
                                            case 9: // Show new
                                                ProcessConditionSQLWhere += " AND ProcessTemplates.ShowInNew = 1 ";
                                                break;
                                            case 10: // Show search
                                                ProcessConditionSQLWhere += " AND ProcessTemplates.ShowInSearch = 1 ";
                                                break;
                                            case 11: // show report
                                                ProcessConditionSQLWhere += " AND ProcessTemplates.ShowInReport = 1 ";
                                                break;
                                            case 12: // Organization
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldOrganization ON Processes.ProcessId = ProcessFieldOrganization.ProcessId  JOIN ProcessTemplateFields ProcessTemplateFieldOrganization ON ProcessTemplateFieldOrganization.ProcessTemplateFieldId = ProcessFieldOrganization.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldOrganization.IntValue = " + ProcessCondition.PageSectionProcessConditionInt + " AND (ProcessTemplateFieldOrganization.ProcessTemplatefieldTypeId = 14 OR ProcessTemplateFieldOrganization.ProcessTemplatefieldTypeId = 15 ) ";
                                                break;
                                            case 13: // Project
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldProject ON Processes.ProcessId = ProcessFieldProject.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldProject ON ProcessTemplateFieldProject.ProcessTemplateFieldId = ProcessFieldProject.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldProject.IntValue = " + ProcessCondition.PageSectionProcessConditionInt + "' AND (ProcessTemplateFieldProject.ProcessTemplatefieldTypeId = 16 OR ProcessTemplateFieldProject.ProcessTemplatefieldTypeId = 17) ";
                                                break;
                                            case 14: // creator is user
                                          //      ProcessConditionSQLWhere += " AND Processes.CreatorId = '" + CurrentUser.Id + "' ";
                                                break;
                                            case 15: // role
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldRole ON Processes.ProcessId = ProcessFieldRole.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldRole ON ProcessTemplateFieldRole.ProcessTemplateFieldId = ProcessFieldRole.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldRole.stringValue = '" + ProcessCondition.PageSectionProcessConditionString + "' AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 30 ";
                                                break;
                                            case 16: // securitylevel
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldSecurityLevel ON Processes.ProcessId = ProcessFieldSecurityLevel.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldSecurityLevel ON ProcessTemplateFieldSecurityLevel.ProcessTemplateFieldId = ProcessFieldSecurityLevel.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldSecurityLevel.IntValue <= '" + ProcessCondition.PageSectionProcessConditionInt + "' AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 28 ";
                                                break;
                                            case 18: // Default Organization
                                                ProcessConditionSQLWhere += " AND ProcessFieldOrganization.IntValue = @DefaultOrganization AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 14 ";
                                                break;
                                            case 19: // UserOrganization
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldUserOrganization ON Processes.ProcessId = ProcessFieldUserOrganization.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldUserOrganization ON ProcessTemplateFieldUserOrganization.ProcessTemplateFieldId = ProcessFieldUserOrganization.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldUserOrganization.IntValue IN (SELECT OrganizationId FROM AspNetRoles JOIN AspNetUserRoles ON AspNetRoles.Id = AspNetUserRoles.RoleId WHERE UserId = '" + CurrentUserId + "') AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 14 ";
                                                break;

                                            case 20: // Specific Organization
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldOrganizationRole ON Processes.ProcessId = ProcessFieldOrganizationRole.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldOrganizationRole ON ProcessTemplateFieldOrganizationRole.ProcessTemplateFieldId = ProcessFieldOrganizationRole.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldOrganizationRole.StringValue = '" + ProcessCondition.PageSectionProcessConditionString + "' AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 30 ";
                                                break;
                                            case 21: // UserProject
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldUserProject ON Processes.ProcessId = ProcessFieldUserProject.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldUserProject ON ProcessTemplateFieldUserProject.ProcessTemplateFieldId = ProcessFieldUserProject.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldUserProject.IntValue IN (SELECT ProjectId FROM AspNetRoles JOIN AspNetUserRoles ON AspNetRoles.Id = AspNetUserRoles.RoleId WHERE UserId = '" + CurrentUserId + "') AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 16 ";
                                                break;

                                            case 22: // Specific project
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldProjectRole ON Processes.ProcessId = ProcessFieldProjectRole.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldProjectRole ON ProcessFieldProjectRole.ProcessTemplateFieldId = ProcessTemplateFieldProjectRole.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldProjectRole.StringValue = '" + ProcessCondition.PageSectionProcessConditionString + "' AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 30 ";
                                                break;

                                            case 25: // Content
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldContent ON Processes.ProcessId = ProcessFieldContent.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldContent ON ProcessFieldContent.ProcessTemplateFieldId = ProcessTemplateFieldContent.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldContent.IntValue = " + ProcessCondition.PageSectionProcessConditionInt + " AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 24  ";
                                                break;

                                            case 26: // Content type
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldContentType ON Processes.ProcessId = ProcessFieldContentType.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldContentType ON ProcessFieldContentType.ProcessTemplateFieldId = ProcessTemplateFieldContentType.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldContentType.IntValue IN (SELECT ContentId FROM Contents WHERE ContentTypeID = " + ProcessCondition.PageSectionProcessConditionInt + ") AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 24  ";
                                                break;
                                            case 27: // User is user
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldUserIsUser ON Processes.ProcessId = ProcessFieldUserIsUser.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldUserIsUser ON ProcessFieldUserIsUser.ProcessTemplateFieldId = ProcessTemplateFieldUserIsUser.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldUserIsUser.StringValue = '" + ProcessCondition.PageSectionProcessConditionString + "' AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 12  ";
                                                break;
                                            case 32: // From date
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldFromDate ON Processes.ProcessId = ProcessFieldFromDate.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldFromDate ON ProcessFieldFromDate.ProcessTemplateFieldId = ProcessTemplateFieldFromDate.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldFromDate.DateTimeValue >= '" + ProcessCondition.PageSectionProcessConditionDate + "' AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 4  ";
                                                //PETER TO DO the date time and date time range and date range
                                                break;
                                            case 33: // To date
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldToDate ON Processes.ProcessId = ProcessFieldToDate.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldToDate ON ProcessFieldToDate.ProcessTemplateFieldId = ProcessTemplateFieldToDate.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldToDate.DateTimeValue <= '" + ProcessCondition.PageSectionProcessConditionDate + "' AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 4  ";
                                                break;
                                            case 37: // Person
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldPerson ON Processes.ProcessId = ProcessFieldPerson.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldPerson ON ProcessFieldPerson.ProcessTemplateFieldId = ProcessTemplateFieldPerson.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldPerson.IntValue = " + ProcessCondition.PageSectionProcessConditionInt + " AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 36 ";
                                                break;
                                            case 38: // Content type group
                                                ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldContentTypeGroup ON Processes.ProcessId = ProcessFieldContentTypeGroup.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldContentTypeGroup ON ProcessFieldContentTypeGroup.ProcessTemplateFieldId = ProcessTemplateFieldContentTypeGroup.ProcessTemplateFieldId ";
                                                ProcessConditionSQLWhere += " AND ProcessFieldContentTypeGroup.IntValue IN (SELECT ContentId FROM Contents JOIN ContentTypes ON Contents.ContentTypeId = ContentTypes.ContentTypeId WHERE ContentTypeGroupID = " + ProcessCondition.PageSectionProcessConditionInt + ") AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 24 ";
                                                break;

                                        }
                                    }
                                    var ProcessList = await _processProvider.ProcessForPanel(CurrentUserId, ProcessConditionSQLFrom, ProcessConditionSQLWhere, ProcessConditionSQLContains);
                                    panel.Processes = ProcessList;

                                    break;

                                case 3: //Organizatio (DATA TYPE) List (Type)
                                    break;

                                case 4: //Person (DATA TYPE) List (Type)
                                    break;

                                case 5: //Project (DATA TYPE) List (Type)
                                    break;
                                case 6: //Favorites (DATA TYPE) List (Type)
                                    break;
                                case 7: //Classification (DATA TYPE) List (Type)
                                    break;

                            }
                            break;
                        case 2: //Index only classification (TYPE)
                            break;

                        case 3: //Chat not yet (TYPE)
                            break;

                        case 4: //Personal canendar (TYPE)
                            var PersonalCalendar = await _homeProvider.HomeIndexPersonalCalendar(CurrentUserId);
                            panel.PersonalCalendars = PersonalCalendar;
                            break;

                        case 5: //Organization calendar (TYPE)
                            var OrganizationCalendar = await _homeProvider.HomeIndexOrganizationCalendar(1);
                            panel.OrganizationCalendars = OrganizationCalendar;
                            break;
                        case 6: //Project calendar (TYPE)
                            var ProjectCalendar = await _homeProvider.HomeIndexProjectCalendar(1);
                            panel.ProjectCalendars = ProjectCalendar;
                            break;
                        case 7: //Platform calendar (TYPE)
                            var EventCalendar = await _homeProvider.HomeIndexEventCalendar();
                            panel.EventCalendars = EventCalendar;
                            break;
                        case 8: //General calendar (TYPE)
                            break;

                        case 9: //to do (TYPE)
                            var x = new ToDo(_processProvider);
                            break;

                    }



                    if (panel.PageSectionTypeId == 1 & panel.PageSectionDataTypeId == 2)  //List Todo
                    {
                        
                        //var ContentList = await x.GetList(CurrentUser.Id, CurrentUser.SecurityLevelId);
                        //panel.ToDos = ContentList;
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
