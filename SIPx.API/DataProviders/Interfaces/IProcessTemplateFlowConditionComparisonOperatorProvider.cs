using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFlowConditionComparisonOperatorProvider
    {
        Task<List<ProcessTemplateFlowConditionComparisonOperatorList>> List(string UserId);
    }
}