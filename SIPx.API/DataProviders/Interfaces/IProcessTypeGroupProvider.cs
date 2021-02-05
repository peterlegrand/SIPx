using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeGroupProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<string> CreatePost(ProcessTypeGroupCreateGet ProcessTypeGroup);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeGroupCreateGet ProcessTypeGroup);
        Task<ProcessTypeGroupDeleteGet> DeleteGet(string UserId, int ProcessTypeGroupId);
        bool DeletePost(string UserId, int ProcessTypeGroupId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeGroupId);
        Task<List<ProcessTypeGroupIndexGet>> IndexGet(string UserId);
        Task<List<ProcessTypeGroupLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeGroupId);
        Task<ProcessTypeGroupLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeGroupLanguageId);
        Task<List<ProcessTypeGroupList>> List(string UserId);
        Task<ProcessTypeGroupUpdateGet> UpdateGet(string UserId, int ProcessTypeGroupId);
        Task<List<SequenceList>> UpdateGetSequence(string UserId);
        bool UpdatePost(ProcessTypeGroupUpdateGet ProcessTypeGroup);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeGroupUpdateGet ProcessTypeGroup);
    }
}