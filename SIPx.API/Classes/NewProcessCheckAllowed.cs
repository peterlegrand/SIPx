using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.Classes
{
    public  class NewProcessCheckAllowed
    {
        private readonly IProcessProvider _processProvider;

        public NewProcessCheckAllowed(IProcessProvider ProcessProvider)
        {
            _processProvider = ProcessProvider;
        }
        public async Task<bool> CheckProcessTemplateID(SipUser CurrentUser, int TemplateToCheckID)
        {
            string SQLWhere = " WHERE 1=1 ";
            string SQLJOIN = " DECLARE @LanguageID int;" +
                "SELECT @LanguageID = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeID = 1 ;" +
                "SELECT ProcessTemplates.ProcessTemplateID ,ProcessTemplates.ProcessTemplateGroupID   " +
                ", ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name " +
                "FROM processtemplates JOIN ProcessTemplateFlows ON ProcessTemplates.ProcessTemplateID = ProcessTemplateFlows.ProcessTemplateID " +
                " LEFT JOIN (SELECT ProcessTemplateID, Name FROM ProcessTemplateLanguages WHERE LanguageID = @LanguageID) UserLanguage " +
                "  ON UserLanguage.ProcessTemplateID= ProcessTemplates.ProcessTemplateID " +
                " LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageID = Settings.IntValue WHERE Settings.SettingID = 1) DefaultLanguage " +
                " ON DefaultLanguage.ProcessTemplateID = ProcessTemplates.ProcessTemplateID ";

            List<int> TemplateIDs = await _processProvider.NewProcessGetInitialTemplateList();
            foreach (var TemplateID in TemplateIDs)
            {
                List<ProcessTemplateFlowCondition> TemplateFlowConditions = await _processProvider.NewProcessGetFlowConditionList(TemplateID);

                if (TemplateFlowConditions.Count() > 0)
                { SQLWhere = SQLWhere + " AND "; }
                foreach (var Condition in TemplateFlowConditions)
                {
                    //Condition types
                    //SELECT ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeID, Name FROM ProcessTemplateFlowConditionTypes JOIN UITermLanguages ON ProcessTemplateFlowConditionTypes.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeID
                    //Field types
                    //SELECT 'case ' + cast(ProcessTemplateFieldTypes.ProcessTemplateFieldTypeID as char(2))+ ': //', Name FROM ProcessTemplateFieldTypes JOIN UITermLanguages ON ProcessTemplateFieldTypes.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY ProcessTemplateFieldTypes.ProcessTemplateFieldTypeID

                    switch (Condition.ProcessTemplateFlowConditionTypeID)
                    {
                        //Case 1 is Creator User which doesn't happen for a new process 
                        //Case 2 is Field which doesn't happen as it would check against default value which doesn't make sense.
                        case 3: //Security level user

                            //SELECT 'case ' + cast(ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorID as char(2))+ ': //', Name FROM ProcessTemplateFlowConditionComparisonOperators JOIN UITermLanguages ON ProcessTemplateFlowConditionComparisonOperators.NameTermID = UITermLanguages.UITermID WHERE LanguageID =41 ORDER BY ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorID
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeID = 28 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue ";
                            switch (Condition.ComparisonOperatorID)
                            {
                                case 2:
                                    SQLWhere = SQLWhere + " = ";
                                    break;
                                case 3:
                                    SQLWhere = SQLWhere + " > ";
                                    break;
                                case 4:
                                    SQLWhere = SQLWhere + " >= ";
                                    break;
                                case 5:
                                    SQLWhere = SQLWhere + " >= ";
                                    break;
                                case 6:
                                    SQLWhere = SQLWhere + " <= ";
                                    break;
                                case 7:
                                    SQLWhere = SQLWhere + " <> ";
                                    break;

                            }
                            SQLWhere = SQLWhere + CurrentUser.SecurityLevelID.ToString();
                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateID = ProcessTemplateFlows.ProcessTemplateID " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldID = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldID " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageID = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageID ";
                            break;
                        case 4: //User role
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeID = 30 AND Table" + Condition.ProcessTemplateFlowId + "a.StringValue IN (SELECT RoleID FROM AspNetUserRoles WHERE UserID = '" + CurrentUser.Id + "') ";

                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateID = ProcessTemplateFlows.ProcessTemplateID " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldID = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldID " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageID = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageID ";

                            break;
                        //  Manager user field there is no user yet stored in the process
                        case 6: //   Organization user
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeID = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserID = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'OrganizationRight') ";

                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateID = ProcessTemplateFlows.ProcessTemplateID " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldID = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldID " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageID = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageID ";
                            break;
                        case 7: //	Organization role user
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeID = 14 " +

                                " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeID = 30 " +
                                " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserID = '" + CurrentUser.Id + "'  ";

                            //Link to field of project
                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    "Field ON Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateID = ProcessTemplateFlows.ProcessTemplateID " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "StageField.ProcessTemplateFieldID = Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateFieldID " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageID = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField.ProcessTemplateStageID "

                                    //Link to field of role
                                    + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    "FieldRole ON Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateID = ProcessTemplateFlows.ProcessTemplateID " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "StageFieldRole.ProcessTemplateFieldID = Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateFieldID " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageID = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.ProcessTemplateStageID " +
                                " JOIN aspnetuserroles Table" + Condition.ProcessTemplateFlowId + "UserRole " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "UserROle.RoleID = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.StringValue " +
                                " JOIN aspnetroleclaims Table" + Condition.ProcessTemplateFlowId + "RoleClaim " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "RoleClaim.RoleID = Table" + Condition.ProcessTemplateFlowId + "UserRole.RoleID " +
                                    " AND CAST(Table" + Condition.ProcessTemplateFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTemplateFlowId + "StageField.IntValue "
                                    ;
                            break;
                        //	Organization parent user no parent
                        //	Organization parent role user
                        case 10: //	Project user
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeID = 16 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserID = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'ProjectRight') ";

                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateID = ProcessTemplateFlows.ProcessTemplateID " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldID = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldID " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageID = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageID ";
                            break;
                        case 11: //	Project role user
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeID = 16 " +

                                " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeID = 30 " +
                                " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserID = '" + CurrentUser.Id + "'  ";

                            //Link to field of project
                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    "Field ON Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateID = ProcessTemplateFlows.ProcessTemplateID " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "StageField.ProcessTemplateFieldID = Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateFieldID " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageID = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField.ProcessTemplateStageID "

                                    //Link to field of role
                                    + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    "FieldRole ON Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateID = ProcessTemplateFlows.ProcessTemplateID " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "StageFieldRole.ProcessTemplateFieldID = Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateFieldID " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageID = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.ProcessTemplateStageID " +
                                " JOIN aspnetuserroles Table" + Condition.ProcessTemplateFlowId + "UserRole " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "UserROle.RoleID = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.StringValue " +
                                " JOIN aspnetroleclaims Table" + Condition.ProcessTemplateFlowId + "RoleClaim " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "RoleClaim.RoleID = Table" + Condition.ProcessTemplateFlowId + "UserRole.RoleID " +
                                    " AND CAST(Table" + Condition.ProcessTemplateFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTemplateFlowId + "StageField.IntValue "
                                    ;
                            break;
                        //	Project parent user
                        //	Project parent role user
                        case 14: //	Default organization user
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeID = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT persons.DefaultOrganizationID FROM persons WHERE persons.UserID'" + CurrentUser.Id + "' ) ";

                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateID = ProcessTemplateFlows.ProcessTemplateID " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldID = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldID " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageID = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageID ";
                            break;
                        case 15: //	Open bracket
                            SQLWhere = SQLWhere + " ( ";
                            break;
                        case 16: //	and
                            SQLWhere = SQLWhere + " AND ";
                            break;
                        case 17: //	or
                            SQLWhere = SQLWhere + " OR ";
                            break;
                        case 18: //	Close bracket
                            SQLWhere = SQLWhere + " ) ";
                            break;
                        //	User
                        //	Relation to creator
                        //	Relation to user field
                        case 22: //	Classification relation both value and classification itself
                            break;
                        case 23: //	Classification relation type
                            break;
                    }
                }
            }
            List<NewProcessTemplateList> NewTemplateList = await _processProvider.NewProcessGetTemplateList(SQLJOIN + SQLWhere);
            return NewTemplateList.Exists(x => x.ProcessTemplateID == TemplateToCheckID);
            
        }
    }
}
