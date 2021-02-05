using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeStageTypeProvider
    {
        Task<string> CreatePost(ProcessTypeStageTypeCreateGet ProcessTypeStageType);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeStageTypeCreateGet ProcessTypeStageType);
        Task<ProcessTypeStageTypeDeleteGet> DeleteGet(string UserId, int ProcessTypeStageTypeId);
        bool DeletePost(string UserId, int ProcessTypeStageTypeId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeStageTypeId);
        Task<List<ProcessTypeStageTypeIndexGet>> IndexGet(string UserId);
        Task<List<ProcessTypeStageTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeStageTypeId);
        Task<ProcessTypeStageTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProcessTypeStageTypeLanguageId);
        Task<List<ProcessTypeStageTypeList>> List(string UserId);
        Task<ProcessTypeStageTypeUpdateGet> UpdateGet(string UserId, int ProcessTypeStageTypeId);
        bool UpdatePost(ProcessTypeStageTypeUpdateGet ProcessTypeStageType);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeStageTypeUpdateGet ProcessTypeStageType);
    }
}