using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateStageProvider
    {
        Task<string> CreatePost(ProcessTemplateStageCreateGet ProcessTemplateStage);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateStageCreateGet ProcessTemplateStage);
        Task<ProcessTemplateStageDeleteGet> DeleteGet(string UserId, int ProcessTemplateStageId);
        bool DeletePost(string UserId, int ProcessTemplateStageId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTemplateStageId);
        Task<List<ProcessTemplateStageIndexGet>> IndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateStageLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateStageId);
        Task<ProcessTemplateStageLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateStageLanguageId);
        Task<List<ProcessTemplateStageList>> List(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateStageUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageId);
        bool UpdatePost(ProcessTemplateStageUpdateGet ProcessTemplate);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateStageUpdateGet ProcessTemplateStage);
    }
}