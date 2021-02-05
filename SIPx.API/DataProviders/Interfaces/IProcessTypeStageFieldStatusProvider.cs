using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeStageFieldStatusProvider
    {
        //Task<List<ProcessTypeStageFieldStatus>> IndexGet(string UserId);
        Task<List<ProcessTypeStageFieldStatusList>> List(string UserId);
    }
}