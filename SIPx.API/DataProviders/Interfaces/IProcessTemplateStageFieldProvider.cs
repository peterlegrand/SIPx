using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateStageFieldProvider
    {
        Task<List<ProcessTemplateStageFieldIndexGetFields>> IndexGet(string UserId, int ProcessTemplateFieldId);
        Task<ProcessTemplateStageFieldUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageFieldID);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateStageFieldUpdateGet ProcessTemplateStageField);
        bool UpdatePost(ProcessTemplateStageFieldUpdateGet ProcessTemplateStageField);
        Task<List<SequenceList>> Sequence(string UserId, int ProcessTemplateId, int ProcessTemplateStageId);
    }
}