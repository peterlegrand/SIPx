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
        public async Task<int> ReturnProcessTemplateFlowPass(SipUser CurrentUser, FrontProcessUpdateGet Process)
        {
            var Flows = await _frontProcessProvider.FrontProcessUpdateReturnFlows(Process.ProcessTemplateStageId);
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
                        if (Pass.ComparisonOperatorID == 1)  //Comparison blank
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 2 && UserSecurityLevel != Pass.ProcessTemplateFlowConditionInt) //Equal
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 3 && UserSecurityLevel <= Pass.ProcessTemplateFlowConditionInt) //
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 4 && UserSecurityLevel >= Pass.ProcessTemplateFlowConditionInt)
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 5 && UserSecurityLevel < Pass.ProcessTemplateFlowConditionInt)
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 6 && UserSecurityLevel > Pass.ProcessTemplateFlowConditionInt)
                        {
                            Where = Where + " 1=2 ";
                        }
                        if (Pass.ComparisonOperatorID == 7 && UserSecurityLevel == Pass.ProcessTemplateFlowConditionInt)
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 4) // Role user
                    {
                        var Roles = await _userProvider.UserRoles(CurrentUser.Id);
                        if (!Roles.Contains(Process.Fields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).StringValue ?? ""))
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
                        if (!Organizations.Contains(Process.Fields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 7) //  Organization role user
                    {
                        var RoleId = Process.Fields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldIDRole).StringValue ?? "";
                        var Organizations = await _userProvider.UserRoleOrganizations(CurrentUser.Id, RoleId);
                        if (!Organizations.Contains(Process.Fields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue ?? 0))
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
                        if (!Projects.Contains(Process.Fields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue ?? 0))
                        {
                            Where = Where + " 1=2 ";
                        }
                    }
                    if (Pass.ProcessTemplateFlowConditionTypeId == 11) //Project role user
                    {
                        var RoleId = Process.Fields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldIDRole).StringValue ?? "";
                        var Projects = await _userProvider.UserRoleProjects(CurrentUser.Id, RoleId);
                        if (!Projects.Contains(Process.Fields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue ?? 0))
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
                        var OrganizationInField = Process.Fields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).IntValue ?? 0;
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
                        var UserInField = Process.Fields.Find(x => x.ProcessTemplateFieldId == Pass.ProcessTemplateFieldId).StringValue ?? "";
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
                        " , ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguage.Name,'No name for this process template')) ProcessTemplateName " +
                        " , ISNULL(UserProcessTemplateFieldLanguage.Name,ISNULL(DefaultProcessTemplateFieldLanguage.Name,'No name for this process template field')) ProcessTemplateFieldName " +
                        " , ISNULL(UserProcessTemplateStageTypeLanguage.Name,ISNULL(DefaultProcessTemplateStageTypeLanguage.Name,'No description for this process template stage type')) ProcesstemplateStageTypeName" +
                        " , ISNULL(UserProcessTemplateStageLanguage.Name,ISNULL(DefaultProcessTemplateStageLanguage.Name,'No description for this process template stage')) ProcesstemplateStageName" +
                        " , ProcessFields.StringValue Subject " +
                        " , Creator.FirstName + ' ' + Creator.LastName CreatorName, Creator.PersonID CreatorID, Processes.CreatedDate, Modifier.FirstName + ' ' + Modifier.LastName ModifierName, Modifier.PersonID ModifierId, Processes.ModifiedDate " +
                        " FROM Processes JOIN ProcessFields ON ProcessFields.ProcessId = Processes.ProcessID " +
                        " JOIN ProcessTemplateFields ON ProcessTemplateFields.ProcessTemplateFieldId = ProcessFields.ProcessTemplateFieldID " +
                        " LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateLanguage ON UserProcessTemplateLanguage.ProcessTemplateId = Processes.ProcessTemplateID " +
                        " LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateLanguage ON DefaultProcessTemplateLanguage.ProcessTemplateId = Processes.ProcessTemplateID " +

                        " LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateFieldLanguage ON UserProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID " +
                        " LEFT JOIN (SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateFieldLanguage ON DefaultProcessTemplateFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldID " +

                        " LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateStageLanguage ON UserProcessTemplateStageLanguage.ProcessTemplateStageId = Processes.ProcessTemplateStageID " +
                        " LEFT JOIN (SELECT ProcessTemplateStageId, Name FROM ProcessTemplateStageLanguages JOIN Settings ON ProcessTemplateStageLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateStageLanguage ON DefaultProcessTemplateStageLanguage.ProcessTemplateStageId = Processes.ProcessTemplateStageID " +

                        " JOIN ProcessTemplateStages ON Processes.ProcessTemplateStageId = ProcessTemplateStages.ProcessTemplateStageId " +

                        " LEFT JOIN (SELECT ProcessTemplateStageTypeId, Name FROM ProcessTemplateStageTypeLanguages WHERE LanguageId = @LanguageID) UserProcessTemplateStageTypeLanguage ON UserProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeId = ProcessTemplateStages.ProcessTemplateStageTypeID " +
                        " LEFT JOIN (SELECT ProcessTemplateStageTypeId, Name FROM ProcessTemplateStageTypeLanguages JOIN Settings ON ProcessTemplateStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultProcessTemplateStageTypeLanguage ON DefaultProcessTemplateStageTypeLanguage.ProcessTemplateStageTypeId = ProcessTemplateStages.ProcessTemplateStageTypeID " +

                        " JOIN Persons Creator ON Creator.UserId = Processes.CreatorID " +
                        " JOIN Persons Modifier ON Modifier.UserId = Processes.ModifierID ";
                    string Where = " WHERE ProcessTemplateFields.ProcessTemplateFieldTypeId = 1 AND Processes.ProcessId = " + Process.ProcessId + " AND ";
                    string OrderBy = " ORDER BY ISNULL(UserProcessTemplateLanguage.Name,ISNULL(DefaultProcessTemplateLanguage.Name,'No name for this process template')) , ProcessFields.StringValue ";
                    var Conditions = await _frontProcessProvider.FrontProcessToDoConditions(Flow);
                    foreach (var Condition in Conditions)
                    {
                        var Fields = await _frontProcessProvider.FrontProcessToDoProcessFields(Process.ProcessId);

                        switch (Condition.ProcessTemplateFlowConditionTypeID)
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
                                        Fields.Find(x => x.ProcessTemplateFieldID == Condition.ProcessTemplateFieldID).StringValue != Condition.ProcessTemplateFlowConditionString
                                    &&
                                    !new[] { 1, 2, 12, 13, 30, 31, 32 }.Contains(Fields.Find(x => x.ProcessTemplateFieldID == Condition.ProcessTemplateFieldID).ProcessTemplateFieldTypeID)
                                     )
                                     ||
                                    (
                                        Fields.Find(x => x.ProcessTemplateFieldID == Condition.ProcessTemplateFieldID).IntValue != Condition.ProcessTemplateFlowConditionInt
                                    &&
                                    !new[] { 3, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 36, 37 }.Contains(Fields.Find(x => x.ProcessTemplateFieldID == Condition.ProcessTemplateFieldID).ProcessTemplateFieldTypeID)
                                     )
                                       ||
                                    (
                                        Fields.Find(x => x.ProcessTemplateFieldID == Condition.ProcessTemplateFieldID).DateTimeValue != Condition.ProcessTemplateFlowConditionDate
                                    &&
                                    !new[] { 4, 5, 6, 7, 8, 9 }.Contains(Fields.Find(x => x.ProcessTemplateFieldID == Condition.ProcessTemplateFieldID).ProcessTemplateFieldTypeID)
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
                                        if (Fields.Find(x => x.ProcessTemplateFieldTypeID == 12).IntValue != CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 2 ";
                                        }
                                        break;
                                    case 3://large
                                        if (Fields.Find(x => x.ProcessTemplateFieldTypeID == 12).IntValue >= CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 4 ";
                                        }
                                        break;
                                    case 4://Smaller
                                        if (Fields.Find(x => x.ProcessTemplateFieldTypeID == 12).IntValue <= CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 5 ";
                                        }
                                        break;
                                    case 5://Larger or equal
                                        if (Fields.Find(x => x.ProcessTemplateFieldTypeID == 12).IntValue > CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 6 ";
                                        }
                                        break;
                                    case 6://Smaller or equal
                                        if (Fields.Find(x => x.ProcessTemplateFieldTypeID == 12).IntValue < CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 7 ";
                                        }
                                        break;
                                    case 7://Not qual
                                        if (Fields.Find(x => x.ProcessTemplateFieldTypeID == 12).IntValue == CurrentUser.SecurityLevelId)
                                        {
                                            Where = Where + " 3 = 8 ";
                                        }
                                        break;
                                }
                                break;
                            case 4: //Role user
                                var RoleIds = await _userRoleProvider.UserRoleIDsPerUser(CurrentUser.Id);
                                if (!RoleIds.Contains(Fields.Find(x => x.ProcessTemplateFieldTypeID == 30).StringValue))
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
                                if (!OrganizationIds.Contains(Fields.Find(x => x.ProcessTemplateFieldTypeID == 30).IntValue))
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
                                if (!ProjectIds.Contains(Fields.Find(x => x.ProcessTemplateFieldTypeID == 30).IntValue))
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
                                if (OrganizationId != Fields.Find(x => x.ProcessTemplateFieldTypeID == 30).IntValue)
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
                                if (Fields.Find(x => x.ProcessTemplateFieldTypeID == 12).StringValue != CurrentUser.Id)
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

                    var CompareWhere = " WHERE ProcessTemplateFields.ProcessTemplateFieldTypeId = 1 AND Processes.ProcessId = " + Process.ProcessId + " AND ";
                    if (Where == CompareWhere)
                    {
                        Where = " WHERE ProcessTemplateFields.ProcessTemplateFieldTypeId = 1 AND Processes.ProcessId = " + Process.ProcessId + " ";
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
