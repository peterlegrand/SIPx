using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
//using Microsoft.AspNet.Identity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Microsoft.Data.SqlClient;
using SIPx.API.Classes;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProcessController : ControllerBase
    {
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessProvider _processProvider;
        private readonly Microsoft.AspNetCore.Identity.UserManager<SipUser> _userManager;
        private readonly ICheckProvider _checkProvider;

        public ProcessController(IClaimCheck claimCheck, IProcessProvider ProcessProvider, Microsoft.AspNetCore.Identity.UserManager<SipUser> userManager, ICheckProvider checkProvider)
        {
            _claimCheck = claimCheck;
            _processProvider = ProcessProvider;
            _userManager = userManager;
            _checkProvider = checkProvider;
        }

        [HttpGet("NewProcess")]
        public async Task<IActionResult> Get()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "5"))  //11
            {

                string SQLWhere = " WHERE 1=1 ";
                string SQLJOIN = " DECLARE @LanguageId int;" +
                    "SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeId = 1 ;" +
                    "SELECT ProcessTemplates.ProcessTemplateId ,ProcessTemplates.ProcessTemplateGroupId   " +
                    ", ISNULL(UserLanguage.Name,ISNULL(DefaultLanguage.Name,'No name for this classification')) Name " +
                    "FROM processtemplates JOIN ProcessTemplateFlows ON ProcessTemplates.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                    " LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageId) UserLanguage " +
                    "  ON UserLanguage.ProcessTemplateID= ProcessTemplates.ProcessTemplateId " +
                    " LEFT JOIN (SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
                    " ON DefaultLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateId ";

                List<int> TemplateIDs = await _processProvider.CreateGetInitialTemplateList();
                foreach (var TemplateId in TemplateIDs)
                {
                    List<ProcessTemplateFlowConditionOld> TemplateFlowConditions = await _processProvider.CreateGetFlowConditionList(TemplateId);

                    if (TemplateFlowConditions.Count() > 0)
                    { SQLWhere += " AND "; }
                    foreach (var Condition in TemplateFlowConditions)
                    {
                        //Condition types
                        //SELECT ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeId, Name FROM ProcessTemplateFlowConditionTypes JOIN UITermLanguages ON ProcessTemplateFlowConditionTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeID
                        //Field types
                        //SELECT 'case ' + cast(ProcessTemplateFieldTypes.ProcessTemplateFieldTypeId as char(2))+ ': //', Name FROM ProcessTemplateFieldTypes JOIN UITermLanguages ON ProcessTemplateFieldTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFieldTypes.ProcessTemplateFieldTypeID

                        switch (Condition.ProcessTemplateFlowConditionTypeId)
                        {
                            //Case 1 is Creator User which doesn't happen for a new process 
                            //Case 2 is Field which doesn't happen as it would check against default value which doesn't make sense.
                            case 3: //Security level user

                                //SELECT 'case ' + cast(ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorId as char(2))+ ': //', Name FROM ProcessTemplateFlowConditionComparisonOperators JOIN UITermLanguages ON ProcessTemplateFlowConditionComparisonOperators.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorID
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 28 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue ";
                                switch (Condition.ComparisonOperatorId)
                                {
                                    case 2:
                                        SQLWhere += " = ";
                                        break;
                                    case 3:
                                        SQLWhere += " > ";
                                        break;
                                    case 4:
                                        SQLWhere += " >= ";
                                        break;
                                    case 5:
                                        SQLWhere += " >= ";
                                        break;
                                    case 6:
                                        SQLWhere += " <= ";
                                        break;
                                    case 7:
                                        SQLWhere += " <> ";
                                        break;

                                }
                                SQLWhere += CurrentUser.SecurityLevelId.ToString();
                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                                break;
                            case 4: //User role
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 30 AND Table" + Condition.ProcessTemplateFlowId + "a.StringValue IN (SELECT RoleId FROM AspNetUserRoles WHERE UserId = '" + CurrentUser.Id + "') ";

                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";

                                break;
                            //  Manager user field there is no user yet stored in the process
                            case 6: //   Organization user
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'OrganizationRight') ";

                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                                break;
                            case 7: //	Organization role user
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeId = 14 " +

                                    " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeId = 30 " +
                                    " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserId = '" + CurrentUser.Id + "'  ";

                                //Link to field of project
                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        "Field ON Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "StageField.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField.ProcessTemplateStageId "

                                        //Link to field of role
                                        + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        "FieldRole ON Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "StageFieldRole.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateFieldId " +
                                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.ProcessTemplateStageId " +
                                    " JOIN aspnetuserroles Table" + Condition.ProcessTemplateFlowId + "UserRole " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "UserROle.RoleId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.StringValue " +
                                    " JOIN aspnetroleclaims Table" + Condition.ProcessTemplateFlowId + "RoleClaim " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTemplateFlowId + "UserRole.RoleId " +
                                        " AND CAST(Table" + Condition.ProcessTemplateFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTemplateFlowId + "StageField.IntValue "
                                        ;
                                break;
                            //	Organization parent user no parent
                            //	Organization parent role user
                            case 10: //	Project user
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 16 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'ProjectRight') ";

                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                                break;
                            case 11: //	Project role user
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeId = 16 " +

                                    " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeId = 30 " +
                                    " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserId = '" + CurrentUser.Id + "'  ";

                                //Link to field of project
                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        "Field ON Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "StageField.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField.ProcessTemplateStageId "

                                        //Link to field of role
                                        + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        "FieldRole ON Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "StageFieldRole.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateFieldId " +
                                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.ProcessTemplateStageId " +
                                    " JOIN aspnetuserroles Table" + Condition.ProcessTemplateFlowId + "UserRole " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "UserROle.RoleId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.StringValue " +
                                    " JOIN aspnetroleclaims Table" + Condition.ProcessTemplateFlowId + "RoleClaim " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTemplateFlowId + "UserRole.RoleId " +
                                        " AND CAST(Table" + Condition.ProcessTemplateFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTemplateFlowId + "StageField.IntValue "
                                        ;
                                break;
                            //	Project parent user
                            //	Project parent role user
                            case 14: //	Default organization user
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT persons.DefaultOrganizationId FROM persons WHERE persons.UserID'" + CurrentUser.Id + "' ) ";

                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                                break;
                            case 15: //	Open bracket
                                SQLWhere += " ( ";
                                break;
                            case 16: //	and
                                SQLWhere += " AND ";
                                break;
                            case 17: //	or
                                SQLWhere += " OR ";
                                break;
                            case 18: //	Close bracket
                                SQLWhere += " ) ";
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

                List<NewProcessTemplateList> NewTemplateList = await _processProvider.CreateGetTemplateList(SQLJOIN + SQLWhere);

                return Ok(NewTemplateList);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("ToDo")]
        public async Task<IActionResult> ToDo()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "5"))  //11
            {

                string SQLWhere = " WHERE 1=1 ";
                string SQLJOIN = " DECLARE @LanguageId int;" +
                    "SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeId = 1 ;" +
                

                "SELECT Processes.ProcessID " +
                "    , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, 'No name for this process')) ProcessTemplateName " +
                "    , ISNULL(UserFieldLanguage.Name, ISNULL(DefaultFieldLanguage.Name, 'No name for this Field')) ProcessTemplateFieldName " +
                "    , ISNULL(UserStageTypeLanguage.Name, ISNULL(DefaultStageTypeLanguage.Name, 'No name for this Field')) StageTypeName " +
                " 	 , ProcessFields.StringValue Title " +
                "FROM processes " +
                "JOIN ProcessFields " +
                "    ON Processes.ProcessID = ProcessFields.ProcessFieldID " +
                "JOIN processtemplateStages " +
                "    ON Processes.ProcessTemplateStageID = ProcessTemplateStages.ProcessTemplateStageID " +
                "       AND Processes.ProcessTemplateID = ProcessTemplateStages.ProcessTemplateID " +
                "JOIN ProcessTemplateStageTypes " +
                "    ON ProcessTemplateStageTypes.ProcessTemplateStageTypeID = ProcessTemplateStages.ProcessTemplateStageTypeID " +
                "LEFT JOIN(SELECT ProcessTemplateStageTypeId, Name FROM ProcessTemplateStageTypeLanguages WHERE LanguageId = @LanguageId) UserStageTypeLanguage " +
                "    ON UserStageTypeLanguage.ProcessTemplateStageTypeID = ProcessTemplateStageTypes.ProcessTemplateStageTypeId " +
                "LEFT JOIN(SELECT ProcessTemplateStageTypeId, Name FROM ProcessTemplateStageTypeLanguages JOIN Settings ON ProcessTemplateStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultStageTypeLanguage " +
                "   ON DefaultStageTypeLanguage.ProcessTemplateStageTypeId = ProcessTemplateStageTypes.ProcessTemplateStageTypeId " +
                "JOIN ProcessTemplateFields " +
                "    ON ProcessTemplateFields.ProcessTemplateFieldID = ProcessFields.ProcessTemplateFieldID " +
                "LEFT JOIN(SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages WHERE LanguageId = @LanguageId) UserFieldLanguage " +
                "    ON UserFieldLanguage.ProcessTemplateFieldID = ProcessTemplateFields.ProcessTemplateFieldId " +
                "LEFT JOIN(SELECT ProcessTemplateFieldId, Name FROM ProcessTemplateFieldLanguages JOIN Settings ON ProcessTemplateFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultFieldLanguage " +
                "   ON DefaultFieldLanguage.ProcessTemplateFieldId = ProcessTemplateFields.ProcessTemplateFieldId " +
                "JOIN ProcessTemplates " +
                "    ON PRocesses.ProcessTemplateID = ProcessTemplates.ProcessTemplateID " +
                "JOIN ProcessTemplateFlows ON ProcessTemplates.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                "LEFT JOIN(SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages WHERE LanguageId = @LanguageId) UserLanguage " +
                "    ON UserLanguage.ProcessTemplateID = ProcessTemplates.ProcessTemplateId " +
                "LEFT JOIN(SELECT ProcessTemplateId, Name FROM ProcessTemplateLanguages JOIN Settings ON ProcessTemplateLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
                "   ON DefaultLanguage.ProcessTemplateId = ProcessTemplates.ProcessTemplateId";
                List<int> TemplateIDs = await _processProvider.CreateGetInitialTemplateList();
                foreach (var TemplateId in TemplateIDs)
                {
                    List<ProcessTemplateFlowConditionOld> TemplateFlowConditions = await _processProvider.CreateGetFlowConditionList(TemplateId);

                    if (TemplateFlowConditions.Count() > 0)
                    { SQLWhere += " AND "; }
                    foreach (var Condition in TemplateFlowConditions)
                    {
                        //Condition types
                        //SELECT ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeId, Name FROM ProcessTemplateFlowConditionTypes JOIN UITermLanguages ON ProcessTemplateFlowConditionTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFlowConditionTypes.ProcessTemplateFlowConditionTypeID
                        //Field types
                        //SELECT 'case ' + cast(ProcessTemplateFieldTypes.ProcessTemplateFieldTypeId as char(2))+ ': //', Name FROM ProcessTemplateFieldTypes JOIN UITermLanguages ON ProcessTemplateFieldTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFieldTypes.ProcessTemplateFieldTypeID

                        switch (Condition.ProcessTemplateFlowConditionTypeId)
                        {
                            //Case 1 is Creator User which doesn't happen for a new process 
                            //Case 2 is Field which doesn't happen as it would check against default value which doesn't make sense.
                            case 3: //Security level user

                                //SELECT 'case ' + cast(ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorId as char(2))+ ': //', Name FROM ProcessTemplateFlowConditionComparisonOperators JOIN UITermLanguages ON ProcessTemplateFlowConditionComparisonOperators.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTemplateFlowConditionComparisonOperators.ProcessTemplateFlowConditionComparisonOperatorID
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 28 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue ";
                                switch (Condition.ComparisonOperatorId)
                                {
                                    case 2:
                                        SQLWhere += " = ";
                                        break;
                                    case 3:
                                        SQLWhere += " > ";
                                        break;
                                    case 4:
                                        SQLWhere += " >= ";
                                        break;
                                    case 5:
                                        SQLWhere += " >= ";
                                        break;
                                    case 6:
                                        SQLWhere += " <= ";
                                        break;
                                    case 7:
                                        SQLWhere += " <> ";
                                        break;

                                }
                                SQLWhere += CurrentUser.SecurityLevelId.ToString();
                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                                break;
                            case 4: //User role
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 30 AND Table" + Condition.ProcessTemplateFlowId + "a.StringValue IN (SELECT RoleId FROM AspNetUserRoles WHERE UserId = '" + CurrentUser.Id + "') ";

                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";

                                break;
                            //  Manager user field there is no user yet stored in the process
                            case 6: //   Organization user
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'OrganizationRight') ";

                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                                break;
                            case 7: //	Organization role user
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeId = 14 " +

                                    " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeId = 30 " +
                                    " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserId = '" + CurrentUser.Id + "'  ";

                                //Link to field of project
                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        "Field ON Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "StageField.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField.ProcessTemplateStageId "

                                        //Link to field of role
                                        + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        "FieldRole ON Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "StageFieldRole.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateFieldId " +
                                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.ProcessTemplateStageId " +
                                    " JOIN aspnetuserroles Table" + Condition.ProcessTemplateFlowId + "UserRole " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "UserROle.RoleId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.StringValue " +
                                    " JOIN aspnetroleclaims Table" + Condition.ProcessTemplateFlowId + "RoleClaim " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTemplateFlowId + "UserRole.RoleId " +
                                        " AND CAST(Table" + Condition.ProcessTemplateFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTemplateFlowId + "StageField.IntValue "
                                        ;
                                break;
                            //	Organization parent user no parent
                            //	Organization parent role user
                            case 10: //	Project user
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 16 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'ProjectRight') ";

                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                                break;
                            case 11: //	Project role user
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeId = 16 " +

                                    " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeId = 30 " +
                                    " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserId = '" + CurrentUser.Id + "'  ";

                                //Link to field of project
                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        "Field ON Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "StageField.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "Field.ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageField.ProcessTemplateStageId "

                                        //Link to field of role
                                        + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        "FieldRole ON Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "StageFieldRole.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + "FieldRole.ProcessTemplateFieldId " +
                                            " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.ProcessTemplateStageId " +
                                    " JOIN aspnetuserroles Table" + Condition.ProcessTemplateFlowId + "UserRole " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "UserROle.RoleId = Table" + Condition.ProcessTemplateFlowId.ToString() + "StageFieldRole.StringValue " +
                                    " JOIN aspnetroleclaims Table" + Condition.ProcessTemplateFlowId + "RoleClaim " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTemplateFlowId + "UserRole.RoleId " +
                                        " AND CAST(Table" + Condition.ProcessTemplateFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTemplateFlowId + "StageField.IntValue "
                                        ;
                                break;
                            //	Project parent user
                            //	Project parent role user
                            case 14: //	Default organization user
                                SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT persons.DefaultOrganizationId FROM persons WHERE persons.UserID'" + CurrentUser.Id + "' ) ";

                                SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                        " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                    " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                        " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                        " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                                break;
                            case 15: //	Open bracket
                                SQLWhere += " ( ";
                                break;
                            case 16: //	and
                                SQLWhere += " AND ";
                                break;
                            case 17: //	or
                                SQLWhere += " OR ";
                                break;
                            case 18: //	Close bracket
                                SQLWhere += " ) ";
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

                List<ToDoIndexGet> NewTemplateList = await _processProvider.ToDoIndexGet(SQLJOIN + SQLWhere);

                return Ok(NewTemplateList);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("NewProcessGet{ProcessTemplateId}")]
        public async Task<IActionResult> NewProcessGet(int ProcessTemplateId)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            var testifallowed = new NewProcessCheckAllowed(_processProvider);

            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "5"))  //11
            {
                List<NewProcessTemplateList> x = await testifallowed.CheckProcessTemplateID(CurrentUser, ProcessTemplateId);

                if (x.Exists(x => x.ProcessTemplateId == ProcessTemplateId))
                    //TOFIX PETER
                    return Ok(await _processProvider.CreateGet(CurrentUser.Id, ProcessTemplateId));// CurrentUser.LanguageId));
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost]
        public async Task<IActionResult> CreateNewProcess(NewProcessFromAPI ProcessesFromAPI)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var testifallowed = new NewProcessCheckAllowed(_processProvider);
            DataTable ProcessFields = NewProcessField.CreateTable();

            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "186"))  //11
            {
                List<NewProcessTemplateList> x = await testifallowed.CheckProcessTemplateID(CurrentUser, ProcessesFromAPI.ProcessTemplateId);
                if (x.Exists(x => x.ProcessTemplateId == ProcessesFromAPI.ProcessTemplateId))
                {

                    List<NewProcessFromDB> ProcessesFromDB = await _processProvider.CreateGet(CurrentUser.Id, ProcessesFromAPI.ProcessTemplateId);
                    int NoOfFields = ProcessesFromDB.Count();
                    int EqualSequenceCount = 0;
                    if (ProcessesFromDB.Exists(z => z.ProcessTemplateStageId == ProcessesFromAPI.ProcessTemplateStageId) & ProcessesFromDB.Count() == ProcessesFromAPI.ProcessFields.Count())
                    {
                        foreach (var ProcessFromDB in ProcessesFromDB)
                        {
                            foreach (var ProcessFieldFromAPI in ProcessesFromAPI.ProcessFields)
                            {

                                if (ProcessFieldFromAPI.Sequence == ProcessFromDB.Sequence & ProcessFieldFromAPI.ProcessTemplateFieldId == ProcessFromDB.ProcessTemplateFieldId)
                                {
                                    EqualSequenceCount++;
                                    switch (ProcessFromDB.ProcessTemplateFieldTypeId)
                                    {

                                        case 12: //User
                                        case 13: //Sec user
                                            if (!await _checkProvider.CheckUser(ProcessFieldFromAPI.StringValue) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "User does not exist",
                                                });
                                            }
                                            break;

                                        case 30: //role
                                        case 31://sec role
                                            if (!await _checkProvider.CheckRole(ProcessFieldFromAPI.StringValue) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Role does not exist",
                                                });
                                            }
                                            break;

                                        case 34: // organization role
                                            if (!await _checkProvider.CheckOrganizationRole(ProcessFieldFromAPI.StringValue) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Organization role does not exist",
                                                });
                                            }
                                            break;
                                        case 35: // project role
                                            if (!await _checkProvider.CheckProjectRole(ProcessFieldFromAPI.StringValue) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Project role does not exist",
                                                });
                                            }
                                            break;


                                        case 3: //Number
                                        case 14://Organization
                                        case 15://Sec org
                                            if (!await _checkProvider.CheckOrganization((ProcessFieldFromAPI.IntValue ?? 0)) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Orgnization does not exist",
                                                });
                                            }
                                            break;
                                        case 16://Project
                                        case 17://Sec project
                                            if (!await _checkProvider.CheckProject((ProcessFieldFromAPI.IntValue ?? 0)) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Project does not exist",
                                                });
                                            }
                                            break;
                                        case 18://Language
                                        case 19://Sec lang
                                            if (!await _checkProvider.CheckLanguage((ProcessFieldFromAPI.IntValue ?? 0)) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Language does not exist",
                                                });
                                            }
                                            break;
                                        case 20://Classification
                                        case 21://Sec class
                                            if (!await _checkProvider.CheckClassification((ProcessFieldFromAPI.IntValue ?? 0)) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Classification does not exist",
                                                });
                                            }
                                            break;
                                        case 22://Classification value
                                        case 23://Sec class value
                                            if (!await _checkProvider.CheckClassificationValue((ProcessFieldFromAPI.IntValue ?? 0)) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Classification value does not exist",
                                                });
                                            }
                                            break;
                                        case 24://Content
                                        case 25://Sec contentt
                                            if (!await _checkProvider.CheckContent((ProcessFieldFromAPI.IntValue ?? 0)) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Content does not exist",
                                                });
                                            }
                                            break;
                                        case 26://Country
                                        case 27://Sec country
                                            if (!await _checkProvider.CheckCountry((ProcessFieldFromAPI.IntValue ?? 0)) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Country does not exist",
                                                });
                                            }
                                            break;
                                        case 28://security level
                                        case 29: //sec security level
                                            if (!await _checkProvider.CheckSecurityLevel((ProcessFieldFromAPI.IntValue ?? 0)) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Security level does not exist",
                                                });
                                            }
                                            break;
                                        case 33: //user has specific relation to user field
                                            if (!await _checkProvider.CheckUserRelation((ProcessFieldFromAPI.IntValue ?? 0)) & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "User relation does not exist",
                                                });
                                            }
                                            break;
                                            //case 4: //Date
                                            //case 5:
                                            //case 6:
                                            //case 7:
                                            //case 8:
                                            //case 9:

                                            //case 10: //button
                                            //case 11:

                                    }
                                    switch (ProcessFromDB.ProcessTemplateFieldTypeId)
                                    {
                                        case 1: //Text - Subject
                                        case 2: //text
                                        case 12: //User
                                        case 13: //Sec user
                                        case 30: //role
                                        case 31://sec role
                                        case 32: // html
                                        case 34: // organization role
                                        case 35: // project role
                                            if (ProcessFromDB.ProcessTemplateStageFieldStatusId == 4 & ProcessFieldFromAPI.StringValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Required value is missing 1",
                                                });

                                            }

                                            break;
                                        case 3: //Number
                                        case 14://Organization
                                        case 15://Sec org
                                        case 16://Project
                                        case 17://Sec project
                                        case 18://Language
                                        case 19://Sec lang
                                        case 20://Classification
                                        case 21://Sec class
                                        case 22://Classification value
                                        case 23://Sec class value
                                        case 24://Content
                                        case 25://Sec contentt
                                        case 26://Country
                                        case 27://Sec country
                                        case 28://security level
                                        case 29: //sec security level
                                        case 33: //user has specific relation to user field
                                            if (ProcessFromDB.ProcessTemplateStageFieldStatusId == 4 & ProcessFieldFromAPI.IntValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Required value is missing 2",
                                                });

                                            }

                                            break;

                                        case 4: //Date
                                        case 5:
                                        case 6:
                                        case 7:
                                        case 8:
                                        case 9:
                                            if (ProcessFromDB.ProcessTemplateStageFieldStatusId == 4 & ProcessFieldFromAPI.DateTimeValue == null)
                                            {
                                                return BadRequest(new
                                                {
                                                    IsSuccess = false,
                                                    Message = "Required value is missing 3",
                                                });

                                            }

                                            break;

                                            //case 10: //button
                                            //case 11:

                                    }
                                }
                            }
                        }

                        foreach (var ProcessFieldFromAPI in ProcessesFromAPI.ProcessFields)
                        {
                            ProcessFields.Rows.Add(ProcessFieldFromAPI.ProcessTemplateId, ProcessFieldFromAPI.ProcessTemplateFieldId, ProcessFieldFromAPI.StringValue, ProcessFieldFromAPI.IntValue, ProcessFieldFromAPI.DateTimeValue);
                        }

                        //   SqlParameter Parameters = cmd.Parameters.AddWithValue("@FieldsTable", ProcessFields);
                    //    System.Data.SqlClient.SqlParameter[] Parameters =  {
                    //    new System.Data.SqlClient.SqlParameter("@User", CurrentUser.Id)
                    //    , new System.Data.SqlClient.SqlParameter("@ProcessTemplateID", ProcessesFromAPI.ProcessTemplateId)
                    //    , new System.Data.SqlClient.SqlParameter("@ProcessTemplateStageID", ProcessesFromAPI.ProcessTemplateStageId)
                    //    , new System.Data.SqlClient.SqlParameter("@FieldsTable", ProcessFields)
                    //};
                        await _processProvider.CreatePost("usp_CreateProcess @User, @ProcessTemplateId, @ProcessTemplateStageId, @FieldsTable", CurrentUser.Id,  ProcessesFromAPI.ProcessTemplateId, ProcessesFromAPI.ProcessTemplateStageId, ProcessFields );
                        return Ok();
                    }

                }
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights 1",
            });
            //            return Ok();
        }

        [HttpGet("Delete/{Id:int}")]
        public async Task<IActionResult> Delete(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                if (await _checkProvider.CheckIfRecordExists("Processs", "ProcessID", Id) == 0)
                {
                    return BadRequest(new
                    {
                        IsSuccess = false,
                        Message = "No record with this ID",
                    });
                }
                var x = await _processProvider.DeleteGet(CurrentUser.Id, Id);
                return Ok(x);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpPost("Delete")]
        public async Task<IActionResult> Delete(ProcessDeleteGet Process)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                Process.CreatorId = CurrentUser.Id;
                //var CheckString = await _ProcessProvider.DeletePostCheck(Process);
                //if (CheckString.Length == 0)
                //{
                _processProvider.DeletePost(Process.ProcessId);
                return Ok(Process);
                //}
                return BadRequest(new
                {
                    IsSuccess = false,
                    //Message = CheckString,
                });

            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });


        }
    }
}
