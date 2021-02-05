using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeFlowPassComparisonOperatorProvider
    {
        Task<List<ProcessTypeFlowPassComparisonOperatorList>> List(string UserId);
    }
}