using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateStageFieldStatusProvider
    {
        //Task<List<ProcessTemplateStageFieldStatus>> IndexGet(string UserId);
        Task<List<ProcessTemplateStageFieldStatusList>> List(string UserId);
    }
}