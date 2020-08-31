using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateStageTypeProvider
    {
        Task<string> CreatePost(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType);
        Task<string> CreatePostCheck(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType);
        Task<ProcessTemplateStageTypeDeleteGet> DeleteGet(string UserId, int ProcessTemplateStageTypeId);
        bool DeletePost(int Id);
        Task<List<ProcessTemplateStageTypeIndexGet>> IndexGet(string UserId);
        Task<List<ProcessTemplateStageTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateStageTypeId);
        Task<ProcessTemplateStageTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProcessTemplateStageTypeLanguageId);
        Task<List<ProcessTemplateStageTypeList>> List(string UserId);
        Task<ProcessTemplateStageTypeUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageTypeId);
        bool UpdatePost(ProcessTemplateStageTypeUpdateGet ProcessTemplateStageType);
    }
}