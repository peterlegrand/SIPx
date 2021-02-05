using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<string> CreatePost(ProcessTypeCreateGet ProcessType);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeCreateGet ProcessType);
        Task<ProcessTypeDeleteGet> DeleteGet(string UserId, int ProcessTypeId);
        bool DeletePost(string UserId, int ProcessTypeId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeId);
        Task<List<ProcessTypeIndexGet>> IndexGet(string UserId);
        Task<List<ProcessTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeId);
        Task<ProcessTypeLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeLanguageId);
        Task<List<ProcessTypeList>> List(string UserId);
        Task<ProcessTypeUpdateGet> UpdateGet(string UserId, int ProcessTypeId);
        bool UpdatePost(ProcessTypeUpdateGet ProcessType);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeUpdateGet ProcessType);
    }
}