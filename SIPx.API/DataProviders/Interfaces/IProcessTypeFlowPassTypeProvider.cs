using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeFlowPassTypeProvider
    {
        Task<List<ProcessTypeFlowPassTypeList>> List(string UserId);
    }
}