using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFlowConditionTypeProvider
    {
        Task<List<ProcessTemplateFlowConditionTypeList>> List(string UserId);
    }
}