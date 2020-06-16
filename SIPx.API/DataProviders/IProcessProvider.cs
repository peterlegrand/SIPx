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
//        Task<List<ProcessType>> GetProcessTypes(string UserID);
        Task<List<int>> NewProcessGetInitialTemplateList();
        Task<List<ProcessTemplateFlowCondition>> NewProcessGetFlowConditionList(int FlowID);
        Task<List<NewProcessTemplateList>> NewProcessGetTemplateList(string SQLString);
        Task<List<NewProcessFromDB>> NewProcessGet(SipUser User, int ProcessTemplateID);
        //        Task<bool> NewProcessInsert(string SQLString, System.Data.SqlClient.SqlParameter[] Parameters);
        Task<bool> NewProcessInsert(string SQLString, string UserID, int TemplateID, int StageID, DataTable Fields);
    }
}
