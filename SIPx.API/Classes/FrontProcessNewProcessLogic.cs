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
    public class FrontProcessNewProcessLogic
    {
        private readonly IUserProvider _userProvider;
        private readonly IProcessProvider _processProvider;
        private readonly IFrontProcessProvider _frontProcessProvider;

        public FrontProcessNewProcessLogic(IUserProvider userProvider, IProcessProvider ProcessProvider, IFrontProcessProvider frontProcessProvider)
        {
            _userProvider = userProvider;
            _processProvider = ProcessProvider;
            _frontProcessProvider = frontProcessProvider;
        }
        public async Task<int> ReturnProcessTemplateFlowPass(SipUser CurrentUser, FrontProcessNewProcessWithMaster NewProcess)
        {
            var Flows = await _frontProcessProvider.FrontProcessNewReturnFlows(NewProcess.ProcessTemplateId);
            foreach (var FlowId in Flows)
            {
                string From = "SELECT ProcessTemplateFlowId FROM ProcessTemplateFlowPasses";
                string Where = " WHERE ProcessTemplateFlowId = " + FlowId + " AND ";
                var Passes = await _frontProcessProvider.FrontProcessNewReturnFlowPasses(FlowId);
                foreach (var Pass in Passes)
                {
                    if (Pass.ProcessTemplateFlowConditionTypeId == 1) //Creator is user
                    {
                        //                    From = From + NewProcess. '  '
                        //Have to check if this can be used in general or only new processes
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 2) //  Field
                    {
                        if (!new[] { 1, 2, 12, 13, 30, 31, 32 }.Contains(Pass.ProcessTemplateFieldTypeId))
                        {
                            Where = Where + " 1=2 ";
                        }

                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 3) //  Security level user
                    {
                        var UserSecurityLevel = await _userProvider.UserSecurityLevel(CurrentUser.Id);
                        var ProcessSecurityLevel = NewProcess.ProcessFields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue;
                        if (ProcessSecurityLevel == null || ProcessSecurityLevel == 0)
                        { ProcessSecurityLevel = Pass.StageFieldIntValue; }
                        if (Pass.ComparisonOperatorID == 1)  //Comparison blank
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 2 && UserSecurityLevel != ProcessSecurityLevel) //Equal
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 3 && UserSecurityLevel <= ProcessSecurityLevel) //
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 4 && UserSecurityLevel >= ProcessSecurityLevel)
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 5 && UserSecurityLevel < ProcessSecurityLevel)
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 6 && UserSecurityLevel > ProcessSecurityLevel)
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 7 && UserSecurityLevel == ProcessSecurityLevel)
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 4) // Role user
                    {
                        var Roles = await _userProvider.UserRoles(CurrentUser.Id);
                        if (!Roles.Contains(NewProcess.ProcessFields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).StringValue ?? ""))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    //PETER not sure yet
                    if (Pass.ProcessTemplateFlowConditionTypeId == 5) //  Manager user field
                    {
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 6) //  Organization user
                    {
                        var Organizations = await _userProvider.UserOrganizations(CurrentUser.Id);
                        if (!Organizations.Contains(NewProcess.ProcessFields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 7) //  Organization role user
                    {
                        var RoleId = NewProcess.ProcessFields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldIDRole).StringValue ?? "";
                        var Organizations = await _userProvider.UserRoleOrganizations(CurrentUser.Id, RoleId);
                        if (!Organizations.Contains(NewProcess.ProcessFields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    //PETER TODO
                    if (Pass.ProcessTemplateFlowConditionTypeId == 8) //  Organization parent user
                    { }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 9) //  Organization parent role user
                    { }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 10) // Project user
                    {
                        var Projects = await _userProvider.UserProjects(CurrentUser.Id);
                        if (!Projects.Contains(NewProcess.ProcessFields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 11) //Project role user
                    {
                        var RoleId = NewProcess.ProcessFields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldIDRole).StringValue ?? "";
                        var Projects = await _userProvider.UserRoleProjects(CurrentUser.Id, RoleId);
                        if (!Projects.Contains(NewProcess.ProcessFields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 12) //Project parent user
                    { }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 13) //Project parent role user
                    { }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 14) //Default organization user
                    {
                        var Organization = await _userProvider.UserDefaultOrganization(CurrentUser.Id);
                        var OrganizationInField = NewProcess.ProcessFields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue ?? 0;
                        if (Organization != OrganizationInField)
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 15) //Open bracket
                    {
                        Where = Where + " ( ";
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 16) //and
                    {
                        Where = Where + " AND ";
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 17) //or
                    {
                        Where = Where + " OR ";
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 18) //Close bracket
                    {
                        Where = Where + " ) ";
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 19) //User
                    {
                        var UserInField = NewProcess.ProcessFields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).StringValue ?? "";
                        if (CurrentUser.Id != UserInField)
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 20) //Relation to creator
                    { }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 21) //Relation to user field
                    { }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 22) //Classification relation
                    { }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 23) //Classification relation type
                    { }
                }
                if (Where == " WHERE ProcessTemplateFlowId = " + FlowId + " AND ")
                { Where = " WHERE ProcessTemplateFlowId = " + FlowId; }
                var SQLStatement = From + Where;
                var x = await _frontProcessProvider.ReturnProcessTemplateFlowPass(CurrentUser.Id, SQLStatement);
                if (x.Count() > 0)
                {
                    return x.First();
                }
                else
                { return 0; }

            }
            return 0;
        }

        public async Task<List<NewProcessTemplateList>> ReturnProcessTemplateList(SipUser CurrentUser)
        {
            List<NewProcessTemplateList> ProcesstemplateList = new List<NewProcessTemplateList>();
            var TemplateIdFlowIds = await _processProvider.CreateGetInitialTemplateFlowList();
            foreach (var TemplateIdFlowId in TemplateIdFlowIds)
            {
                string From = "DECLARE @LanguageId int; SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeId = 1 ;" +
                    " SELECT  ProcessTemplateFlowConditions.ProcessTemplateID , ProcessTemplateGroupID, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name FROM ProcessTemplateFlowConditions" +
                    " JOIN ProcessTemplates ON ProcessTemplateFlowConditions.ProcessTemplateId = ProcessTemplates.ProcessTemplateId " +
                    " LEFT JOIN(SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageID) UserLanguage " +
                    "  ON UserLanguage.ProcessTemplateID = ProcessTemplateFlowConditions.ProcessTemplateID " +
                    "LEFT JOIN(SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
                    "  ON DefaultLanguage.ProcessTemplateID = ProcessTemplateFlowConditions.ProcessTemplateID ";
                string Where = " WHERE ProcessTemplateFlowId = " + TemplateIdFlowId.ProcessTemplateFlowId + " AND ";
                var Conditions = await _processProvider.CreateGetInitialTemplateFlowConditionList(TemplateIdFlowId.ProcessTemplateFlowId);
                foreach (var Condition in Conditions)
                {
                    if (Condition.ProcessTemplateFlowConditionTypeId == 1) //Creator is user
                    {
                        //                    From = From + NewProcess. '  '
                        //Have to check if this can be used in general or only new processes
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 2) //  Field
                    {
                        //NOT RELEVANT FOR NEW PROCESS
                        //if (!new[] { 1, 2, 12, 13, 30, 31, 32 }.Contains(Condition.Fie.ProcessTemplateFieldTypeId))
                        //{
                        //    Where = Where + " 1=2 ";
                        //}

                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 3) //  Security level user
                    {
                        var UserSecurityLevel = await _userProvider.UserSecurityLevel(CurrentUser.Id);
                        if (Condition.ComparisonOperatorId == 1)  //Comparison blank
                        {
                            Where = Where + " 1=1 ";
                        }
                        if (Condition.ComparisonOperatorId == 2 && UserSecurityLevel != Condition.StageFieldIntValue) //Equal
                        {
                            Where = Where + UserSecurityLevel.ToString() + " =  " + Condition.ProcessTemplateFlowConditionInt.ToString();
                        }
                        if (Condition.ComparisonOperatorId == 3 && UserSecurityLevel <= Condition.StageFieldIntValue) // >
                        {
                            Where = Where + UserSecurityLevel.ToString() + " > " + Condition.ProcessTemplateFlowConditionInt.ToString();
                        }
                        if (Condition.ComparisonOperatorId == 4 && UserSecurityLevel >= Condition.StageFieldIntValue) //<
                        {
                            Where = Where + UserSecurityLevel.ToString() + " <  " + Condition.ProcessTemplateFlowConditionInt.ToString();
                        }
                        if (Condition.ComparisonOperatorId == 5 && UserSecurityLevel < Condition.StageFieldIntValue) //>=
                        {
                            Where = Where + UserSecurityLevel.ToString() + " >=  " + Condition.ProcessTemplateFlowConditionInt.ToString();
                        }
                        if (Condition.ComparisonOperatorId == 6 && UserSecurityLevel > Condition.StageFieldIntValue) //<=
                        {
                            Where = Where + UserSecurityLevel.ToString() + " <=  " + Condition.ProcessTemplateFlowConditionInt.ToString();
                        }
                        if (Condition.ComparisonOperatorId == 7 && UserSecurityLevel == Condition.StageFieldIntValue) //<>
                        {
                            Where = Where + UserSecurityLevel.ToString() + " <> " + Condition.ProcessTemplateFlowConditionInt.ToString();
                        }
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 4) // Role user
                    {
                        var Roles = await _userProvider.RoleIdForSpecificUser(CurrentUser.Id);
                        for (int i = 0; i < Roles.Count; i++)
                        {
                            Roles[i] = Roles[i].Replace("\t", "");
                        }
                        if (!Roles.Contains(Condition.ProcessTemplateFlowConditionString.Replace("\t", "")))
                        {
                            Where = Where + " 14=2 ";
                        }
                    }
                    //PETER not sure yet
                    if (Condition.ProcessTemplateFlowConditionTypeId == 5) //  Manager user field
                    {
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 6) //  Organization user
                    {
                        var Organizations = await _userProvider.UserOrganizations(CurrentUser.Id);
                        if (!Organizations.Contains(Condition.ProcessTemplateFlowConditionInt))
                        {
                            Where = Where + " 1=42 ";
                        }
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 7) //  Organization role user
                    {
                        var RoleId = Condition.ProcessTemplateFlowConditionString;
                        var Organizations = await _userProvider.UserRoleOrganizations(CurrentUser.Id, RoleId);
                        if (!Organizations.Contains(Condition.ProcessTemplateFlowConditionInt))
                        {
                            Where = Where + " 1=25 ";
                        }
                    }
                    //PETER TODO
                    if (Condition.ProcessTemplateFlowConditionTypeId == 8) //  Organization parent user
                    { }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 9) //  Organization parent role user
                    { }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 10) // Project user
                    {
                        var Projects = await _userProvider.UserProjects(CurrentUser.Id);
                        if (!Projects.Contains(Condition.ProcessTemplateFlowConditionInt))
                        {
                            Where = Where + " 1=26 ";
                        }
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 11) //Project role user
                    {
                        var RoleId = Condition.ProcessTemplateFlowConditionString;
                        var Projects = await _userProvider.UserRoleProjects(CurrentUser.Id, RoleId);
                        if (!Projects.Contains(Condition.ProcessTemplateFlowConditionInt))
                        {
                            Where = Where + " 1=27 ";
                        }
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 12) //Project parent user
                    { }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 13) //Project parent role user
                    { }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 14) //Default organization user
                    {
                        var Organization = await _userProvider.UserDefaultOrganization(CurrentUser.Id);
                        if (Organization != Condition.ProcessTemplateFlowConditionInt)
                        {
                            Where = Where + " 1=28 ";
                        }
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 15) //Open bracket
                    {
                        Where = Where + " ( ";
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 16) //and
                    {
                        Where = Where + " AND ";
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 17) //or
                    {
                        Where = Where + " OR ";
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 18) //Close bracket
                    {
                        Where = Where + " ) ";
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 19) //User
                    {
                        if (CurrentUser.Id != Condition.ProcessTemplateFlowConditionString)
                        {
                            Where = Where + " 1=29 ";
                        }
                    }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 20) //Relation to creator
                    { }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 21) //Relation to user field
                    { }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 22) //Classification relation
                    { }
                    if (Condition.ProcessTemplateFlowConditionTypeId == 23) //Classification relation type
                    { }
                }
                if (Where == " WHERE ProcessTemplateFlowId = " + TemplateIdFlowId.ProcessTemplateFlowId + " AND ")
                {
                    Where = " WHERE ProcessTemplateFlowId = " + TemplateIdFlowId.ProcessTemplateFlowId;
                }
                if (!ProcesstemplateList.Any(t => t.ProcessTemplateId == TemplateIdFlowId.ProcessTemplateId))
                {
                    var y = await _processProvider.CreateGetTemplateList(From + Where);
                    if (y.Count != 0)
                    {
                        var z = y.First();
                        ProcesstemplateList.Add(z);
                    }

                }



            }
            return ProcesstemplateList;
        }

        //public async Task<List<NewProcessTemplateList>> CheckProcessTemplateID(SipUser CurrentUser, int TemplateToCheckId)
        //{
        //    //string SQLWhere = " WHERE 1=1 ";
        //    //string SQLJOIN = " DECLARE @LanguageId int;" +
        //    //    "SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeId = 1 ;" +
        //    //    "SELECT ProcessTemplates.ProcessTemplateId ,ProcessTemplates.ProcessTemplateGroupId   " +
        //    //    ", ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name " +
        //    //    "FROM processtemplates JOIN ProcessTemplateFlows ON ProcessTemplates.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //    //    " LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageId) UserLanguage " +
        //    //    "  ON UserLanguage.ProcessTemplateID= ProcessTemplates.ProcessTemplateId " +
        //    //    " LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
        //    //    " ON DefaultLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateId ";

        //    List<int> TemplateIDs = await _processProvider.CreateGetInitialTemplateList();
        //    foreach (var TemplateId in TemplateIDs)
        //    {
        //        string SQLWhere = " WHERE 1=1 ";
        //        string SQLJOIN = " DECLARE @LanguageId int;" +
        //            "SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeId = 1 ;" +
        //            "SELECT ProcessTemplates.ProcessTemplateId ,ProcessTemplates.ProcessTemplateGroupId   " +
        //            ", ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name " +
        //            "FROM processtemplates JOIN ProcessTemplateFlows ON ProcessTemplates.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //            " LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageId) UserLanguage " +
        //            "  ON UserLanguage.ProcessTemplateID= ProcessTemplates.ProcessTemplateId " +
        //            " LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
        //            " ON DefaultLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateId ";
        //        List<ProcessTemplateFlowConditionOld> TemplateFlowConditions = await _processProvider.CreateGetFlowConditionList(TemplateId);

        //        if (TemplateFlowConditions.Count() > 0)
        //        { SQLWhere += " AND "; }
        //        foreach (var Condition in TemplateFlowConditions)
        //        {
        //            //Condition types
        //            //SELECT ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeId, Name FROM ProcessTemplateFlowConditionTypes JOIN UITermLanguages ON ProcessTemplateFlowConditionTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeID
        //            //Field types
        //            //SELECT 'case ' + cast(ProcessTemplateFieldTypes.ProcessTemplateFieldTypeId as char(2))+ ': //', Name FROM ProcessTemplateFieldTypes JOIN UITermLanguages ON ProcessTemplateFieldTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFieldTypes.ProcessTemplateFieldTypeID

        //            switch (Condition.ProcessTemplateFlowConditionTypeId)
        //            {
        //                //Case 1 is Creator User which doesn't happen for a new process 
        //                //Case 2 is Field which doesn't happen as it would check against default value which doesn't make sense.
        //                case 3: //Security level user

        //                    //SELECT 'case ' + cast(ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorId as char(2))+ ': //', Name FROM ProcessTemplateFlowConditionComparisonOperators JOIN UITermLanguages ON ProcessTemplateFlowConditionComparisonOperators.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorID
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 28 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue ";
        //                    switch (Condition.ComparisonOperatorId)
        //                    {
        //                        case 2:
        //                            SQLWhere += " = ";
        //                            break;
        //                        case 3:
        //                            SQLWhere += " > ";
        //                            break;
        //                        case 4:
        //                            SQLWhere += " < ";
        //                            break;
        //                        case 5:
        //                            SQLWhere += " >= ";
        //                            break;
        //                        case 6:
        //                            SQLWhere += " <= ";
        //                            break;
        //                        case 7:
        //                            SQLWhere += " <> ";
        //                            break;

        //                    }
        //                    SQLWhere += CurrentUser.SecurityLevelId.ToString();
        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                            " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                        " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
        //                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
        //                    break;
        //                case 4: //User role
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 30 AND Table" + Condition.ProcessTemplateFlowId + "a.StringValue IN (SELECT RoleId FROM AspNetUserRoles WHERE UserId = '" + CurrentUser.Id + "') ";

        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                            " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                        " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
        //                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";

        //                    break;
        //                //  Manager user field there is no user yet stored in the process
        //                case 6: //   Organization user
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'OrganizationRight') ";

        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                            " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                        " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
        //                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
        //                    break;
        //                case 7: //	Organization role user
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeId = 14 " +

        //                        " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeId = 30 " +
        //                        " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserId = '" + CurrentUser.Id + "'  ";

        //                    //Link to field of project
        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                            "Field ON Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                        " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "StageField.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateFieldId " +
        //                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField.ProcessTemplateStageId "

        //                            //Link to field of role
        //                            + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                            "FieldRole ON Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                        " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "StageFieldRole.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateFieldId " +
        //                                " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.ProcessTemplateStageId " +
        //                        " JOIN aspnetuserroles Table" + Condition.ProcessTemplateFlowId + "UserRole " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "UserROle.RoleId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.StringValue " +
        //                        " JOIN aspnetroleclaims Table" + Condition.ProcessTemplateFlowId + "RoleClaim " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTemplateFlowId + "UserRole.RoleId " +
        //                            " AND CAST(Table" + Condition.ProcessTemplateFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTemplateFlowId + "StageField.IntValue "
        //                            ;
        //                    break;
        //                //	Organization parent user no parent
        //                //	Organization parent role user
        //                case 10: //	Project user
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 16 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'ProjectRight') ";

        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                            " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                        " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
        //                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
        //                    break;
        //                case 11: //	Project role user
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeId = 16 " +

        //                        " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeId = 30 " +
        //                        " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserId = '" + CurrentUser.Id + "'  ";

        //                    //Link to field of project
        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                            "Field ON Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                        " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "StageField.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateFieldId " +
        //                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField.ProcessTemplateStageId "

        //                            //Link to field of role
        //                            + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                            "FieldRole ON Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                        " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "StageFieldRole.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateFieldId " +
        //                                " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.ProcessTemplateStageId " +
        //                        " JOIN aspnetuserroles Table" + Condition.ProcessTemplateFlowId + "UserRole " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "UserROle.RoleId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.StringValue " +
        //                        " JOIN aspnetroleclaims Table" + Condition.ProcessTemplateFlowId + "RoleClaim " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTemplateFlowId + "UserRole.RoleId " +
        //                            " AND CAST(Table" + Condition.ProcessTemplateFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTemplateFlowId + "StageField.IntValue "
        //                            ;
        //                    break;
        //                //	Project parent user
        //                //	Project parent role user
        //                case 14: //	Default organization user
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT persons.DefaultOrganizationId FROM persons WHERE persons.UserID'" + CurrentUser.Id + "' ) ";

        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
        //                            " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
        //                        " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
        //                            " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
        //                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
        //                    break;
        //                case 15: //	Open bracket
        //                    SQLWhere += " ( ";
        //                    break;
        //                case 16: //	and
        //                    SQLWhere += " AND ";
        //                    break;
        //                case 17: //	or
        //                    SQLWhere += " OR ";
        //                    break;
        //                case 18: //	Close bracket
        //                    SQLWhere += " ) ";
        //                    break;
        //                //	User
        //                //	Relation to creator
        //                //	Relation to user field
        //                case 22: //	Classification relation both value and classification itself
        //                    break;
        //                case 23: //	Classification relation type
        //                    break;
        //            }
        //        }
        //    }
        //    List<NewProcessTemplateList> NewTemplateList = await _processProvider.CreateGetTemplateList(SQLJOIN + SQLWhere);
        //    return NewTemplateList;

        //}


        //public async Task<List<ErrorMessage>> Check(List<FrontProcessNewProcessField> NewProcessFields)
        //{
        //    List<int> ErrorCodes = new List<int>();

        //    foreach (var NewProcessField in NewProcessFields)
        //    {
        //        if (NewProcessField.ProcessTemplateStageFieldStatusId == 4)
        //            switch (NewProcessField.ProcessTemplateFieldTypeId)
        //            {
        //                case 1:
        //                    if (NewProcessField.StringValue == "" || NewProcessField.StringValue == null)
        //                    {
        //                        ErrorCodes.Add(1758);
        //                    }
        //                    break;
        //                case 2:
        //                    if (NewProcessField.StringValue == "" || NewProcessField.StringValue == null)
        //                    {
        //                        ErrorCodes.Add(1759);
        //                    }
        //                    break;

        //            }
        //    }
        //    return Errors;
        //}
}
}
