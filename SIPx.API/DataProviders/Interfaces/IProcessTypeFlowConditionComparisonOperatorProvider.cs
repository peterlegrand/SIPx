using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeFlowConditionComparisonOperatorProvider
    {
        Task<List<ProcessTypeFlowConditionComparisonOperatorList>> List(string UserId);
    }
}