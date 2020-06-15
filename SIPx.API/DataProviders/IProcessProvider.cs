using SIPx.API.Models;
using SIPx.Shared;
using System.Collections.Generic;
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
    }
}
