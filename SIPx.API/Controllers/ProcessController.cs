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
        private readonly IUserProvider _userProvider;
        private readonly IFrontProcessProvider _frontProcessProvider;
        private readonly IClaimCheck _claimCheck;
        private readonly IProcessProvider _processProvider;
        private readonly Microsoft.AspNetCore.Identity.UserManager<SipUser> _userManager;
        private readonly ICheckProvider _checkProvider;

        public ProcessController(IUserProvider userProvider, IFrontProcessProvider frontProcessProvider, IClaimCheck claimCheck, IProcessProvider ProcessProvider, Microsoft.AspNetCore.Identity.UserManager<SipUser> userManager, ICheckProvider checkProvider)
        {
            _userProvider = userProvider;
            _frontProcessProvider = frontProcessProvider;
            _claimCheck = claimCheck;
            _processProvider = ProcessProvider;
            _userManager = userManager;
            _checkProvider = checkProvider;
        }
        

        [HttpGet("NewProcessGet{ProcessTemplateId}")]
        public async Task<IActionResult> NewProcessGet(int ProcessTemplateId)
        {

            var CurrentUser = await _userManager.GetUserAsync(User);
            var testifallowed = new FrontProcessNewProcessLogic(_userProvider, _processProvider, _frontProcessProvider);

                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  //11
            {
                List<NewProcessTemplateList> x = await testifallowed.ReturnProcessTemplateList(CurrentUser);

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
            var testifallowed = new FrontProcessNewProcessLogic(_userProvider, _processProvider, _frontProcessProvider);
            DataTable ProcessFields = NewProcessField.CreateTable();

                        if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))  //11
            {
                List<NewProcessTemplateList> x = await testifallowed.ReturnProcessTemplateList(CurrentUser);
                if (x.Exists(x => x.ProcessTemplateId == ProcessesFromAPI.ProcessTemplateId))
                {

                    List<FrontProcessNewProcessField> ProcessesFromDB = await _processProvider.CreateGet(CurrentUser.Id, ProcessesFromAPI.ProcessTemplateId);
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
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
                       if (await _claimCheck.CheckClaim(CurrentUser, "ApplicationRight", this.ControllerContext.RouteData.Values["controller"].ToString() + "\\" + this.ControllerContext.RouteData.Values["action"].ToString()))
            {
                Process.UserId= CurrentUser.Id;
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
