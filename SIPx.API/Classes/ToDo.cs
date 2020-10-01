using SIPx.DataAccess;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.Classes
{
    public class ToDo
    {
        private readonly IProcessProvider _processProvider;

        public ToDo(IProcessProvider processProvider)
        {
            _processProvider = processProvider;
        }
        //public async Task<List<ToDoIndexGet>> GetList(string UserId, int SecurityLevelId)
        //{
        //    {

        //        {

        //            string SQLWhere = " WHERE 1=1 ";
        //            string SQLJOIN = " DECLARE @LanguageId int;" +
        //                "SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + UserId + "' AND UserPreferences.PreferenceTypeId = 1 ;" +


        //            "SELECT Processes.ProcessID " +
        //            "    , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, 'No name for this process')) ProcessTemplateName " +
        //            "    , ISNULL(UserFieldLanguage.Name, ISNULL(DefaultFieldLanguage.Name, 'No name for this Field')) ProcessTemplateFieldName " +
        //            "    , ISNULL(UserStageTypeLanguage.Name, ISNULL(DefaultStageTypeLanguage.Name, 'No name for this Field')) ProcessTemplateStageTypeName " +
        //            " 	 , ProcessFields.StringValue Title " +
        //            "FROM processes " +
        //            "JOIN ProcessFields " +
        //            "    ON Processes.ProcessID = ProcessFields.ProcessFieldID " +
        //            "JOIN processtemplateStages " +
        //            "    ON Processes.ProcessTemplateStageID = ProcessTemplateStages.ProcessTemplateStageID " +
        //            "       AND Processes.ProcessTemplateID = ProcessTemplateStages.ProcessTemplateID " +
        //            "JOIN ProcessTemplateStageTypes " +
        //            "    ON ProcessTemplateStageTypes.ProcessTemplateStageTypeID = ProcessTemplateStages.ProcessTemplateStageTypeID " +
        //            "LEFT JOIN(SELECT ProcessTemplateStageTypeId, Name FROM ProcessTemplateStageTypeLanguages WHERE LanguageId = @LanguageId) UserStageTypeLanguage " +
        //            "    ON UserStageTypeLanguage.ProcessTemplateStageTypeID = ProcessTemplateStageTypes.ProcessTemplateStageTypeId " +
        //            "LEFT JOIN(SELECT ProcessTemplateStageTypeId, Name FROM ProcessTemplateStageTypeLanguages JOIN Settings ON ProcessTemplateStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultStageTypeLanguage " +
        //            "   ON DefaultStageTypeLanguage.ProcessTemplateStageTypeId = ProcessTemplateStageTypes.ProcessTemplateStageTypeId " +
        //            "JOIN ProcessTemplateFields " +
        //            "    ON ProcessTemplateFields.ProcessTemplateFieldID = ProcessFields.ProcessTemplateFieldID " +
        //            "LEFT JOIN(SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageId) UserFieldLanguage " +
        //            "    ON UserFieldLanguage.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldId " +
        //            "LEFT JOIN(SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultFieldLanguage " +
        //            "   ON DefaultFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldId " +
        //            "JOIN ProcessTemplates " +
        //            "    ON PRocesses.ProcessTemplateID = ProcessTemplates.ProcessTemplateID " +
        //            "JOIN ProcessTemplateFlows ON ProcessTemplates.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //            "LEFT JOIN(SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageId) UserLanguage " +
        //            "    ON UserLanguage.ProcessTemplateID = ProcessTemplates.ProcessTemplateId " +
        //            "LEFT JOIN(SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
        //            "   ON DefaultLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateId";
        //            List<int> TemplateIDs = await _processProvider.CreateGetInitialTemplateList();
        //            foreach (var TemplateId in TemplateIDs)
        //            {
        //                List<ProcessTemplateFlowConditionOld> TemplateFlowConditions = await _processProvider.CreateGetFlowConditionList(TemplateId);

        //                if (TemplateFlowConditions.Count() > 0)
        //                { SQLWhere += " AND "; }
        //                foreach (var Condition in TemplateFlowConditions)
        //                {
        //                    //Condition types
        //                    //SELECT ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeId, Name FROM ProcessTemplateFlowConditionTypes JOIN UITermLanguages ON ProcessTemplateFlowConditionTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeID
        //                    //Field types
        //                    //SELECT 'case ' + cast(ProcessTemplateFieldTypes.ProcessTemplateFieldTypeId as char(2))+ ': //', Name FROM ProcessTemplateFieldTypes JOIN UITermLanguages ON ProcessTemplateFieldTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFieldTypes.ProcessTemplateFieldTypeID

        //                    switch (Condition.ProcessTemplateFlowConditionTypeId)
        //                    {
        //                        //Case 1 is Creator User which doesn't happen for a new process 
        //                        //Case 2 is Field which doesn't happen as it would check against default value which doesn't make sense.
        //                        case 3: //Security level user

        //                            //SELECT 'case ' + cast(ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorId as char(2))+ ': //', Name FROM ProcessTemplateFlowConditionComparisonOperators JOIN UITermLanguages ON ProcessTemplateFlowConditionComparisonOperators.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorID
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 28 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue ";
        //                            switch (Condition.ComparisonOperatorId)
        //                            {
        //                                case 2:
        //                                    SQLWhere += " = ";
        //                                    break;
        //                                case 3:
        //                                    SQLWhere += " > ";
        //                                    break;
        //                                case 4:
        //                                    SQLWhere += " >= ";
        //                                    break;
        //                                case 5:
        //                                    SQLWhere += " >= ";
        //                                    break;
        //                                case 6:
        //                                    SQLWhere += " <= ";
        //                                    break;
        //                                case 7:
        //                                    SQLWhere += " <> ";
        //                                    break;

        //                            }
        //                            SQLWhere += SecurityLevelId.ToString();
        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
        //                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
        //                            break;
        //                        case 4: //User role
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 30 AND Table" + Condition.ProcessTemplateFlowId + "a.StringValue IN (SELECT RoleId FROM AspNetUserRoles WHERE UserId = '" + UserId + "') ";

        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
        //                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";

        //                            break;
        //                        //  Manager user field there is no user yet stored in the process
        //                        case 6: //   Organization user
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + UserId + "' AND AspNetRoleClaims.ClaimValue = 'OrganizationRight') ";

        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
        //                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
        //                            break;
        //                        case 7: //	Organization role user
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeId = 14 " +

        //                                " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeId = 30 " +
        //                                " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserId = '" + UserId + "'  ";

        //                            //Link to field of project
        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                                    "Field ON Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "StageField.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateFieldId " +
        //                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField.ProcessTemplateStageId "

        //                                    //Link to field of role
        //                                    + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                                    "FieldRole ON Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "StageFieldRole.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateFieldId " +
        //                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.ProcessTemplateStageId " +
        //                                " JOIN aspnetuserroles Table" + Condition.ProcessTemplateFlowId + "UserRole " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "UserROle.RoleId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.StringValue " +
        //                                " JOIN aspnetroleclaims Table" + Condition.ProcessTemplateFlowId + "RoleClaim " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTemplateFlowId + "UserRole.RoleId " +
        //                                    " AND CAST(Table" + Condition.ProcessTemplateFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTemplateFlowId + "StageField.IntValue "
        //                                    ;
        //                            break;
        //                        //	Organization parent user no parent
        //                        //	Organization parent role user
        //                        case 10: //	Project user
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 16 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + UserId + "' AND AspNetRoleClaims.ClaimValue = 'ProjectRight') ";

        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
        //                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
        //                            break;
        //                        case 11: //	Project role user
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeId = 16 " +

        //                                " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeId = 30 " +
        //                                " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserId = '" + UserId + "'  ";

        //                            //Link to field of project
        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                                    "Field ON Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "StageField.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateFieldId " +
        //                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField.ProcessTemplateStageId "

        //                                    //Link to field of role
        //                                    + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                                    "FieldRole ON Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "StageFieldRole.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateFieldId " +
        //                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.ProcessTemplateStageId " +
        //                                " JOIN aspnetuserroles Table" + Condition.ProcessTemplateFlowId + "UserRole " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "UserROle.RoleId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.StringValue " +
        //                                " JOIN aspnetroleclaims Table" + Condition.ProcessTemplateFlowId + "RoleClaim " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTemplateFlowId + "UserRole.RoleId " +
        //                                    " AND CAST(Table" + Condition.ProcessTemplateFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTemplateFlowId + "StageField.IntValue "
        //                                    ;
        //                            break;
        //                        //	Project parent user
        //                        //	Project parent role user
        //                        case 14: //	Default organization user
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT persons.DefaultOrganizationId FROM persons WHERE persons.UserID'" + UserId + "' ) ";

        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
        //                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
        //                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
        //                            break;
        //                        case 15: //	Open bracket
        //                            SQLWhere += " ( ";
        //                            break;
        //                        case 16: //	and
        //                            SQLWhere += " AND ";
        //                            break;
        //                        case 17: //	or
        //                            SQLWhere += " OR ";
        //                            break;
        //                        case 18: //	Close bracket
        //                            SQLWhere += " ) ";
        //                            break;
        //                        //	User
        //                        //	Relation to creator
        //                        //	Relation to user field
        //                        case 22: //	Classification relation both value and classification itself
        //                            break;
        //                        case 23: //	Classification relation type
        //                            break;
        //                    }
        //                }
        //            }

        //            List<ToDoIndexGet> NewTemplateList = await _processProvider.ToDoIndexGet(SQLJOIN + SQLWhere);

        //            return NewTemplateList;

        //        }
        //    }
        //}
    }
}
