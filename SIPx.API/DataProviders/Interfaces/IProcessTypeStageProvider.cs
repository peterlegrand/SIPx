using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeStageProvider
    {
        Task<string> CreatePost(ProcessTypeStageCreateGet ProcessTypeStage);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeStageCreateGet ProcessTypeStage);
        Task<ProcessTypeStageDeleteGet> DeleteGet(string UserId, int ProcessTypeStageId);
        bool DeletePost(string UserId, int ProcessTypeStageId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeStageId);
        Task<List<ProcessTypeStageIndexGet>> IndexGet(string UserId, int ProcessTypeId);
        Task<List<ProcessTypeStageLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeStageId);
        Task<ProcessTypeStageLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeStageLanguageId);
        Task<List<ProcessTypeStageList>> List(string UserId, int ProcessTypeId);
        Task<ProcessTypeStageUpdateGet> UpdateGet(string UserId, int ProcessTypeStageId);
        bool UpdatePost(ProcessTypeStageUpdateGet ProcessType);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeStageUpdateGet ProcessTypeStage);
    }
}