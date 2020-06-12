using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis;
using SIPx.API.Models;
using SIPx.DataAccess;
using SIPx.Shared;

namespace SIPx.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProcessController : ControllerBase
    {
        private IClaimCheck _claimCheck;
        private readonly IProcessProvider _processProvider;
        private readonly Microsoft.AspNetCore.Identity.UserManager<SipUser> _userManager;

        public ProcessController(IClaimCheck claimCheck, IProcessProvider ProcessProvider, Microsoft.AspNetCore.Identity.UserManager<SipUser> userManager)
        {
            _claimCheck = claimCheck;
            _processProvider = ProcessProvider;
            _userManager = userManager;
        }

        [HttpGet("NewProcess")]

        public async Task<IActionResult> Get()
        {
            var CurrentUser = await _userManager.GetUserAsync(User);

            List<int> TemplateIDs = await _processProvider.NewProcessGetInitialTemplateList();
            foreach (var TemplateID in TemplateIDs)
            {
                List<ProcessTemplateFlowCondition> TemplateFlowConditions = await _processProvider.NewProcessGetFlowConditionList(TemplateID);
                string SQLWhere = "";
                string SQLJOIN = "";
                foreach(var Condition in TemplateFlowConditions)
                {
                    switch (Condition.ProcessTemplateFlowConditionTypeID)
                    {
                        //Case 1 is Creator User which doesn't happen for a new process 
                        //Case 2 is Field which doesn't happen as it would check against default value which doesn't make sense.
                        case 3: //Security level user

                            SQLWhere = SQLWhere + " AND Table" + Condition.ProcessTemplateFlowId + ".ProcessTemplateFlowConditionTypeID = 28 AND Table" + Condition.ProcessTemplateFlowId + "a.IntValue ";
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
                    }
                }
            }
            return Ok();
        }
    }
}
