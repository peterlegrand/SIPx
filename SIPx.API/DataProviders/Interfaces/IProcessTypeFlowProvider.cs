using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeFlowProvider
    {
        Task<string> CreatePost(ProcessTypeFlowCreateGet ProcessTypeFlow);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeFlowCreateGet ProcessTypeFlow);
        Task<ProcessTypeFlowDeleteGet> DeleteGet(string UserId, int ProcessTypeFlowId);
        bool DeletePost(string UserId, int ProcessTypeFlowId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeFlowId);
        Task<List<ProcessTypeFlowIndexGet>> IndexGet(string UserId, int ProcessTypeId);
        Task<List<ProcessTypeFlowLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeFlowId);
        Task<ProcessTypeFlowLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeFlowLanguageId);
        Task<ProcessTypeFlowUpdateGet> UpdateGet(string UserId, int ProcessTypeFlowId);
        Task<List<ProcessTypeStageList>> UpdateGetStageList(string UserId, int ProcessTypeFlowId);
        bool UpdatePost(ProcessTypeFlowUpdateGet ProcessTypeFlow);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeFlowUpdateGet ProcessTypeFlow);
    }
}