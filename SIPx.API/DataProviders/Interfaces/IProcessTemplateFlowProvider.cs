using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFlowProvider
    {
        Task<string> CreatePost(ProcessTemplateFlowCreatePost ProcessTemplateFlow);
        Task<string> CreatePostCheck(ProcessTemplateFlowCreatePost ProcessTemplateFlow);
        Task<ProcessTemplateFlowDeleteGet> DeleteGet(string UserId, int ProcessTemplateFlowId);
        bool DeletePost(int Id);
        Task<List<ProcessTemplateFlowIndexGet>> IndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateFlowLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateFlowId);
        Task<ProcessTemplateFlowLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateFlowLanguageId);
        Task<ProcessTemplateFlowUpdateGet> UpdateGet(string UserId, int ProcessTemplateFlowId);
        Task<List<ProcessTemplateStageList>> UpdateGetStageList(string UserId, int ProcessTemplateFlowId);
        bool UpdatePost(ProcessTemplateFlowUpdateGet ProcessTemplateFlow);
    }
}