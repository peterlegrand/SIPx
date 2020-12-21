using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;

namespace SIPx.API.Classes
{
    public class FrontPanels
    {
        private readonly IClassificationValueProvider _classificationValueProvider;
        private readonly IContentProvider _contentProvider;
        private readonly IProcessProvider _processProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IPersonProvider _personProvider;
        private readonly IProjectProvider _projectProvider;

        public FrontPanels( IClassificationValueProvider classificationValueProvider, IContentProvider contentProvider , IProcessProvider processProvider, IOrganizationProvider organizationProvider, IPersonProvider personProvider, IProjectProvider projectProvider)
        {
            _classificationValueProvider = classificationValueProvider;
            _contentProvider = contentProvider;
            _processProvider = processProvider;
            _organizationProvider = organizationProvider;
            _personProvider = personProvider;
            _projectProvider = projectProvider;
        }
        public async Task<List<ContentForPanel>> ContentList(SipUser CurrentUser, int PageSectionId)
        {

            string ContentConditionSQLFrom =
                " DECLARE @LanguageId int; " +
                " SELECT @LanguageId = IntPreference " +
                " FROM UserPreferences " +
                " WHERE USerId = '" + CurrentUser.Id + "' " +
                " AND UserPreferences.PreferenceTypeId = 1; " +
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
                " ON Modifier.UserId = Contents.ModifierID ";
            string ContentConditionSQLWhere = " WHERE 1=1 ";
            string ContentConditionSQLContains = "";
            var ContentConditions = await _contentProvider.PanelCondition(PageSectionId);
            foreach (var ContentCondition in ContentConditions)
            {
                switch (ContentCondition.PageSectionContentConditionTypeId)
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
                        ContentConditionSQLWhere += " AND Contents.ContentId IN (SELECT CotentId FROM ContentClassificationValues WHERE ClassificationValueId = " + ContentCondition.PageSectionContentConditionInt + ") ";
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
            var ContentList = await _contentProvider.Panel(ContentConditionSQLFrom, ContentConditionSQLWhere, ContentConditionSQLContains);
            return ContentList;
        }

        public async Task<List<ProcessForPanel>> ProcessList(SipUser CurrentUser, int PageSectionId)
        {
            string ProcessConditionSQLFrom = " SELECT Processes.ProcessId, ISNULL(ProcessFieldSubject.StringValue,'') As Subject, ProcessTemplateLanguages.Name ProcessTemplateName FROM Processes JOIN ProcessFields ProcessFieldSubject ON ProcessFieldSubject.ProcessId = Processes.ProcessId " +
                                     " JOIN ProcessTemplatefields ProcessTemplateFieldSubject ON  ProcessTemplateFieldSubject.ProcessTemplatefieldId = ProcessFieldSubject.ProcessTemplatefieldId  " +
                                     " JOIN ProcessTemplates ON Processes.ProcessTemplateId =  ProcessTemplates.ProcessTemplateId JOIN ProcessTemplateStages ON Processes.ProcessTemplateStageId = ProcessTemplateStages.ProcessTemplateStageID ";
            string ProcessConditionSQLWhere = " WHERE ProcessTemplateFieldSubject.ProcessTemplateFieldTypeId = 1 AND ProcessTemplateStages.InToDo = 1 ";
            string ProcessConditionSQLContains = "";
            var ProcessConditions = await _processProvider.PanelCondition(PageSectionId);
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
                        ProcessConditionSQLWhere += " AND ProcessTemplates.ShowInPersonalCalendar = 1 AND ProcessFieldMyCalendar.StringValue = '" + CurrentUser.Id + "' AND ProcessTemplateFieldMyCalendar.ProcessTemplatefieldTypeId = 12 ";
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
                        ProcessConditionSQLWhere += " AND ProcessTemplates.IsPersonal = 1 ";
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
                        ProcessConditionSQLWhere += " AND Processes.CreatorId = '" + CurrentUser.Id + "' ";
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
                        ProcessConditionSQLWhere += " AND ProcessFieldUserOrganization.IntValue IN (SELECT OrganizationId FROM AspNetRoles JOIN AspNetUserRoles ON AspNetRoles.Id = AspNetUserRoles.RoleId WHERE UserId = '" + CurrentUser.Id + "') AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 14 ";
                        break;

                    case 20: // Specific Organization
                        ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldOrganizationRole ON Processes.ProcessId = ProcessFieldOrganizationRole.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldOrganizationRole ON ProcessTemplateFieldOrganizationRole.ProcessTemplateFieldId = ProcessFieldOrganizationRole.ProcessTemplateFieldId ";
                        ProcessConditionSQLWhere += " AND ProcessFieldOrganizationRole.StringValue = '" + ProcessCondition.PageSectionProcessConditionString + "' AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 30 ";
                        break;
                    case 21: // UserProject
                        ProcessConditionSQLFrom += " JOIN ProcessFields ProcessFieldUserProject ON Processes.ProcessId = ProcessFieldUserProject.ProcessId JOIN ProcessTemplateFields ProcessTemplateFieldUserProject ON ProcessTemplateFieldUserProject.ProcessTemplateFieldId = ProcessFieldUserProject.ProcessTemplateFieldId ";
                        ProcessConditionSQLWhere += " AND ProcessFieldUserProject.IntValue IN (SELECT ProjectId FROM AspNetRoles JOIN AspNetUserRoles ON AspNetRoles.Id = AspNetUserRoles.RoleId WHERE UserId = '" + CurrentUser.Id + "') AND ProcessTemplateFieldUser.ProcessTemplatefieldTypeId = 16 ";
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
            var ProcessList = await _processProvider.Panel(CurrentUser.Id, ProcessConditionSQLFrom, ProcessConditionSQLWhere, ProcessConditionSQLContains);
            return ProcessList;
        }
        public async Task<List<OrganizationForPanel>> OrganizationList(SipUser CurrentUser, int PageSectionId)
        {
            //string OrganizationConditionSQLFrom = " DECLARE @LanguageId int; " +
            //    " SELECT @LanguageId = IntPreference " +
            //    " FROM UserPreferences " +
            //    " WHERE USerId = '" + CurrentUser.Id + "' " +
            //    " AND UserPreferences.PreferenceTypeId = 1; " +
            //    " SELECT " +
            //    "  Organizations.OrganizationID " +
            //    "  , Organizations.OrganizationTypeID " +
            //    "  , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, \"No name for this organization\")) Name " +
            //    "  , ISNULL(UserLanguage.Description, ISNULL(DefaultLanguage.Description, \"No description for this organization\")) Description " +
            //    "  , ISNULL(UserLanguage.MenuName, ISNULL(DefaultLanguage.MenuName, \"No menu name for this organization\")) MenuName " +
            //    "  , ISNULL(UserLanguage.MouseOver, ISNULL(DefaultLanguage.MouseOver, \"No mouse over for this organization\")) MouseOver " +
            //    "  , ISNULL(UserTypeLanguage.Name, ISNULL(DefaultTypeLanguage.Name, \"No name for this organization type\")) OrganizationTypeName " +
            //    "  , ISNULL(UserStatusName.Customization, StatusName.Name) StatusName " +
            //    "  , OrganizationTypes.Internal " +
            //    "  , OrganizationTypes.LegalEntity " +
            //    "  , Creator.FirstName + ' ' + Creator.LastName CreatorName " +
            //    "  , Creator.PersonID CreatorID " +
            //    "  , Organizations.CreatedDate " +
            //    "  , Modifier.FirstName + ' ' + Modifier.LastName ModifierName " +
            //    "  , Modifier.PersonId ModifierID " +
            //    "  , Organizations.ModifiedDate " +
            //    "  , CONCAT('controlID', Organizations.OrganizationId) ControlId " +
            //    " FROM Organizations JOIN Statuses " +
            //    "  ON Statuses.StatusId = Organizations.StatusID " +
            //    " JOIN OrganizationTypes " +
            //    "  ON Organizations.OrganizationTypeId = OrganizationTypes.OrganizationTypeID " +
            //    " LEFT JOIN(SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage " +
            //    "  ON UserLanguage.OrganizationID = Organizations.OrganizationID " +
            //    " LEFT JOIN(SELECT OrganizationId, Name, Description, MenuName, MouseOver FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
            //    "  ON DefaultLanguage.OrganizationId = Organizations.OrganizationID " +
            //    " LEFT JOIN(SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages WHERE LanguageId = @LanguageID) UserTypeLanguage " +
            //    "  ON UserTypeLanguage.OrganizationTypeID = Organizations.OrganizationTypeID " +
            //    "LEFT JOIN(SELECT OrganizationTypeId, Name FROM OrganizationTypeLanguages JOIN Settings ON OrganizationTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultTypeLanguage " +
            //    " ON DefaultTypeLanguage.OrganizationTypeID = Organizations.OrganizationTypeID " +
            //    " JOIN UITermLanguages StatusName " +
            //    " ON Statuses.NameTermId = StatusName.UITermId " +
            //    " LEFT JOIN(SELECT* FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName " +
            //    "  ON Statuses.NameTermId = UserStatusName.UITermId" +
            //    " JOIN Persons Creator " +
            //    "  ON Creator.UserId = Organizations.CreatorID " +
            //    " JOIN Persons Modifier " +
            //    "  ON Modifier.UserId = Organizations.ModifierID ";

            string OrganizationConditionSQLFrom = "  ";
            string OrganizationConditionSQLWhere = " WHERE  StatusName.LanguageId = @LanguageId ";
            string OrganizationConditionSQLContains = "";
            var OrganizationConditions = await _organizationProvider.PanelCondition(PageSectionId);
            foreach (var OrganizationCondition in OrganizationConditions)
            {
                switch (OrganizationCondition.PageSectionOrganizationConditionTypeId)
                {
                    case 1: // Contains
                        OrganizationConditionSQLFrom += " JOIN ( SELECT OrganizationId FROM OrganizationLanguages WHERE LanguageId = @LanguageID AND CONTAINS (OrganizationLanguages.FullText, '" + OrganizationCondition.PageSectionOrganizationConditionString + "' )) OrganizationTable" + OrganizationCondition.PageSectionOrganizationConditionId + " ON  OrganizationTable" + OrganizationCondition.PageSectionOrganizationConditionId + ".OrganizationId = Organizations.OrganizationID " ;

//                        OrganizationConditionSQLWhere += " AND CONTAINS = " + OrganizationCondition.PageSectionOrganizationConditionInt;
                        break;
                    case 2: // Parent organization
                        OrganizationConditionSQLWhere += " AND Organizations.ParentOrganizationId = " + OrganizationCondition.PageSectionOrganizationConditionInt;
                        break;
                    case 3: // Country
                        OrganizationConditionSQLWhere += " AND Organizations.OrganizationId IN (SELECT OrganizationId FROM OrganizationAddresses WHERE CountryId = " + OrganizationCondition.PageSectionOrganizationConditionInt + " ) ";
                        break;
                    case 4: // State province
                        OrganizationConditionSQLWhere += " AND Organizations.OrganizationId IN (SELECT OrganizationId FROM OrganizationAddresses WHERE ProvinceState LIKE '%" + OrganizationCondition.PageSectionOrganizationConditionString + "%' ) ";
                        break;
                    case 5: // Organization type
                        OrganizationConditionSQLWhere += " AND Organizations.OrganizationTypeId = " + OrganizationCondition.PageSectionOrganizationConditionInt;
                        break;
                    case 6: // My organization
                        OrganizationConditionSQLWhere += " AND Organizations.OrganizationId IN (SELECT AspNetRoles.OrganizationId FROM AspNetRoles JOIN AspNetUserRoles ON AspNetRoles.Id JOIN AspNetUserRoles.RoleId WHERE  AspNetUserRoles.UserId = '" + CurrentUser.Id + "' )  "; 
                        break;
                    case 7: // Internal
                        OrganizationConditionSQLWhere += " AND Organizations.OrganizationTypeId IN (SELECT OrganizationTypeId FROM OrganizationTypes WHERE Internal = " + OrganizationCondition.PageSectionOrganizationConditionInt + " )";
                        break;
                    case 8: // City
                        OrganizationConditionSQLWhere += " AND Organizations.OrganizationId IN (SELECT OrganizationId FROM OrganizationAddresses WHERE City LIKE '%" + OrganizationCondition.PageSectionOrganizationConditionString + "%' ) ";
                        break;
                    case 9: // Legal entity
                        OrganizationConditionSQLWhere += " AND Organizations.OrganizationTypeId IN (SELECT OrganizationTypeId FROM OrganizationTypes WHERE LegalEntity = " + OrganizationCondition.PageSectionOrganizationConditionInt + " )";
                        break;
                }
            }
            var OrganizationList = await _organizationProvider.Panel(CurrentUser.Id, OrganizationConditionSQLFrom, OrganizationConditionSQLWhere, OrganizationConditionSQLContains);
            return OrganizationList;
        }

        public async Task<List<PersonForPanel>> PersonList(SipUser CurrentUser, int PageSectionId)
        {
            //string PersonConditionSQLFrom = " DECLARE @LanguageId int; " +
            //    " SELECT @LanguageId = IntPreference " +
            //    " FROM UserPreferences " +
            //    " WHERE USerId = '" + CurrentUser.Id + "' " +
            //    " AND UserPreferences.PreferenceTypeId = 1; " +
            //    " SELECT ISNULL(Salutation, '') Salutation " +
            //    "  , ISNULL(FirstName, '')FirstName " +
            //    "  , ISNULL(MiddleName, '') MiddleName " +
            //    "  , ISNULL(LastName, '') LastName " +
            //    "  , ISNULL(NickName, '') NickName " +
            //    "  , ISNULL(FirstNameLocal, '') FirstNameLocal " +
            //    "  , ISNULL(MiddleNameLocal, '') MiddleNameLocal " +
            //    "  , ISNULL(LastNameLocal, '') LastNameLocal " +
            //    "  , CASE WHEN UserID IS NULL THEN 1 ELSE 0 END AS IsUser " +
            //    "  , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, 'No name for the organization')) DefaultOrganizationName " +
            //    "  , Creator.FirstName + ' ' + Creator.LastName CreatorName " +
            //    "  , Creator.PersonID CreatorID " +
            //    "  , Persons.CreatedDate " +
            //    "  , Modifier.FirstName + ' ' + Modifier.LastName ModifierName " +
            //    "  , Modifier.PersonId ModifierID " +
            //    "  , Persons.ModifiedDate " +
            //    "  , CONCAT('controlID', Persons.PersonId) ControlId " +
            //    " FROM  Persons " +
            //    " LEFT JOIN(SELECT OrganizationId, Name FROM OrganizationLanguages WHERE LanguageId = @LanguageID) UserLanguage " +
            //    "  ON UserLanguage.OrganizationID = Persons.DefaultOrganizationID " +
            //    " LEFT JOIN(SELECT OrganizationId, Name FROM OrganizationLanguages JOIN Settings ON OrganizationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
            //    "  ON DefaultLanguage.OrganizationId = Persons.DefaultOrganizationID " +
            //    " JOIN Persons Creator " +
            //    "  ON Creator.UserId = Persons.CreatorID " +
            //    " JOIN Persons Modifier " +
            //    "  ON Modifier.UserId = Persons.ModifierID ";

            string PersonConditionSQLFrom = "  ";
            string PersonConditionSQLWhere = " WHERE 1=1 ";
            string PersonConditionSQLContains = "";
            var PersonConditions = await _personProvider.PanelCondition(PageSectionId);
            foreach (var PersonCondition in PersonConditions)
            {
                switch (PersonCondition.PageSectionPersonConditionTypeId)
                {
                    case 1: // Contains
                        PersonConditionSQLWhere += " AND CONTAINS (Persons.FullText, '" + PersonCondition.PageSectionPersonConditionString + "' ) "; 

                        //                        PersonConditionSQLWhere += " AND CONTAINS = " + PersonCondition.PageSectionPersonConditionInt;
                        break;
                    case 2: // Default organization
                        PersonConditionSQLWhere += " AND Persons.DefaultOrganizationId = " + PersonCondition.PageSectionPersonConditionInt;
                        break;
                    case 3: // Organization
                        PersonConditionSQLWhere += " AND Persons.PersonId IN (SELECT  PersonId FROM AspNetRoles JOIN AspNetUserRoles ON AspNetRoles.Id = AspNetUserRoles.RoleId JOIN Persons ON Persons.UserID = AspNetUserRoles.UserId WHERE AspNetRoles.OrganizationId = " + PersonCondition.PageSectionPersonConditionInt + " ) ";
                        break;
                    case 4: // Project
                        PersonConditionSQLWhere += " AND Persons.PersonId IN (SELECT  PersonId FROM AspNetRoles JOIN AspNetUserRoles ON AspNetRoles.Id = AspNetUserRoles.RoleId JOIN Persons ON Persons.UserID = AspNetUserRoles.UserId WHERE AspNetRoles.ProjectId = " + PersonCondition.PageSectionPersonConditionInt + " ) ";
                        break;
                    case 5: // Country
                        PersonConditionSQLWhere += " AND Persons.PersonId IN (SELECT PersonId FROM PersonAddresses WHERE CountryId = " + PersonCondition.PageSectionPersonConditionInt + " ) ";
                        break;
                    case 6: // State / Province
                        PersonConditionSQLWhere += " AND Persons.PersonId IN (SELECT PersonId FROM PersonAddresses WHERE ProvinceState LIKE '%" + PersonCondition.PageSectionPersonConditionString + "%' ) ";
                        break;
                    case 7: // City
                        PersonConditionSQLWhere += " AND Persons.PersonId IN (SELECT PersonId FROM PersonAddresses WHERE City LIKE '%" + PersonCondition.PageSectionPersonConditionString + "%' ) ";
                        break;
                    case 8: // My relations
                        PersonConditionSQLWhere += " AND ( Persons.PersonId IN (SELECT FromPersonId FROM PersonRelations JOIN Persons ON PersonRelations.ToPersonID = PersonId WHERE UserId = '" + CurrentUser.Id + "') OR Persons.PersonId IN (SELECT ToPersonId FROM PersonRelations JOIN Persons ON PersonRelations.FromPersonID = PersonId WHERE UserId = '" + CurrentUser.Id+"') ) ";
                        break;
                    case 9: // Is user
                        if (PersonCondition.PageSectionPersonConditionInt == 1)
                        {
                            PersonConditionSQLWhere += " AND Persons.UserId IS NOT NULL ";
                        }
                        else
                        {
                            PersonConditionSQLWhere += " AND Persons.UserId IS NULL ";
                        }
                        break;
                }
            }
            var PersonList = await _personProvider.Panel(CurrentUser.Id, PersonConditionSQLFrom, PersonConditionSQLWhere, PersonConditionSQLContains);
            return PersonList;
        }
        public async Task<List<ProjectForPanel>> ProjectList(SipUser CurrentUser, int PageSectionId)
        {
            //string ProjectConditionSQLFrom = " DECLARE @LanguageId int; " +
            //    " SELECT @LanguageId = IntPreference " +
            //    " FROM UserPreferences " +
            //    " WHERE USerId = '" + CurrentUser.Id + "' " +
            //    " AND UserPreferences.PreferenceTypeId = 1; " +
            //    " SELECT " +
            //    "  Projects.ProjectID " +
            //    "  , Projects.ProjectTypeID " +
            //    "  , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, 'No name for this Project')) Name " +
            //    "  , ISNULL(UserLanguage.Description, ISNULL(DefaultLanguage.Description, 'No description for this Project')) Description " +
            //    "  , ISNULL(UserLanguage.MenuName, ISNULL(DefaultLanguage.MenuName, 'No menu name for this Project')) MenuName " +
            //    "  , ISNULL(UserLanguage.MouseOver, ISNULL(DefaultLanguage.MouseOver, 'No mouse over for this Project')) MouseOver " +
            //    "  , ISNULL(UserTypeLanguage.Name, ISNULL(DefaultTypeLanguage.Name, 'No name for this Project type')) ProjectTypeName " +
            //    "  , ISNULL(UserStatusName.Customization, StatusName.Name) StatusName " +
            //    "  , Creator.FirstName + ' ' + Creator.LastName CreatorName " +
            //    "  , Creator.PersonID CreatorID " +
            //    "  , Projects.CreatedDate " +
            //    "  , Modifier.FirstName + ' ' + Modifier.LastName ModifierName " +
            //    "  , Modifier.PersonId ModifierID " +
            //    "  , Projects.ModifiedDate " +
            //    "  , CONCAT('controlID', Projects.ProjectId) ControlId " +
            //    " FROM Projects JOIN Statuses " +
            //    "  ON Statuses.StatusId = Projects.StatusID " +
            //    " JOIN ProjectTypes " +
            //    "  ON Projects.ProjectTypeId = ProjectTypes.ProjectTypeID " +
            //    " LEFT JOIN(SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages WHERE LanguageId = @LanguageID) UserLanguage " +
            //    "  ON UserLanguage.ProjectID = Projects.ProjectID " +
            //    " LEFT JOIN(SELECT ProjectId, Name, Description, MenuName, MouseOver FROM ProjectLanguages JOIN Settings ON ProjectLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
            //    "  ON DefaultLanguage.ProjectId = Projects.ProjectID " +
            //    " LEFT JOIN(SELECT ProjectTypeId, Name FROM ProjectTypeLanguages WHERE LanguageId = @LanguageID) UserTypeLanguage " +
            //    "  ON UserTypeLanguage.ProjectTypeID = Projects.ProjectTypeID " +
            //    "LEFT JOIN(SELECT ProjectTypeId, Name FROM ProjectTypeLanguages JOIN Settings ON ProjectTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultTypeLanguage " +
            //    " ON DefaultTypeLanguage.ProjectTypeID = Projects.ProjectTypeID " +
            //    " JOIN UITermLanguages StatusName " +
            //    " ON Statuses.NameTermId = StatusName.UITermId " +
            //    " LEFT JOIN(SELECT* FROM UITermLanguageCustomizations WHERE UITermLanguageCustomizations.LanguageId = @LanguageID)  UserStatusName " +
            //    "  ON Statuses.NameTermId = UserStatusName.UITermId" +
            //    " JOIN Persons Creator " +
            //    "  ON Creator.UserId = Projects.CreatorID " +
            //    " JOIN Persons Modifier " +
            //    "  ON Modifier.UserId = Projects.ModifierID ";

            string ProjectConditionSQLFrom = " ";
            string ProjectConditionSQLWhere = " WHERE  StatusName.LanguageId = @LanguageId  ";
            string ProjectConditionSQLContains = "";
            var ProjectConditions = await _projectProvider.PanelCondition(PageSectionId);
            foreach (var ProjectCondition in ProjectConditions)
            {
                switch (ProjectCondition.PageSectionProjectConditionTypeId)
                {
                    case 1: // Parent Project
                        ProjectConditionSQLWhere += " AND Projects.ParentProjectId = " + ProjectCondition.PageSectionProjectConditionInt;
                        break;
                    case 2: // My Project
                        ProjectConditionSQLWhere += " AND Projects.ProjectId IN (SELECT AspNetRoles.ProjectId FROM AspNetRoles JOIN AspNetUserRoles ON AspNetRoles.Id JOIN AspNetUserRoles.RoleId WHERE  AspNetUserRoles.UserId = '" + CurrentUser.Id + "' )  ";
                        break;
                    case 3: // Contains
                        ProjectConditionSQLFrom += " JOIN ( SELECT ProjectId FROM ProjectLanguages WHERE LanguageId = @LanguageID AND CONTAINS (ProjectLanguages.FullText, '" + ProjectCondition.PageSectionProjectConditionString + "' )) ProjectTable" + ProjectCondition.PageSectionProjectConditionId + " ON  ProjectTable" + ProjectCondition.PageSectionProjectConditionId + ".ProjectId = Projects.ProjectID ";
                        break;
                    case 4: // Project type
                        ProjectConditionSQLWhere += " AND Projects.ProjectTypeId = " + ProjectCondition.PageSectionProjectConditionInt;
                        break;
                }
            }
            var ProjectList = await _projectProvider.Panel(CurrentUser.Id, ProjectConditionSQLFrom, ProjectConditionSQLWhere, ProjectConditionSQLContains);
            return ProjectList;
        }
        public async Task<List<ClassificationValueForPanel>> ClassificationValueList(SipUser CurrentUser, int PageSectionId)
        {
            //string ClassificationValueConditionSQLFrom = " DECLARE @LanguageId int; " +
            //" SELECT @LanguageId = IntPreference " +
            //" FROM UserPreferences " +
            //" WHERE USerId = '" + CurrentUser.Id + "' " +
            //"  AND UserPreferences.PreferenceTypeId = 1; " +
            //" SELECT ClassificationValues.ClassificationValueID " +
            //"  , ClassificationValues.ClassificationID " +
            //"  , ISNULL(UserClassificationValueLanguage.Name, ISNULL(DefaultClassificationValueLanguage.Name, 'No name for this value')) Name " +
            //"  , ISNULL(UserClassificationValueLanguage.Description, ISNULL(DefaultClassificationValueLanguage.Description, 'No description for this value')) Description " +
            //"  , ISNULL(UserClassificationValueLanguage.MenuName, ISNULL(DefaultClassificationValueLanguage.MenuName, 'No menu name for this value')) MenuName " +
            //"  , ISNULL(UserClassificationValueLanguage.MouseOver, ISNULL(DefaultClassificationValueLanguage.MouseOver, 'No drop Mouse over for this value')) MouseOver " +
            //"  , ISNULL(UserClassificationValueLanguage.DropDownName, ISNULL(DefaultClassificationValueLanguage.DropDownName, 'No drop down name for this value')) DropDownName " +
            //"  , ClassificationValues.ParentValueID " +
            //"  , ISNULL(UserParentLanguage.Name, ISNULL(DefaultParentLanguage.Name, 'No parent name for this value')) ParentName " +
            //"  , ClassificationValues.DateFrom " +
            //"  , ClassificationValues.DateTo " +
            //"  , Creator.FirstName + ' ' + Creator.LastName CreatorName " +
            //"  , Creator.PersonID CreatorID " +
            //"  , ClassificationValues.CreatedDate " +
            //"  , Modifier.FirstName + ' ' + Modifier.LastName ModifierName " +
            //"  , Modifier.PersonID ModifierID " +
            //"  , ClassificationValues.ModifiedDate " +
            //" FROM ClassificationValues " +
            //" LEFT JOIN(SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserClassificationValueLanguage " +
            //"  ON UserClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID " +
            //" LEFT JOIN(SELECT ClassificationValueId, Name, Description, MenuName, MouseOver, DropDownName, PageName, PageDescription, HeaderName, HeaderDescription, TopicName FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationValueLanguage " +
            //"  ON DefaultClassificationValueLanguage.ClassificationValueId = ClassificationValues.ClassificationValueID " +
            //" LEFT JOIN(SELECT ClassificationValueId, Name FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID) UserParentLanguage " +
            //" ON UserParentLanguage.ClassificationValueId = ClassificationValues.ParentValueID " +
            //" LEFT JOIN(SELECT ClassificationValueId, Name FROM ClassificationValueLanguages JOIN Settings ON ClassificationValueLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultParentLanguage " +
            //" ON DefaultParentLanguage.ClassificationValueId = ClassificationValues.ParentValueID " +
            //" LEFT JOIN(SELECT ClassificationId, Name FROM ClassificationLanguages WHERE LanguageId = @LanguageID) UserClassificationLanguage " +
            //" ON UserClassificationLanguage.ClassificationId = ClassificationValues.ClassificationID " +
            //" LEFT JOIN(SELECT ClassificationId, Name FROM ClassificationLanguages JOIN Settings ON ClassificationLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultClassificationLanguage " +
            //" ON DefaultClassificationLanguage.ClassificationId = ClassificationValues.ClassificationID " +
            //" JOIN Persons Creator " +
            //" ON Creator.UserId = ClassificationValues.CreatorID " +
            //" JOIN Persons Modifier " +
            //" ON Modifier.UserId = ClassificationValues.ModifierID ";

            string ClassificationValueConditionSQLFrom = " ";
            string ClassificationValueConditionSQLWhere = " WHERE 1 = 1 ";
            string ClassificationValueConditionSQLContains = "";
            var ClassificationValueConditions = await _classificationValueProvider.PanelCondition(PageSectionId);
            foreach (var ClassificationValueCondition in ClassificationValueConditions)
            {
                switch (ClassificationValueCondition.PageSectionClassificationValueConditionTypeId)
                {
                    case 1: // Contains
                        ClassificationValueConditionSQLFrom += " JOIN ( SELECT DISTINCT ClassificationValueId FROM ClassificationValueLanguages WHERE LanguageId = @LanguageID AND CONTAINS (ClassificationValueLanguages.FullText, '" + ClassificationValueCondition.PageSectionClassificationValueConditionString + "' )) ClassificationValueTable" + ClassificationValueCondition.PageSectionClassificationValueConditionId + " ON  ClassificationValueTable" + ClassificationValueCondition.PageSectionClassificationValueConditionId + ".ClassificationValueId = ClassificationValues.ClassificationValueID ";
                        break;
                    case 2: // Classification
                        ClassificationValueConditionSQLWhere += " AND ClassificationValues.ClassificationId = " + ClassificationValueCondition.PageSectionClassificationValueConditionInt ;
                        break;
                    case 3: // Level Still inactive
                        break;
                    case 4: // Parent value still inactive
                        break;
                }
            }
            var ClassificationValueList = await _classificationValueProvider.Panel(CurrentUser.Id, ClassificationValueConditionSQLFrom, ClassificationValueConditionSQLWhere, ClassificationValueConditionSQLContains);
            return ClassificationValueList;
        }
    }
}
