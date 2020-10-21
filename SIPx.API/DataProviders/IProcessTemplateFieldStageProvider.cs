using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFieldStageProvider
    {
        Task<List<ProcessTemplateFieldStageIndexGetStages>> IndexGet(string UserId, int ProcessTemplateFieldId);
        Task<ProcessTemplateFieldStageUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageFieldID);
        bool UpdatePost(ProcessTemplateFieldStageUpdateGet ProcessTemplateFieldStage);
    }
}