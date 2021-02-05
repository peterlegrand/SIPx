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
        public async Task<int> ReturnProcessTypeFlowPass(SipUser CurrentUser, FrontProcessNewProcessWithMaster NewProcess)
        {
            var Flows = await _frontProcessProvider.FrontProcessNewReturnFlows(NewProcess.ProcessTypeId);
            foreach (var FlowId in Flows)
            {
                string From = "SELECT ProcessTypeFlowId FROM ProcessTypeFlowPasses";
                string Where = " WHERE ProcessTypeFlowId = " + FlowId + " AND ";
                var Passes = await _frontProcessProvider.FrontProcessNewReturnFlowPasses(FlowId);
                foreach (var Pass in Passes)
                {
                    if (Pass.ProcessTypeFlowConditionTypeId == 1) //Creator is user
                    {
                        //                    From = From + NewProcess. '  '
                        //Have to check if this can be used in general or only new processes
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 2) //  Field
                    {
                        if (!new[] { 1, 2, 12, 13, 30, 31, 32 }.Contains(Pass.ProcessTypeFieldTypeId))
                        {
                            Where = Where + " 1=2 ";
                        }

                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 3) //  Security level user
                    {
                        var UserSecurityLevel = await _userProvider.UserSecurityLevel(CurrentUser.Id);
                        var ProcessSecurityLevel = NewProcess.ProcessFields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue;
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
                    if (Pass.ProcessTypeFlowConditionTypeId == 4) // Role user
                    {
                        var Roles = await _userProvider.UserRoles(CurrentUser.Id);
                        if (!Roles.Contains(NewProcess.ProcessFields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).StringValue ?? ""))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    //PETER not sure yet
                    if (Pass.ProcessTypeFlowConditionTypeId == 5) //  Manager user field
                    {
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 6) //  Organization user
                    {
                        var Organizations = await _userProvider.UserOrganizations(CurrentUser.Id);
                        if (!Organizations.Contains(NewProcess.ProcessFields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 7) //  Organization role user
                    {
                        var RoleId = NewProcess.ProcessFields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldIDRole).StringValue ?? "";
                        var Organizations = await _userProvider.UserRoleOrganizations(CurrentUser.Id, RoleId);
                        if (!Organizations.Contains(NewProcess.ProcessFields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    //PETER TODO
                    if (Pass.ProcessTypeFlowConditionTypeId == 8) //  Organization parent user
                    { }
                    if (Pass.ProcessTypeFlowConditionTypeId == 9) //  Organization parent role user
                    { }
                    if (Pass.ProcessTypeFlowConditionTypeId == 10) // Project user
                    {
                        var Projects = await _userProvider.UserProjects(CurrentUser.Id);
                        if (!Projects.Contains(NewProcess.ProcessFields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 11) //Project role user
                    {
                        var RoleId = NewProcess.ProcessFields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldIDRole).StringValue ?? "";
                        var Projects = await _userProvider.UserRoleProjects(CurrentUser.Id, RoleId);
                        if (!Projects.Contains(NewProcess.ProcessFields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 12) //Project parent user
                    { }
                    if (Pass.ProcessTypeFlowConditionTypeId == 13) //Project parent role user
                    { }
                    if (Pass.ProcessTypeFlowConditionTypeId == 14) //Default organization user
                    {
                        var Organization = await _userProvider.UserDefaultOrganization(CurrentUser.Id);
                        var OrganizationInField = NewProcess.ProcessFields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue ?? 0;
                        if (Organization != OrganizationInField)
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 15) //Open bracket
                    {
                        Where = Where + " ( ";
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 16) //and
                    {
                        Where = Where + " AND ";
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 17) //or
                    {
                        Where = Where + " OR ";
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 18) //Close bracket
                    {
                        Where = Where + " ) ";
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 19) //User
                    {
                        var UserInField = NewProcess.ProcessFields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).StringValue ?? "";
                        if (CurrentUser.Id != UserInField)
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 20) //Relation to creator
                    { }
                    if (Pass.ProcessTypeFlowConditionTypeId == 21) //Relation to user field
                    { }
                    if (Pass.ProcessTypeFlowConditionTypeId == 22) //Classification relation
                    { }
                    if (Pass.ProcessTypeFlowConditionTypeId == 23) //Classification relation type
                    { }
                }
                if (Where == " WHERE ProcessTypeFlowId = " + FlowId + " AND ")
                { Where = " WHERE ProcessTypeFlowId = " + FlowId; }
                var SQLStatement = From + Where;
                var x = await _frontProcessProvider.ReturnProcessTypeFlowPass(CurrentUser.Id, SQLStatement);
                if (x.Count() > 0)
                {
                    return x.First();
                }
                else
                { return 0; }

            }
            return 0;
        }

        public async Task<List<NewProcessTypeList>> ReturnProcessTypeList(SipUser CurrentUser)
        {
            List<NewProcessTypeList> ProcesstypeList = new List<NewProcessTypeList>();
            var TemplateIdFlowIds = await _processProvider.CreateGetInitialTemplateFlowList();
            foreach (var TemplateIdFlowId in TemplateIdFlowIds)
            {
                string From = "DECLARE @LanguageId int; SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeId = 1 ;" +
                    " SELECT  ProcessTypeFlowConditions.ProcessTypeID , ProcessTypeGroupID, ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name, TRIM(Icons.FileName) FileName FROM ProcessTypeFlowConditions" +
                    " JOIN ProcessTypes ON ProcessTypeFlowConditions.ProcessTypeId = ProcessTypes.ProcessTypeId " +
                    " JOIN Icons ON ICons.IconId = ProcessTypes.IconId " +
                    " LEFT JOIN(SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) UserLanguage " +
                    "  ON UserLanguage.ProcessTypeID = ProcessTypeFlowConditions.ProcessTypeID " +
                    "LEFT JOIN(SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
                    "  ON DefaultLanguage.ProcessTypeID = ProcessTypeFlowConditions.ProcessTypeID ";
                string Where = " WHERE ProcessTypeFlowId = " + TemplateIdFlowId.ProcessTypeFlowId + " AND ";
                var Conditions = await _processProvider.CreateGetInitialTemplateFlowConditionList(TemplateIdFlowId.ProcessTypeFlowId);
                foreach (var Condition in Conditions)
                {
                    if (Condition.ProcessTypeFlowConditionTypeId == 1) //Creator is user
                    {
                        //                    From = From + NewProcess. '  '
                        //Have to check if this can be used in general or only new processes
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 2) //  Field
                    {
                        //NOT RELEVANT FOR NEW PROCESS
                        //if (!new[] { 1, 2, 12, 13, 30, 31, 32 }.Contains(Condition.Fie.ProcessTypeFieldTypeId))
                        //{
                        //    Where = Where + " 1=2 ";
                        //}

                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 3) //  Security level user
                    {
                        var UserSecurityLevel = await _userProvider.UserSecurityLevel(CurrentUser.Id);
                        if (Condition.ComparisonOperatorId == 1)  //Comparison blank
                        {
                            Where = Where + " 1=1 ";
                        }
                        if (Condition.ComparisonOperatorId == 2 && UserSecurityLevel != Condition.StageFieldIntValue) //Equal
                        {
                            Where = Where + UserSecurityLevel.ToString() + " =  " + Condition.ProcessTypeFlowConditionInt.ToString();
                        }
                        if (Condition.ComparisonOperatorId == 3 && UserSecurityLevel <= Condition.StageFieldIntValue) // >
                        {
                            Where = Where + UserSecurityLevel.ToString() + " > " + Condition.ProcessTypeFlowConditionInt.ToString();
                        }
                        if (Condition.ComparisonOperatorId == 4 && UserSecurityLevel >= Condition.StageFieldIntValue) //<
                        {
                            Where = Where + UserSecurityLevel.ToString() + " <  " + Condition.ProcessTypeFlowConditionInt.ToString();
                        }
                        if (Condition.ComparisonOperatorId == 5 && UserSecurityLevel < Condition.StageFieldIntValue) //>=
                        {
                            Where = Where + UserSecurityLevel.ToString() + " >=  " + Condition.ProcessTypeFlowConditionInt.ToString();
                        }
                        if (Condition.ComparisonOperatorId == 6 && UserSecurityLevel > Condition.StageFieldIntValue) //<=
                        {
                            Where = Where + UserSecurityLevel.ToString() + " <=  " + Condition.ProcessTypeFlowConditionInt.ToString();
                        }
                        if (Condition.ComparisonOperatorId == 7 && UserSecurityLevel == Condition.StageFieldIntValue) //<>
                        {
                            Where = Where + UserSecurityLevel.ToString() + " <> " + Condition.ProcessTypeFlowConditionInt.ToString();
                        }
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 4) // Role user
                    {
                        var Roles = await _userProvider.RoleIdForSpecificUser(CurrentUser.Id);
                        for (int i = 0; i < Roles.Count; i++)
                        {
                            Roles[i] = Roles[i].Replace("\t", "");
                        }
                        if (!Roles.Contains(Condition.ProcessTypeFlowConditionString.Replace("\t", "")))
                        {
                            Where = Where + " 14=2 ";
                        }
                    }
                    //PETER not sure yet
                    if (Condition.ProcessTypeFlowConditionTypeId == 5) //  Manager user field
                    {
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 6) //  Organization user
                    {
                        var Organizations = await _userProvider.UserOrganizations(CurrentUser.Id);
                        if (!Organizations.Contains(Condition.ProcessTypeFlowConditionInt))
                        {
                            Where = Where + " 1=42 ";
                        }
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 7) //  Organization role user
                    {
                        var RoleId = Condition.ProcessTypeFlowConditionString;
                        var Organizations = await _userProvider.UserRoleOrganizations(CurrentUser.Id, RoleId);
                        if (!Organizations.Contains(Condition.ProcessTypeFlowConditionInt))
                        {
                            Where = Where + " 1=25 ";
                        }
                    }
                    //PETER TODO
                    if (Condition.ProcessTypeFlowConditionTypeId == 8) //  Organization parent user
                    { }
                    if (Condition.ProcessTypeFlowConditionTypeId == 9) //  Organization parent role user
                    { }
                    if (Condition.ProcessTypeFlowConditionTypeId == 10) // Project user
                    {
                        var Projects = await _userProvider.UserProjects(CurrentUser.Id);
                        if (!Projects.Contains(Condition.ProcessTypeFlowConditionInt))
                        {
                            Where = Where + " 1=26 ";
                        }
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 11) //Project role user
                    {
                        var RoleId = Condition.ProcessTypeFlowConditionString;
                        var Projects = await _userProvider.UserRoleProjects(CurrentUser.Id, RoleId);
                        if (!Projects.Contains(Condition.ProcessTypeFlowConditionInt))
                        {
                            Where = Where + " 1=27 ";
                        }
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 12) //Project parent user
                    { }
                    if (Condition.ProcessTypeFlowConditionTypeId == 13) //Project parent role user
                    { }
                    if (Condition.ProcessTypeFlowConditionTypeId == 14) //Default organization user
                    {
                        var Organization = await _userProvider.UserDefaultOrganization(CurrentUser.Id);
                        if (Organization != Condition.ProcessTypeFlowConditionInt)
                        {
                            Where = Where + " 1=28 ";
                        }
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 15) //Open bracket
                    {
                        Where = Where + " ( ";
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 16) //and
                    {
                        Where = Where + " AND ";
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 17) //or
                    {
                        Where = Where + " OR ";
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 18) //Close bracket
                    {
                        Where = Where + " ) ";
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 19) //User
                    {
                        if (CurrentUser.Id != Condition.ProcessTypeFlowConditionString)
                        {
                            Where = Where + " 1=29 ";
                        }
                    }
                    if (Condition.ProcessTypeFlowConditionTypeId == 20) //Relation to creator
                    { }
                    if (Condition.ProcessTypeFlowConditionTypeId == 21) //Relation to user field
                    { }
                    if (Condition.ProcessTypeFlowConditionTypeId == 22) //Classification relation
                    { }
                    if (Condition.ProcessTypeFlowConditionTypeId == 23) //Classification relation type
                    { }
                }
                if (Where == " WHERE ProcessTypeFlowId = " + TemplateIdFlowId.ProcessTypeFlowId + " AND ")
                {
                    Where = " WHERE ProcessTypeFlowId = " + TemplateIdFlowId.ProcessTypeFlowId;
                }
                if (!ProcesstypeList.Any(t => t.ProcessTypeId == TemplateIdFlowId.ProcessTypeId))
                {
                    var y = await _frontProcessProvider.CreateGetTemplateList(From + Where);
                    if (y.Count != 0)
                    {
                        var z = y.First();
                        z.FileName = "/images/icons/" + z.FileName;
                        ProcesstypeList.Add(z);
                    }

                }



            }
            return ProcesstypeList;
        }

        //public async Task<List<NewProcessTypeList>> CheckProcessTypeID(SipUser CurrentUser, int TemplateToCheckId)
        //{
        //    //string SQLWhere = " WHERE 1=1 ";
        //    //string SQLJOIN = " DECLARE @LanguageId int;" +
        //    //    "SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeId = 1 ;" +
        //    //    "SELECT ProcessTypes.ProcessTypeId ,ProcessTypes.ProcessTypeGroupId   " +
        //    //    ", ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name " +
        //    //    "FROM processtypes JOIN ProcessTypeFlows ON ProcessTypes.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //    //    " LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageId) UserLanguage " +
        //    //    "  ON UserLanguage.ProcessTypeID= ProcessTypes.ProcessTypeId " +
        //    //    " LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
        //    //    " ON DefaultLanguage.ProcessTypeId = ProcessTypes.ProcessTypeId ";

        //    List<int> TemplateIDs = await _processProvider.CreateGetInitialTemplateList();
        //    foreach (var TemplateId in TemplateIDs)
        //    {
        //        string SQLWhere = " WHERE 1=1 ";
        //        string SQLJOIN = " DECLARE @LanguageId int;" +
        //            "SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeId = 1 ;" +
        //            "SELECT ProcessTypes.ProcessTypeId ,ProcessTypes.ProcessTypeGroupId   " +
        //            ", ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name " +
        //            "FROM processtypes JOIN ProcessTypeFlows ON ProcessTypes.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //            " LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageId) UserLanguage " +
        //            "  ON UserLanguage.ProcessTypeID= ProcessTypes.ProcessTypeId " +
        //            " LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
        //            " ON DefaultLanguage.ProcessTypeId = ProcessTypes.ProcessTypeId ";
        //        List<ProcessTypeFlowConditionOld> TemplateFlowConditions = await _processProvider.CreateGetFlowConditionList(TemplateId);

        //        if (TemplateFlowConditions.Count() > 0)
        //        { SQLWhere += " AND "; }
        //        foreach (var Condition in TemplateFlowConditions)
        //        {
        //            //Condition types
        //            //SELECT ProcessTypeFlowConditionTypes.ProcessTypeFlowConditionTypeId, Name FROM ProcessTypeFlowConditionTypes JOIN UITermLanguages ON ProcessTypeFlowConditionTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTypeFlowConditionTypes.ProcessTypeFlowConditionTypeID
        //            //Field types
        //            //SELECT 'case ' + cast(ProcessTypeFieldTypes.ProcessTypeFieldTypeId as char(2))+ ': //', Name FROM ProcessTypeFieldTypes JOIN UITermLanguages ON ProcessTypeFieldTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTypeFieldTypes.ProcessTypeFieldTypeID

        //            switch (Condition.ProcessTypeFlowConditionTypeId)
        //            {
        //                //Case 1 is Creator User which doesn't happen for a new process 
        //                //Case 2 is Field which doesn't happen as it would check against default value which doesn't make sense.
        //                case 3: //Security level user

        //                    //SELECT 'case ' + cast(ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorId as char(2))+ ': //', Name FROM ProcessTypeFlowConditionComparisonOperators JOIN UITermLanguages ON ProcessTypeFlowConditionComparisonOperators.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorID
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 28 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue ";
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
        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                            " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                        " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                            " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
        //                    break;
        //                case 4: //User role
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 30 AND Table" + Condition.ProcessTypeFlowId + "a.StringValue IN (SELECT RoleId FROM AspNetUserRoles WHERE UserId = '" + CurrentUser.Id + "') ";

        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                            " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                        " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                            " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";

        //                    break;
        //                //  Manager user field there is no user yet stored in the process
        //                case 6: //   Organization user
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 14 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'OrganizationRight') ";

        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                            " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                        " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                            " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
        //                    break;
        //                case 7: //	Organization role user
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + "Field.ProcessTypeFieldTypeId = 14 " +

        //                        " Table" + Condition.ProcessTypeFlowId + "FieldRole.ProcessTypeFieldTypeId = 30 " +
        //                        " AND Table" + Condition.ProcessTypeFlowId + "UserRole.UserId = '" + CurrentUser.Id + "'  ";

        //                    //Link to field of project
        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                            "Field ON Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                        " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageField " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "StageField.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeFieldId " +
        //                            " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageField.ProcessTypeStageId "

        //                            //Link to field of role
        //                            + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                            "FieldRole ON Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                        " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "StageFieldRole.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeFieldId " +
        //                                " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.ProcessTypeStageId " +
        //                        " JOIN aspnetuserroles Table" + Condition.ProcessTypeFlowId + "UserRole " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "UserROle.RoleId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.StringValue " +
        //                        " JOIN aspnetroleclaims Table" + Condition.ProcessTypeFlowId + "RoleClaim " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTypeFlowId + "UserRole.RoleId " +
        //                            " AND CAST(Table" + Condition.ProcessTypeFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTypeFlowId + "StageField.IntValue "
        //                            ;
        //                    break;
        //                //	Organization parent user no parent
        //                //	Organization parent role user
        //                case 10: //	Project user
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 16 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'ProjectRight') ";

        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                            " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                        " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                            " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
        //                    break;
        //                case 11: //	Project role user
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + "Field.ProcessTypeFieldTypeId = 16 " +

        //                        " Table" + Condition.ProcessTypeFlowId + "FieldRole.ProcessTypeFieldTypeId = 30 " +
        //                        " AND Table" + Condition.ProcessTypeFlowId + "UserRole.UserId = '" + CurrentUser.Id + "'  ";

        //                    //Link to field of project
        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                            "Field ON Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                        " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageField " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "StageField.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeFieldId " +
        //                            " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageField.ProcessTypeStageId "

        //                            //Link to field of role
        //                            + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                            "FieldRole ON Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                        " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "StageFieldRole.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeFieldId " +
        //                                " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.ProcessTypeStageId " +
        //                        " JOIN aspnetuserroles Table" + Condition.ProcessTypeFlowId + "UserRole " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "UserROle.RoleId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.StringValue " +
        //                        " JOIN aspnetroleclaims Table" + Condition.ProcessTypeFlowId + "RoleClaim " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTypeFlowId + "UserRole.RoleId " +
        //                            " AND CAST(Table" + Condition.ProcessTypeFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTypeFlowId + "StageField.IntValue "
        //                            ;
        //                    break;
        //                //	Project parent user
        //                //	Project parent role user
        //                case 14: //	Default organization user
        //                    SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 14 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue IN ((SELECT persons.DefaultOrganizationId FROM persons WHERE persons.UserID'" + CurrentUser.Id + "' ) ";

        //                    SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                            " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                        " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                            " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                            " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
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
        //    List<NewProcessTypeList> NewTemplateList = await _processProvider.CreateGetTemplateList(SQLJOIN + SQLWhere);
        //    return NewTemplateList;

        //}


        //public async Task<List<ErrorMessage>> Check(List<FrontProcessNewProcessField> NewProcessFields)
        //{
        //    List<int> ErrorCodes = new List<int>();

        //    foreach (var NewProcessField in NewProcessFields)
        //    {
        //        if (NewProcessField.ProcessTypeStageFieldStatusId == 4)
        //            switch (NewProcessField.ProcessTypeFieldTypeId)
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
