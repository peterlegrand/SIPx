using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;

namespace SIPx.API.Classes
{
    public class FrontProcessToDoLogic
    {
        private readonly IProjectProvider _projectProvider;
        private readonly IOrganizationProvider _organizationProvider;
        private readonly IUserRoleProvider _userRoleProvider;
        private readonly IRoleProvider _roleProvider;
        private readonly IUserProvider _userProvider;
        private readonly IProcessProvider _processProvider;
        private readonly IFrontProcessProvider _frontProcessProvider;

        public FrontProcessToDoLogic(IProjectProvider projectProvider, IOrganizationProvider organizationProvider, IUserRoleProvider userRoleProvider, IRoleProvider roleProvider, IUserProvider userProvider, IProcessProvider ProcessProvider, IFrontProcessProvider frontProcessProvider)
        {
            _projectProvider = projectProvider;
            _organizationProvider = organizationProvider;
            _userRoleProvider = userRoleProvider;
            _roleProvider = roleProvider;
            _userProvider = userProvider;
            _processProvider = ProcessProvider;
            _frontProcessProvider = frontProcessProvider;
        }
        public async Task<int> ReturnProcessTypeFlowPass(SipUser CurrentUser, FrontProcessUpdateGet Process)
        {
            var Flows = await _frontProcessProvider.FrontProcessUpdateReturnFlows(Process.ProcessTypeStageId);
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
                        if (Pass.ComparisonOperatorID == 1)  //Comparison blank
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 2 && UserSecurityLevel != Pass.ProcessTypeFlowConditionInt) //Equal
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 3 && UserSecurityLevel <= Pass.ProcessTypeFlowConditionInt) //
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 4 && UserSecurityLevel >= Pass.ProcessTypeFlowConditionInt)
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 5 && UserSecurityLevel < Pass.ProcessTypeFlowConditionInt)
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 6 && UserSecurityLevel > Pass.ProcessTypeFlowConditionInt)
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 7 && UserSecurityLevel == Pass.ProcessTypeFlowConditionInt)
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 4) // Role user
                    {
                        var Roles = await _userProvider.UserRoles(CurrentUser.Id);
                        if (!Roles.Contains(Process.Fields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).StringValue ?? ""))
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
                        if (!Organizations.Contains(Process.Fields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 7) //  Organization role user
                    {
                        var RoleId = Process.Fields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldIDRole).StringValue ?? "";
                        var Organizations = await _userProvider.UserRoleOrganizations(CurrentUser.Id, RoleId);
                        if (!Organizations.Contains(Process.Fields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue ?? 0))
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
                        if (!Projects.Contains(Process.Fields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTypeFlowConditionTypeId == 11) //Project role user
                    {
                        var RoleId = Process.Fields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldIDRole).StringValue ?? "";
                        var Projects = await _userProvider.UserRoleProjects(CurrentUser.Id, RoleId);
                        if (!Projects.Contains(Process.Fields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue ?? 0))
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
                        var OrganizationInField = Process.Fields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).IntValue ?? 0;
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
                        var UserInField = Process.Fields.Find(x => x.ProcessTypeFieldId == Pass.ProcessTypeFieldId).StringValue ?? "";
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

        public async Task<List<ToDoIndexGet>> ReturnProcessList(SipUser CurrentUser)
        {
            List<ToDoIndexGet> ToDoList = new List<ToDoIndexGet>();
            var FlowList = await _frontProcessProvider.FrontProcessToDoFlows();
            foreach (var Flow in FlowList)
            {
                var Processes = await _frontProcessProvider.FrontProcessToDoProcesses(Flow);
                foreach (var Process in Processes)
                {
                    string From = "DECLARE @LanguageId int; SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeId = 1 ;" +
                        " SELECT Processes.ProcessID " +
                        " , ISNULL(UserProcessTypeLanguage.Name,ISNULL(DefaultProcessTypeLanguage.Name,'No name for this process type')) ProcessTypeName " +
                        " , ISNULL(UserProcessTypeFieldLanguage.Name,ISNULL(DefaultProcessTypeFieldLanguage.Name,'No name for this process type field')) ProcessTypeFieldName " +
                        " , ISNULL(UserProcessTypeStageTypeLanguage.Name,ISNULL(DefaultProcessTypeStageTypeLanguage.Name,'No description for this process type stage type')) ProcesstypeStageTypeName" +
                        " , ISNULL(UserProcessTypeStageLanguage.Name,ISNULL(DefaultProcessTypeStageLanguage.Name,'No description for this process type stage')) ProcesstypeStageName" +
                        " , ProcessFields.StringValue Subject " +
                        " , Creator.FirstName + ' ' + Creator.LastName CreatorName, Creator.PersonID CreatorID, Processes.CreatedDate, Modifier.FirstName + ' ' + Modifier.LastName ModifierName, Modifier.PersonID ModifierId, Processes.ModifiedDate " +
                        " FROM Processes JOIN ProcessFields ON ProcessFields.ProcessId = Processes.ProcessID " +
                        " JOIN ProcessTypeFields ON ProcessTypeFields.ProcessTypeFieldId = ProcessFields.ProcessTypeFieldID " +
                        " LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeLanguage ON UserProcessTypeLanguage.ProcessTypeId = Processes.ProcessTypeID " +
                        " LEFT JOIN (SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeLanguage ON DefaultProcessTypeLanguage.ProcessTypeId = Processes.ProcessTypeID " +

                        " LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTypeFieldLanguage ON UserProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID " +
                        " LEFT JOIN (SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeFieldLanguage ON DefaultProcessTypeFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldID " +

                        " LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages WHERE LanguageId = @LanguageID) UserProcessTypeStageLanguage ON UserProcessTypeStageLanguage.ProcessTypeStageId = Processes.ProcessTypeStageID " +
                        " LEFT JOIN (SELECT ProcessTypeStageId, Name FROM ProcessTypeStageLanguages JOIN Settings ON ProcessTypeStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeStageLanguage ON DefaultProcessTypeStageLanguage.ProcessTypeStageId = Processes.ProcessTypeStageID " +

                        " JOIN ProcessTypeStages ON Processes.ProcessTypeStageId = ProcessTypeStages.ProcessTypeStageId " +

                        " LEFT JOIN (SELECT ProcessTypeStageTypeId, Name FROM ProcessTypeStageTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTypeStageTypeLanguage ON UserProcessTypeStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStages.ProcessTypeStageTypeID " +
                        " LEFT JOIN (SELECT ProcessTypeStageTypeId, Name FROM ProcessTypeStageTypeLanguages JOIN Settings ON ProcessTypeStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTypeStageTypeLanguage ON DefaultProcessTypeStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStages.ProcessTypeStageTypeID " +

                        " JOIN Persons Creator ON Creator.UserId = Processes.CreatorID " +
                        " JOIN Persons Modifier ON Modifier.UserId = Processes.ModifierID ";
                    string Where = " WHERE ProcessTypeFields.ProcessTypeFieldTypeId = 1 AND Processes.ProcessId = " + Process.ProcessId + " AND ";
                    string OrderBy = " ORDER BY ISNULL(UserProcessTypeLanguage.Name,ISNULL(DefaultProcessTypeLanguage.Name,'No name for this process type')) , ProcessFields.StringValue ";
                    var Conditions = await _frontProcessProvider.FrontProcessToDoConditions(Flow);
                    foreach (var Condition in Conditions)
                    {
                        var Fields = await _frontProcessProvider.FrontProcessToDoProcessFields(Process.ProcessId);

                        switch (Condition.ProcessTypeFlowConditionTypeID)
                        {

                            case 1: //Creator is user
                                if (Process.CreatorId != CurrentUser.Id)
                                {
                                    Where = Where + " 1 = 2 ";
                                }
                                break;
                            case 2: //Field
                                if (
                                    //PETER TODO maybe still adjust for condition <>=
                                    (
                                        Fields.Find(x => x.ProcessTypeFieldID == Condition.ProcessTypeFieldID).StringValue != Condition.ProcessTypeFlowConditionString
                                    &&
                                    !new[] { 1, 2, 12, 13, 30, 31, 32 }.Contains(Fields.Find(x => x.ProcessTypeFieldID == Condition.ProcessTypeFieldID).ProcessTypeFieldTypeID)
                                     )
                                     ||
                                    (
                                        Fields.Find(x => x.ProcessTypeFieldID == Condition.ProcessTypeFieldID).IntValue != Condition.ProcessTypeFlowConditionInt
                                    &&
                                    !new[] { 3, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 36, 37 }.Contains(Fields.Find(x => x.ProcessTypeFieldID == Condition.ProcessTypeFieldID).ProcessTypeFieldTypeID)
                                     )
                                       ||
                                    (
                                        Fields.Find(x => x.ProcessTypeFieldID == Condition.ProcessTypeFieldID).DateTimeValue != Condition.ProcessTypeFlowConditionDate
                                    &&
                                    !new[] { 4, 5, 6, 7, 8, 9 }.Contains(Fields.Find(x => x.ProcessTypeFieldID == Condition.ProcessTypeFieldID).ProcessTypeFieldTypeID)
                                     )
                                    )
                                { }
                                else
                                {
                                    Where = Where + " 2 = 3 ";
                                }

                                break;
                            case 3: //Security level user
                                switch (Condition.ComparisonOperatorID)
                                {
                                    case 1: //none
                                        Where = Where + " 3 = 1 ";

                                        break;
                                    case 2: //=
                                        if (Fields.Find(x => x.ProcessTypeFieldTypeID == 12).IntValue != CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 2 ";
                                        }
                                        break;
                                    case 3://large
                                        if (Fields.Find(x => x.ProcessTypeFieldTypeID == 12).IntValue >= CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 4 ";
                                        }
                                        break;
                                    case 4://Smaller
                                        if (Fields.Find(x => x.ProcessTypeFieldTypeID == 12).IntValue <= CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 5 ";
                                        }
                                        break;
                                    case 5://Larger or equal
                                        if (Fields.Find(x => x.ProcessTypeFieldTypeID == 12).IntValue > CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 6 ";
                                        }
                                        break;
                                    case 6://Smaller or equal
                                        if (Fields.Find(x => x.ProcessTypeFieldTypeID == 12).IntValue < CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 7 ";
                                        }
                                        break;
                                    case 7://Not qual
                                        if (Fields.Find(x => x.ProcessTypeFieldTypeID == 12).IntValue == CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 8 ";
                                        }
                                        break;
                                }
                                break;
                            case 4: //Role user
                                var RoleIds = await _userRoleProvider.UserRoleIDsPerUser(CurrentUser.Id);
                                if (!RoleIds.Contains(Fields.Find(x => x.ProcessTypeFieldTypeID == 30).StringValue))
                                {
                                    Where = Where + " 3 = 8 ";
                                }
                                break;
                            case 5: //Manager user field
                                    //PETER TODO
                                break;
                            case 6: //Organization user
                                //PETER TODO do we need to split Main organization, any organization or for specific role
                                var OrganizationIds = await _organizationProvider.OrganizationIDsPerUser(CurrentUser.Id);
                                if (!OrganizationIds.Contains(Fields.Find(x => x.ProcessTypeFieldTypeID == 30).IntValue))
                                {
                                    Where = Where + " 3 = 8 ";
                                }
                                break;
                            case 7: //Organization role user
                                break;
                            case 8: //Organization parent user

                                break;
                            case 9: //Organization parent role user

                                break;
                            case 10: //Project user

                                break;
                            case 11: //Project role user
                                var ProjectIds = await _projectProvider.ProjectIDsPerUser(CurrentUser.Id);
                                if (!ProjectIds.Contains(Fields.Find(x => x.ProcessTypeFieldTypeID == 30).IntValue))
                                {
                                    Where = Where + " 3 = 8 ";
                                }

                                break;
                            case 12: //Project parent user

                                break;
                            case 13: //Project parent role user

                                break;
                            case 14: //Default organization user
                                var OrganizationId = await _organizationProvider.MainOrganizationIDPerUser(CurrentUser.Id);
                                if (OrganizationId != Fields.Find(x => x.ProcessTypeFieldTypeID == 30).IntValue)
                                {
                                    Where = Where + " 3 = 8 ";
                                }

                                break;
                            case 15: //Open bracket
                                Where = Where + " ( ";

                                break;
                            case 16: //and
                                Where = Where + " AND ";

                                break;
                            case 17: //or
                                Where = Where + " OR ";

                                break;
                            case 18: //Close bracket
                                Where = Where + " ) ";

                                break;
                            case 19: //User
                                if (Fields.Find(x => x.ProcessTypeFieldTypeID == 12).StringValue != CurrentUser.Id)
                                {
                                    Where = Where + " 1 = 2 ";
                                }

                                break;
                            case 20: //Relation to creator

                                break;
                            case 21: //Relation to user field

                                break;
                            case 22: //Classification relation

                                break;
                            case 23: //Classification relation type
                                break;
                        }

                    }

                    var CompareWhere = " WHERE ProcessTypeFields.ProcessTypeFieldTypeId = 1 AND Processes.ProcessId = " + Process.ProcessId + " AND ";
                    if (Where == CompareWhere)
                    {
                        Where = " WHERE ProcessTypeFields.ProcessTypeFieldTypeId = 1 AND Processes.ProcessId = " + Process.ProcessId + " ";
                    }
                    var ToDos = await _frontProcessProvider.FrontProcessToDo(From + Where + OrderBy);
                    if(ToDos.Count==1)
                    {
                        var ToDo = ToDos.First();
                    if (!ToDoList.Any(x => x.ProcessId == ToDo.ProcessId))
                    {
                        ToDoList.Add(ToDo);
                    }
                    }
                }
            }
            return ToDoList;

        }
    }
}
