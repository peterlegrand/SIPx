using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFlowPassTypeProvider
    {
        Task<List<ProcessTemplateFlowPassTypeList>> List(string UserId);
    }
}