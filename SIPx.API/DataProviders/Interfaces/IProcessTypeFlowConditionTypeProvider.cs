using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeFlowConditionTypeProvider
    {
        Task<List<ProcessTypeFlowConditionTypeList>> List(string UserId);
    }
}