using Microsoft.Data.SqlClient;
using SIPx.API.Models;
using SIPx.Shared;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessProvider
    {
//        Task<List<ProcessType>> GetProcessTypes(string UserId);
        Task<List<int>> NewProcessGetInitialTemplateList();
        Task<List<ProcessTemplateFlowConditionOld>> NewProcessGetFlowConditionList(int FlowId);
        Task<List<NewProcessTemplateList>> NewProcessGetTemplateList(string SQLString);
        Task<List<NewProcessFromDB>> NewProcessGet(SipUser User, int ProcessTemplateId);
        //        Task<bool> NewProcessInsert(string SQLString, System.Data.SqlClient.SqlParameter[] Parameters);
        Task<bool> NewProcessInsert(string SQLString, string UserId, int TemplateId, int StageId, DataTable Fields);
    }
}
