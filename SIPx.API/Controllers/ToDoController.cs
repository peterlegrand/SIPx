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
    public class ToDoController : ControllerBase
    {
        private readonly IUserProvider _userProvider;
        private readonly IFrontProcessProvider _frontProcessProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessProvider _processProvider;
        private readonly Microsoft.AspNetCore.Identity.UserManager<SipUser> _userManager;
        private readonly ICheckProvider _checkProvider;

        public ToDoController(IUserProvider userProvider
            , IFrontProcessProvider frontProcessProvider
            , IClaimCheck claimCheck
            , IProcessProvider ProcessProvider
            , Microsoft.AspNetCore.Identity.UserManager<SipUser> userManager
            , ICheckProvider checkProvider)
        {
            _userProvider = userProvider;
            _frontProcessProvider = frontProcessProvider;
            _claimCheck = claimCheck;
            _processProvider = ProcessProvider;
            _userManager = userManager;
            _checkProvider = checkProvider;
        }

  
        //[HttpGet("Index")]
        //public async Task<IActionResult> Index()
        //{
        //    var CurrentUser = await _userManager.GetUserAsync(User);
        //                if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  //11
        //    {

        //        string SQLWhere = " WHERE 1=1 ";
        //        string SQLJOIN = " DECLARE @LanguageId int;" +
        //            "SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + CurrentUser.Id + "' AND UserPreferences.PreferenceTypeId = 1 ;" +
                

        //        "SELECT Processes.ProcessID " +
        //        "    , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, 'No name for this process')) ProcessTypeName " +
        //        "    , ISNULL(UserFieldLanguage.Name, ISNULL(DefaultFieldLanguage.Name, 'No name for this Field')) ProcessTypeFieldName " +
        //        "    , ISNULL(UserStageTypeLanguage.Name, ISNULL(DefaultStageTypeLanguage.Name, 'No name for this Field')) StageTypeName " +
        //        " 	 , ProcessFields.StringValue Title " +
        //        "FROM processes " +
        //        "JOIN ProcessFields " +
        //        "    ON Processes.ProcessID = ProcessFields.ProcessFieldID " +
        //        "JOIN processtypeStages " +
        //        "    ON Processes.ProcessTypeStageID = ProcessTypeStages.ProcessTypeStageID " +
        //        "       AND Processes.ProcessTypeID = ProcessTypeStages.ProcessTypeID " +
        //        "JOIN ProcessTypeStageTypes " +
        //        "    ON ProcessTypeStageTypes.ProcessTypeStageTypeID = ProcessTypeStages.ProcessTypeStageTypeID " +
        //        "LEFT JOIN(SELECT ProcessTypeStageTypeId, Name FROM ProcessTypeStageTypeLanguages WHERE LanguageId = @LanguageId) UserStageTypeLanguage " +
        //        "    ON UserStageTypeLanguage.ProcessTypeStageTypeID = ProcessTypeStageTypes.ProcessTypeStageTypeId " +
        //        "LEFT JOIN(SELECT ProcessTypeStageTypeId, Name FROM ProcessTypeStageTypeLanguages JOIN Settings ON ProcessTypeStageTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultStageTypeLanguage " +
        //        "   ON DefaultStageTypeLanguage.ProcessTypeStageTypeId = ProcessTypeStageTypes.ProcessTypeStageTypeId " +
        //        "JOIN ProcessTypeFields " +
        //        "    ON ProcessTypeFields.ProcessTypeFieldID = ProcessFields.ProcessTypeFieldID " +
        //        "LEFT JOIN(SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages WHERE LanguageId = @LanguageId) UserFieldLanguage " +
        //        "    ON UserFieldLanguage.ProcessTypeFieldID = ProcessTypeFields.ProcessTypeFieldId " +
        //        "LEFT JOIN(SELECT ProcessTypeFieldId, Name FROM ProcessTypeFieldLanguages JOIN Settings ON ProcessTypeFieldLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultFieldLanguage " +
        //        "   ON DefaultFieldLanguage.ProcessTypeFieldId = ProcessTypeFields.ProcessTypeFieldId " +
        //        "JOIN ProcessTypes " +
        //        "    ON PRocesses.ProcessTypeID = ProcessTypes.ProcessTypeID " +
        //        "JOIN ProcessTypeFlows ON ProcessTypes.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //        "LEFT JOIN(SELECT ProcessTypeId, Name FROM ProcessTypeLanguages WHERE LanguageId = @LanguageId) UserLanguage " +
        //        "    ON UserLanguage.ProcessTypeID = ProcessTypes.ProcessTypeId " +
        //        "LEFT JOIN(SELECT ProcessTypeId, Name FROM ProcessTypeLanguages JOIN Settings ON ProcessTypeLanguages.LanguageId = Settings.IntValue WHERE Settings.SettingId = 1) DefaultLanguage " +
        //        "   ON DefaultLanguage.ProcessTypeId = ProcessTypes.ProcessTypeId";
        //        List<int> TemplateIDs = await _processProvider.CreateGetInitialTemplateList();
        //        foreach (var TemplateId in TemplateIDs)
        //        {
        //            List<ProcessTypeFlowConditionOld> TemplateFlowConditions = await _processProvider.CreateGetFlowConditionList(TemplateId);

        //            if (TemplateFlowConditions.Count() > 0)
        //            { SQLWhere += " AND "; }
        //            foreach (var Condition in TemplateFlowConditions)
        //            {
        //                //Condition types
        //                //SELECT ProcessTypeFlowConditionTypes.ProcessTypeFlowConditionTypeId, Name FROM ProcessTypeFlowConditionTypes JOIN UITermLanguages ON ProcessTypeFlowConditionTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTypeFlowConditionTypes.ProcessTypeFlowConditionTypeID
        //                //Field types
        //                //SELECT 'case ' + cast(ProcessTypeFieldTypes.ProcessTypeFieldTypeId as char(2))+ ': //', Name FROM ProcessTypeFieldTypes JOIN UITermLanguages ON ProcessTypeFieldTypes.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTypeFieldTypes.ProcessTypeFieldTypeID

        //                switch (Condition.ProcessTypeFlowConditionTypeId)
        //                {
        //                    //Case 1 is Creator User which doesn't happen for a new process 
        //                    //Case 2 is Field which doesn't happen as it would check against default value which doesn't make sense.
        //                    case 3: //Security level user

        //                        //SELECT 'case ' + cast(ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorId as char(2))+ ': //', Name FROM ProcessTypeFlowConditionComparisonOperators JOIN UITermLanguages ON ProcessTypeFlowConditionComparisonOperators.NameTermId = UITermLanguages.UITermId WHERE LanguageId =41 ORDER BY ProcessTypeFlowConditionComparisonOperators.ProcessTypeFlowConditionComparisonOperatorID
        //                        SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 28 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue ";
        //                        switch (Condition.ComparisonOperatorId)
        //                        {
        //                            case 2:
        //                                SQLWhere += " = ";
        //                                break;
        //                            case 3:
        //                                SQLWhere += " > ";
        //                                break;
        //                            case 4:
        //                                SQLWhere += " >= ";
        //                                break;
        //                            case 5:
        //                                SQLWhere += " >= ";
        //                                break;
        //                            case 6:
        //                                SQLWhere += " <= ";
        //                                break;
        //                            case 7:
        //                                SQLWhere += " <> ";
        //                                break;

        //                        }
        //                        SQLWhere += CurrentUser.SecurityLevelId.ToString();
        //                        SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                            " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                                " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
        //                        break;
        //                    case 4: //User role
        //                        SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 30 AND Table" + Condition.ProcessTypeFlowId + "a.StringValue IN (SELECT RoleId FROM AspNetUserRoles WHERE UserId = '" + CurrentUser.Id + "') ";

        //                        SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                            " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                                " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";

        //                        break;
        //                    //  Manager user field there is no user yet stored in the process
        //                    case 6: //   Organization user
        //                        SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 14 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'OrganizationRight') ";

        //                        SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                            " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                                " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
        //                        break;
        //                    case 7: //	Organization role user
        //                        SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + "Field.ProcessTypeFieldTypeId = 14 " +

        //                            " Table" + Condition.ProcessTypeFlowId + "FieldRole.ProcessTypeFieldTypeId = 30 " +
        //                            " AND Table" + Condition.ProcessTypeFlowId + "UserRole.UserId = '" + CurrentUser.Id + "'  ";

        //                        //Link to field of project
        //                        SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                "Field ON Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                            " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageField " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "StageField.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeFieldId " +
        //                                " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageField.ProcessTypeStageId "

        //                                //Link to field of role
        //                                + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                "FieldRole ON Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                            " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "StageFieldRole.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeFieldId " +
        //                                    " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.ProcessTypeStageId " +
        //                            " JOIN aspnetuserroles Table" + Condition.ProcessTypeFlowId + "UserRole " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "UserROle.RoleId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.StringValue " +
        //                            " JOIN aspnetroleclaims Table" + Condition.ProcessTypeFlowId + "RoleClaim " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTypeFlowId + "UserRole.RoleId " +
        //                                " AND CAST(Table" + Condition.ProcessTypeFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTypeFlowId + "StageField.IntValue "
        //                                ;
        //                        break;
        //                    //	Organization parent user no parent
        //                    //	Organization parent role user
        //                    case 10: //	Project user
        //                        SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 16 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + CurrentUser.Id + "' AND AspNetRoleClaims.ClaimValue = 'ProjectRight') ";

        //                        SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                            " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                                " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
        //                        break;
        //                    case 11: //	Project role user
        //                        SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + "Field.ProcessTypeFieldTypeId = 16 " +

        //                            " Table" + Condition.ProcessTypeFlowId + "FieldRole.ProcessTypeFieldTypeId = 30 " +
        //                            " AND Table" + Condition.ProcessTypeFlowId + "UserRole.UserId = '" + CurrentUser.Id + "'  ";

        //                        //Link to field of project
        //                        SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                "Field ON Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                            " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageField " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "StageField.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "Field.ProcessTypeFieldId " +
        //                                " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageField.ProcessTypeStageId "

        //                                //Link to field of role
        //                                + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                "FieldRole ON Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                            " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "StageFieldRole.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + "FieldRole.ProcessTypeFieldId " +
        //                                    " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.ProcessTypeStageId " +
        //                            " JOIN aspnetuserroles Table" + Condition.ProcessTypeFlowId + "UserRole " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "UserROle.RoleId = Table" + Condition.ProcessTypeFlowId.ToString() + "StageFieldRole.StringValue " +
        //                            " JOIN aspnetroleclaims Table" + Condition.ProcessTypeFlowId + "RoleClaim " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "RoleClaim.RoleId = Table" + Condition.ProcessTypeFlowId + "UserRole.RoleId " +
        //                                " AND CAST(Table" + Condition.ProcessTypeFlowId + "RoleClaim.ClaimValue AS int) = Table" + Condition.ProcessTypeFlowId + "StageField.IntValue "
        //                                ;
        //                        break;
        //                    //	Project parent user
        //                    //	Project parent role user
        //                    case 14: //	Default organization user
        //                        SQLWhere = SQLWhere + " Table" + Condition.ProcessTypeFlowId + ".ProcessTypeFieldTypeId = 14 AND Table" + Condition.ProcessTypeFlowId + "a.IntValue IN ((SELECT persons.DefaultOrganizationId FROM persons WHERE persons.UserID'" + CurrentUser.Id + "' ) ";

        //                        SQLJOIN = SQLJOIN + " JOIN ProcessTypeFields AS Table" + Condition.ProcessTypeFlowId.ToString() +
        //                                " ON Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeId = ProcessTypeFlows.ProcessTypeId " +
        //                            " JOIN ProcessTypeStageFields AS Table" + Condition.ProcessTypeFlowId.ToString() + "a " +
        //                                " ON Table" + Condition.ProcessTypeFlowId + "a.ProcessTypeFieldId = Table" + Condition.ProcessTypeFlowId.ToString() + ".ProcessTypeFieldId " +
        //                                " AND ProcessTypeFlows.ProcessTypeFromStageId = Table" + Condition.ProcessTypeFlowId.ToString() + "a.ProcessTypeStageId ";
        //                        break;
        //                    case 15: //	Open bracket
        //                        SQLWhere += " ( ";
        //                        break;
        //                    case 16: //	and
        //                        SQLWhere += " AND ";
        //                        break;
        //                    case 17: //	or
        //                        SQLWhere += " OR ";
        //                        break;
        //                    case 18: //	Close bracket
        //                        SQLWhere += " ) ";
        //                        break;
        //                    //	User
        //                    //	Relation to creator
        //                    //	Relation to user field
        //                    case 22: //	Classification relation both value and classification itself
        //                        break;
        //                    case 23: //	Classification relation type
        //                        break;
        //                }
        //            }
        //        }

        //        List<ToDoIndexGet> NewTemplateList = await _processProvider.ToDoIndexGet(SQLJOIN + SQLWhere);

        //        return Ok(NewTemplateList);
        //    }
        //    return BadRequest(new
        //    {
        //        IsSuccess = false,
        //        Message = "No rights",
        //    });
        //}

        [HttpGet("NewProcessGet{ProcessTypeId}")]
        public async Task<IActionResult> NewProcessGet(int ProcessTypeId)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            var testifallowed = new FrontProcessNewProcessLogic(_userProvider, _processProvider, _frontProcessProvider);

                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  //11
            {
                List<NewProcessTypeList> x = await testifallowed.ReturnProcessTypeList(CurrentUser);

                if (x.Exists(x => x.ProcessTypeId == ProcessTypeId))
                    //TOFIX PETER
                    return Ok(await _processProvider.CreateGet(CurrentUser.Id, ProcessTypeId));// CurrentUser.LanguageId));
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
            var testifallowed = new FrontProcessNewProcessLogic(_userProvider, _processProvider, _frontProcessProvider);
            DataTable ProcessFields = NewProcessField.CreateTable();

                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  //11
            {
                List<NewProcessTypeList> x = await testifallowed.ReturnProcessTypeList(CurrentUser);
                if (x.Exists(x => x.ProcessTypeId == ProcessesFromAPI.ProcessTypeId))
                {

                    List<FrontProcessNewProcessField> ProcessesFromDB = await _processProvider.CreateGet(CurrentUser.Id, ProcessesFromAPI.ProcessTypeId);
                    int NoOfFields = ProcessesFromDB.Count();
                    int EqualSequenceCount = 0;
                    if (ProcessesFromDB.Exists(z => z.ProcessTypeStageId == ProcessesFromAPI.ProcessTypeStageId) & ProcessesFromDB.Count() == ProcessesFromAPI.ProcessFields.Count())
                    {
                        foreach (var ProcessFromDB in ProcessesFromDB)
                        {
                            foreach (var ProcessFieldFromAPI in ProcessesFromAPI.ProcessFields)
                            {

                                if (ProcessFieldFromAPI.Sequence == ProcessFromDB.Sequence & ProcessFieldFromAPI.ProcessTypeFieldId == ProcessFromDB.ProcessTypeFieldId)
                                {
                                    EqualSequenceCount++;
                                    switch (ProcessFromDB.ProcessTypeFieldTypeId)
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
                                    switch (ProcessFromDB.ProcessTypeFieldTypeId)
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
                                            if (ProcessFromDB.ProcessTypeStageFieldStatusId == 4 & ProcessFieldFromAPI.StringValue == null)
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
                                            if (ProcessFromDB.ProcessTypeStageFieldStatusId == 4 & ProcessFieldFromAPI.IntValue == null)
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
                                            if (ProcessFromDB.ProcessTypeStageFieldStatusId == 4 & ProcessFieldFromAPI.DateTimeValue == null)
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
                            ProcessFields.Rows.Add(ProcessFieldFromAPI.ProcessTypeId, ProcessFieldFromAPI.ProcessTypeFieldId, ProcessFieldFromAPI.StringValue, ProcessFieldFromAPI.IntValue, ProcessFieldFromAPI.DateTimeValue);
                        }

                        //   SqlParameter Parameters = cmd.Parameters.AddWithValue("@FieldsTable", ProcessFields);
                    //    System.Data.SqlClient.SqlParameter[] Parameters =  {
                    //    new System.Data.SqlClient.SqlParameter("@User", CurrentUser.Id)
                    //    , new System.Data.SqlClient.SqlParameter("@ProcessTypeID", ProcessesFromAPI.ProcessTypeId)
                    //    , new System.Data.SqlClient.SqlParameter("@ProcessTypeStageID", ProcessesFromAPI.ProcessTypeStageId)
                    //    , new System.Data.SqlClient.SqlParameter("@FieldsTable", ProcessFields)
                    //};
                        await _processProvider.CreatePost("usp_CreateProcess @User, @ProcessTypeId, @ProcessTypeStageId, @FieldsTable", CurrentUser.Id,  ProcessesFromAPI.ProcessTypeId, ProcessesFromAPI.ProcessTypeStageId, ProcessFields );
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

    }
}
