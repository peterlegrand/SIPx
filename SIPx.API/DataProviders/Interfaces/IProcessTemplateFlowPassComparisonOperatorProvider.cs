using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFlowPassComparisonOperatorProvider
    {
        Task<List<ProcessTemplateFlowPassComparisonOperatorList>> List(string UserId);
    }
}