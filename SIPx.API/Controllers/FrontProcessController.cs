using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Classes;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]
    public class FrontProcessController : Controller
    {
        private readonly IUserProvider _userProvider;
        private readonly IProjectProvider _projectProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IFrontProcessProvider _frontProcessProvider;
        private readonly IProcessProvider _processProvider;
        private readonly UserManager<SipUser> _userManager;

        public FrontProcessController(IUserProvider userProvider, IProjectProvider projectProvider, IClaimCheck claimCheck, IFrontProcessProvider frontProcessProvider, IProcessProvider processProvider, Microsoft.AspNetCore.Identity.UserManager<SIPx.API.Models.SipUser> userManager)
        {
            _userProvider = userProvider;
            _projectProvider = projectProvider;
            _claimCheck = claimCheck;
            _frontProcessProvider = frontProcessProvider;
            _processProvider = processProvider;
            _userManager = userManager;
        }

        [HttpGet("Template")]
        public async Task<IActionResult> Template()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "1"))
            {
                var ListOfProcessTemplateGroups = await _frontProcessProvider.NewProcessShowTemplateGroup(CurrentUser.Id);
                var ListOfProcessTemplates = await _frontProcessProvider.NewProcessShowTemplate(CurrentUser.Id);
                foreach (var group in ListOfProcessTemplateGroups)
                {
                    var ProcessTemplates = ListOfProcessTemplates.FindAll(x => x.ProcessTemplateGroupId == group.ProcessTemplateGroupId);
                    group.templates = ProcessTemplates;
                }
                return Ok(ListOfProcessTemplateGroups);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("New/{Id:int}")]
        public async Task<IActionResult> New(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var testifallowed = new NewProcessCheckAllowed(_processProvider);

            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "5"))  //11
            {
                List<NewProcessTemplateList> x = await testifallowed.CheckProcessTemplateID(CurrentUser, Id);

                if (x.Exists(x => x.ProcessTemplateId == Id))
                {
                    //TOFIX PETER
                    var newprocess = await _processProvider.CreateGet(CurrentUser.Id, Id);
                    var newProcessWithMaster = new NewProcessWithMaster();
                    newProcessWithMaster.ProcessFields = newprocess;
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 16))
                    {
                        var projects = await _projectProvider.List(CurrentUser.Id);
                        newProcessWithMaster.Projects = projects;
                    }
                    if (newprocess.Exists(x => x.ProcessTemplateFieldTypeId == 12))
                    {
                        var Users = await _userProvider.List();
                        newProcessWithMaster.Users = Users;
                    }
                    return Ok(newProcessWithMaster);// CurrentUser.LanguageId));
                }
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });

        }

        [HttpGet("Update/{Id:int}")]
        public async Task<IActionResult> Edit(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            var UserId = CurrentUser.Id;
            var SecurityLevelId = CurrentUser.SecurityLevelId;
            string SQLWhere = " WHERE  Processes.ProcessId = " + Id ;
            string SQLJOIN = " DECLARE @LanguageId int;" +
                "SELECT @LanguageId = IntPreference FROM UserPreferences WHERE USerId = '" + UserId + "' AND UserPreferences.PreferenceTypeId = 1 ;" +


            "SELECT Processes.ProcessID " +
            "    , ISNULL(UserLanguage.Name, ISNULL(DefaultLanguage.Name, 'No name for this process')) ProcessTemplateName " +
            "    , ISNULL(UserFieldLanguage.Name, ISNULL(DefaultFieldLanguage.Name, 'No name for this Field')) ProcessTemplateFieldName " +
            "    , ISNULL(UserStageTypeLanguage.Name, ISNULL(DefaultStageTypeLanguage.Name, 'No name for this Field')) ProcessTemplateStageTypeName " +
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
                            SQLWhere += SecurityLevelId.ToString();
                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                            break;
                        case 4: //User role
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 30 AND Table" + Condition.ProcessTemplateFlowId + "a.StringValue IN (SELECT RoleId FROM AspNetUserRoles WHERE UserId = '" + UserId + "') ";

                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";

                            break;
                        //  Manager user field there is no user yet stored in the process
                        case 6: //   Organization user
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + UserId + "' AND AspNetRoleClaims.ClaimValue = 'OrganizationRight') ";

                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                            break;
                        case 7: //	Organization role user
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeId = 14 " +

                                " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeId = 30 " +
                                " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserId = '" + UserId + "'  ";

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
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 16 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT CAST(AspNetRoleClaims.ClaimValue as int) FROM AspNetUserRoles JOIN AspNetRoleClaims ON AspNetUserRoles.RoleId = AspNetRoleClaims.RoleId WHERE UserId = '" + UserId + "' AND AspNetRoleClaims.ClaimValue = 'ProjectRight') ";

                            SQLJOIN = SQLJOIN + " JOIN ProcessTemplateFields AS Table" + Condition.ProcessTemplateFlowId.ToString() +
                                    " ON Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateId = ProcessTemplateFlows.ProcessTemplateId " +
                                " JOIN ProcessTemplateStageFields AS Table" + Condition.ProcessTemplateFlowId.ToString() + "a " +
                                    " ON Table" + Condition.ProcessTemplateFlowId + "a.ProcessTemplateFieldId = Table" + Condition.ProcessTemplateFlowId.ToString() + ".ProcessTemplateFieldId " +
                                    " AND ProcessTemplateFlows.ProcessTemplateFromStageId = Table" + Condition.ProcessTemplateFlowId.ToString() + "a.ProcessTemplateStageId ";
                            break;
                        case 11: //	Project role user
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + "Field.ProcessTemplateFieldTypeId = 16 " +

                                " Table" + Condition.ProcessTemplateFlowId + "FieldRole.ProcessTemplateFieldTypeId = 30 " +
                                " AND Table" + Condition.ProcessTemplateFlowId + "UserRole.UserId = '" + UserId + "'  ";

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
                            SQLWhere = SQLWhere + " Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFieldTypeId = 14 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue IN ((SELECT persons.DefaultOrganizationId FROM persons WHERE persons.UserID'" + UserId + "' ) ";

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

            List<ToDoIndexGet> CheckIdIfRights = await _processProvider.ToDoIndexGet(SQLJOIN + SQLWhere);
            if (CheckIdIfRights.Count ==1)
            {
                var process = await _frontProcessProvider.FrontProcessEditGet(CurrentUser.Id, Id);
                return Ok(process);
                
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpPost("Update")]
        public async Task<IActionResult> Edit(FrontProcessEditGet Process)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "190"))
            {
                _frontProcessProvider.FrontProcessEditPost(Process, CurrentUser.Id);
                return Ok(Process);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }

        [HttpGet("ViewGet/{Id:int}")]
        public async Task<IActionResult> ViewGet(int Id)
        {
            var CurrentUser = await _userManager.GetUserAsync(User);
            if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", "2"))
            {
                //if (await _checkProvider.CheckIfRecordExists("ClassificationLevels", "ClassificationID", Id) == 0)
                //{
                //    return BadRequest(new
                //    {
                //        IsSuccess = false,
                //        Message = "No record with this ID",
                //    });
                //}

                var Process = await _frontProcessProvider.FrontProcessView(CurrentUser.Id, Id);
                Process.ProcessFields = await _frontProcessProvider.FrontProcessViewGetField(CurrentUser.Id, Id);
                return Ok(Process);
            }
            return BadRequest(new
            {
                IsSuccess = false,
                Message = "No rights",
            });
        }
    }
}