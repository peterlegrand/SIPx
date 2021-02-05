using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeFieldStageProvider
    {
        Task<List<ProcessTypeFieldStageIndexGetStages>> IndexGet(string UserId, int ProcessTypeFieldId);
        Task<ProcessTypeFieldStageUpdateGet> UpdateGet(string UserId, int ProcessTypeStageFieldID);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeFieldStageUpdateGet ProcessTypeFieldStage);
        bool UpdatePost(ProcessTypeFieldStageUpdateGet ProcessTypeFieldStage);
    }
}