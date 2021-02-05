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

        // PETER REMARK This has been replaced by frontprocesstodologic
        //public async Task<List<ToDoIndexGet>> GetList(string UserId, int SecurityLevelId)
        //{
        //    {

        //        {

        //            string SQLWhere = " WHERE 1=1 ";
        //            string SQLJOIN = " DECLARE @LanguageId int;" +
        //                "SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + UserId + "' AND UserPreferences.PreferenceTypeId = 1 ;" +


        //            "SELECT Processes.ProcessID " +
        //            "    , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, 'No name for this process')) ProcessTypeName " +
        //            "    , ISNULL(UserFieldLanguage.Name, ISNULL(DefaultFieldLanguage.Name, 'No name for this Field')) ProcessTypeFieldName " +
        //            "    , ISNULL(UserStageTypeLanguage.Name, ISNULL(DefaultStageTypeLanguage.Name, 'No name for this Field')) ProcessTypeStageTypeName " +
        //            " 	 , ProcessFields.StringValue Title " +
        //            "FROM processes " +
        //            "JOIN ProcessFields " +
        //            "    ON Processes.ProcessID = ProcessFields.ProcessFieldID " +
        //            "JOIN processtypeStages " +
        //            "    ON Processes.ProcessTypeStageID = ProcessTypeStages.ProcessTypeStageID " +
        //            "       AND Processes.ProcessTypeID = ProcessTypeStages.ProcessTypeID " +
        //            "JOIN ProcessTypeStageTypes " +
        //            "    ON ProcessTypeStageTypes.ProcessTypeStageTypeID = ProcessTypeStages.ProcessTypeStageTypeID " +
        //            "LEFT JOIN(SELECT ProcessTypeStageTypeId, Name FROM ProcessTypeStageTypeLanguages WHERE LanguageId = @LanguageId) UserStageTypeLanguage " +
        //            "    ON UserStageTypeLanguage.ProcessTypeStageTypeID = ProcessTypeStageTypes.ProcessTypeStageTypeId " +
        //            "LEFT JOIN(SELECT ProcessTypeStageTypeId, Name FROM ProcessTypeStageTypeLanguages JOIN Settings ON ProcessTypeStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultStageTypeLanguage " +
        //            "   ON DefaultStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStageTypes.ProcessTypeStageTypeId " +
        //            "JOIN ProcessTypeFields " +
        //            "    ON ProcessTypeFields.ProcessTypeFieldID = ProcessFields.ProcessTypeFieldID " +
        //            "LEFT JOIN(SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageId) UserFieldLanguage " +
        //            "    ON UserFieldLanguage.ProcessTypeFieldID = ProcessTypeFields.ProcessTypeFieldId " +
        //            "LEFT JOIN(SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultFieldLanguage " +
        //            "   ON DefaultFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId " +
        //            "JOIN ProcessTypes " +
        //            "    ON PRocesses.ProcessTypeID = ProcessTypes.ProcessTypeID " +
        //            "JOIN ProcessTypeFlows ON ProcessTypes.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //            "LEFT JOIN(SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageId) UserLanguage " +
        //            "    ON UserLanguage.ProcessTypeID = ProcessTypes.ProcessTypeId " +
        //            "LEFT JOIN(SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
        //            "   ON DefaultLanguage.ProcessTypeId = ProcessTypes.ProcessTypeId";
        //            List<int> TemplateIDs = await _processProvider.CreateGetInitialTemplateList();
        //            foreach (var TemplateId in TemplateIDs)
        //            {
        //                List<ProcessTypeFlowConditionOld> TemplateFlowConditions = await _processProvider.CreateGetFlowConditionList(TemplateId);

        //                if (TemplateFlowConditions.Count() > 0)
        //                { SQLWhere += " AND "; }
        //                foreach (var Condition in TemplateFlowConditions)
        //                {
        //                    //Condition types
        //                    //SELECT ProcessTypeFlowConditionTypes.ProcessTypeFlowConditionTypeId, Name FROM ProcessTypeFlowConditionTypes JOIN UITermLanguages ON ProcessTypeFlowConditionTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTypeFlowConditionTypes.ProcessTypeFlowConditionTypeID
        //                    //Field types
        //                    //SELECT 'case ' + cast(ProcessTypeFieldTypes.ProcessTypeFieldTypeId as char(2))+ ': //', Name FROM ProcessTypeFieldTypes JOIN UITermLanguages ON ProcessTypeFieldTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTypeFieldTypes.ProcessTypeFieldTypeID

        //                    switch (Condition.ProcessTypeFlowConditionTypeId)
        //                    {
        //                        //Case 1 is Creator User which doesn't happen for a new process 
        //                        //Case 2 is Field which doesn't happen as it would check against default value which doesn't make sense.
        //                        case 3: //Security level user

        //                            //SELECT 'case ' + cast(ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorId as char(2))+ ': //', Name FROM ProcessTypeFlowConditionComparisonOperators JOIN UITermLanguages ON ProcessTypeFlowConditionComparisonOperators.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorID
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 28 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue ";
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
        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                    " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                                " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                                    " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
        //                            break;
        //                        case 4: //User role
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 30 AND Table" + Condition.ProcessTypeFlowId + "a.StringValue IN (SELECT RoleId FROM AspNetUserRoles WHERE UserId = '" + UserId + "') ";

        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                    " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                                " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                                    " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";

        //                            break;
        //                        //  Manager user field there is no user yet stored in the process
        //                        case 6: //   Organization user
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 14 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + UserId + "' AND AspNetRoleClaims.ClaimValue = 'OrganizationRight') ";

        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                    " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                                " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                                    " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
        //                            break;
        //                        case 7: //	Organization role user
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + "Field.ProcessTypeFieldTypeId = 14 " +

        //                                " Table" + Condition.ProcessTypeFlowId + "FieldRole.ProcessTypeFieldTypeId = 30 " +
        //                                " AND Table" + Condition.ProcessTypeFlowId + "UserRole.UserId = '" + UserId + "'  ";

        //                            //Link to field of project
        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                    "Field ON Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                                " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageField " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "StageField.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeFieldId " +
        //                                    " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageField.ProcessTypeStageId "

        //                                    //Link to field of role
        //                                    + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                    "FieldRole ON Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                                " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "StageFieldRole.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeFieldId " +
        //                                        " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.ProcessTypeStageId " +
        //                                " JOIN aspnetuserroles Table" + Condition.ProcessTypeFlowId + "UserRole " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "UserROle.RoleId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.StringValue " +
        //                                " JOIN aspnetroleclaims Table" + Condition.ProcessTypeFlowId + "RoleClaim " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTypeFlowId + "UserRole.RoleId " +
        //                                    " AND CAST(Table" + Condition.ProcessTypeFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTypeFlowId + "StageField.IntValue "
        //                                    ;
        //                            break;
        //                        //	Organization parent user no parent
        //                        //	Organization parent role user
        //                        case 10: //	Project user
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 16 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + UserId + "' AND AspNetRoleClaims.ClaimValue = 'ProjectRight') ";

        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                    " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                                " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                                    " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
        //                            break;
        //                        case 11: //	Project role user
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + "Field.ProcessTypeFieldTypeId = 16 " +

        //                                " Table" + Condition.ProcessTypeFlowId + "FieldRole.ProcessTypeFieldTypeId = 30 " +
        //                                " AND Table" + Condition.ProcessTypeFlowId + "UserRole.UserId = '" + UserId + "'  ";

        //                            //Link to field of project
        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                    "Field ON Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                                " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageField " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "StageField.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeFieldId " +
        //                                    " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageField.ProcessTypeStageId "

        //                                    //Link to field of role
        //                                    + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                    "FieldRole ON Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                                " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "StageFieldRole.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeFieldId " +
        //                                        " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.ProcessTypeStageId " +
        //                                " JOIN aspnetuserroles Table" + Condition.ProcessTypeFlowId + "UserRole " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "UserROle.RoleId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.StringValue " +
        //                                " JOIN aspnetroleclaims Table" + Condition.ProcessTypeFlowId + "RoleClaim " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTypeFlowId + "UserRole.RoleId " +
        //                                    " AND CAST(Table" + Condition.ProcessTypeFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTypeFlowId + "StageField.IntValue "
        //                                    ;
        //                            break;
        //                        //	Project parent user
        //                        //	Project parent role user
        //                        case 14: //	Default organization user
        //                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 14 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue IN ((SELECT persons.DefaultOrganizationId FROM persons WHERE persons.UserID'" + UserId + "' ) ";

        //                            SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                    " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                                " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                                    " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                                    " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
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
