using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateStageFieldProvider
    {
        Task<List<ProcessTemplateStageFieldIndexGet>> IndexGet(string UserId, int ProcessTemplateFieldId);
        Task<ProcessTemplateStageFieldUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageFieldID);
        bool UpdatePost(ProcessTemplateStageFieldUpdateGet ProcessTemplateStageField);
    }
}