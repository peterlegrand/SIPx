using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Microsoft.AspNet.Identity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using Microsoft.Data.SqlClient;
using SIPx.API.Classes;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;
using SIPx.Shared.Process;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProcessController : ControllerBase
    {
        private IClaimCheck _claimCheck;
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

                if (x.Exists(x => x.ProcessTemplateID == ProcessTemplateId))
                    //TOFIX PETER
                    return Ok(await _processProvider.NewProcessGet(CurrentUser, ProcessTemplateId));// CurrentUser.LanguageID));
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
                List<NewProcessTemplateList> x = await testifallowed.CheckProcessTemplateID(CurrentUser, ProcessesFromAPI.ProcessTemplateID);
                if (x.Exists(x => x.ProcessTemplateID == ProcessesFromAPI.ProcessTemplateID))
                {

                    List<NewProcessFromDB> ProcessesFromDB = await _processProvider.NewProcessGet(CurrentUser, ProcessesFromAPI.ProcessTemplateID);
                    int NoOfFields = ProcessesFromDB.Count();
                    int EqualSequenceCount = 0;
                    if (ProcessesFromDB.Exists(z => z.ProcessTemplateStageID == ProcessesFromAPI.ProcessTemplateStageID) & ProcessesFromDB.Count() == ProcessesFromAPI.ProcessFields.Count())
                    {
                        foreach (var ProcessFromDB in ProcessesFromDB)
                        {
                            foreach (var ProcessFieldFromAPI in ProcessesFromAPI.ProcessFields)
                            {

                                if (ProcessFieldFromAPI.Sequence == ProcessFromDB.Sequence & ProcessFieldFromAPI.ProcessTemplateFieldID == ProcessFromDB.ProcessTemplateFieldID)
                                {
                                    EqualSequenceCount++;
                                    switch (ProcessFromDB.ProcessTemplateFieldTypeID)
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
                                    switch (ProcessFromDB.ProcessTemplateFieldTypeID)
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
                                            if (ProcessFromDB.ProcessTemplateStageFieldStatusID == 4 & ProcessFieldFromAPI.StringValue == null)
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
                                            if (ProcessFromDB.ProcessTemplateStageFieldStatusID == 4 & ProcessFieldFromAPI.IntValue == null)
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
                                            if (ProcessFromDB.ProcessTemplateStageFieldStatusID == 4 & ProcessFieldFromAPI.DateTimeValue == null)
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
                            ProcessFields.Rows.Add(ProcessFieldFromAPI.ProcessTemplateID, ProcessFieldFromAPI.ProcessTemplateFieldID, ProcessFieldFromAPI.StringValue, ProcessFieldFromAPI.IntValue, ProcessFieldFromAPI.DateTimeValue);
                        }

                        //   SqlParameter Parameters = cmd.Parameters.AddWithValue("@FieldsTable", ProcessFields);
                    //    System.Data.SqlClient.SqlParameter[] Parameters =  {
                    //    new System.Data.SqlClient.SqlParameter("@User", CurrentUser.Id)
                    //    , new System.Data.SqlClient.SqlParameter("@ProcessTemplateID", ProcessesFromAPI.ProcessTemplateID)
                    //    , new System.Data.SqlClient.SqlParameter("@ProcessTemplateStageID", ProcessesFromAPI.ProcessTemplateStageID)
                    //    , new System.Data.SqlClient.SqlParameter("@FieldsTable", ProcessFields)
                    //};
                        await _processProvider.NewProcessInsert("usp_CreateProcess @User, @ProcessTemplateID, @ProcessTemplateStageID, @FieldsTable", CurrentUser.Id,  ProcessesFromAPI.ProcessTemplateID, ProcessesFromAPI.ProcessTemplateStageID, ProcessFields );
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
