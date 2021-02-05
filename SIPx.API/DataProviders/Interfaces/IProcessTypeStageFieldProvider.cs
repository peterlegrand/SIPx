using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeStageFieldProvider
    {
        Task<List<ProcessTypeStageFieldIndexGetFields>> IndexGet(string UserId, int ProcessTypeFieldId);
        Task<ProcessTypeStageFieldUpdateGet> UpdateGet(string UserId, int ProcessTypeStageFieldID);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeStageFieldUpdateGet ProcessTypeStageField);
        bool UpdatePost(ProcessTypeStageFieldUpdateGet ProcessTypeStageField);
        Task<List<SequenceList>> Sequence(string UserId, int ProcessTypeStageId);
    }
}