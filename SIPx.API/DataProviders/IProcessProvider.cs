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
    }
}