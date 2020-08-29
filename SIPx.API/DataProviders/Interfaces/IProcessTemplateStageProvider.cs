using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateStageProvider
    {
        Task<string> CreatePost(ProcessTemplateStageCreatePost ProcessTemplateStage);
        Task<string> CreatePostCheck(ProcessTemplateStageCreatePost ProcessTemplateStage);
        Task<ProcessTemplateStageDeleteGet> DeleteGet(string UserId, int ProcessTemplateStageId);
        bool DeletePost(int Id);
        Task<List<ProcessTemplateStageIndexGet>> IndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateStageLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateStageId);
        Task<ProcessTemplateStageLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateStageLanguageId);
        Task<List<ProcessTemplateStageList>> List(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateStageUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageId);
        bool UpdatePost(ProcessTemplateStageUpdateGet ProcessTemplate);
    }
}