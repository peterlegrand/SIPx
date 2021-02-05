using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeFieldProvider
    {
        Task<string> CreatePost(ProcessTypeFieldCreateGet ProcessTypeField);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeFieldCreateGet ProcessTypeField);
        Task<ProcessTypeFieldDeleteGet> DeleteGet(string UserId, int ProcessTypeFieldId);
        bool DeletePost(string UserId, int ProcessTypeFieldId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeFieldId);
        Task<List<ProcessTypeFieldIndexGet>> IndexGet(string UserId, int ProcessTypeId);
        Task<List<ProcessTypeFieldLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeFieldId);
        Task<ProcessTypeFieldLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeFieldLanguageId);
        Task<List<ProcessTypeFieldList>> List(string UserId, int ProcessTypeId);
        Task<ProcessTypeFieldUpdateGet> UpdateGet(string UserId, int ProcessTypeFieldId);
        Task<List<ProcessTypeFieldList>> UpdateGetFieldList(string UserId, int ProcessTypeStageFieldId);
        Task<List<ProcessTypeFieldList>> UpdateGetSequence(string UserId, int ProcessTypeFieldId);
        bool UpdatePost(ProcessTypeFieldUpdateGet ProcessTypeField);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeFieldUpdateGet ProcessTypeField);
    }
}