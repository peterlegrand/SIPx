using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateStageTypeProvider
    {
        Task<string> CreatePost(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType);
        Task<string> CreatePostCheck(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType);
        Task<List<ProcessTemplateStageType>> IndexGet(string UserId);
        Task<List<ProcessTemplateStageTypeLanguage>> LanguageIndexGet(string UserId, int ProcessTemplateStageTypeId);
        Task<ProcessTemplateStageTypeLanguage> LanguageUpdateGet(string UserId, int ProcessTemplateStageTypeLanguageId);
        Task<List<ProcessTemplateStageTypeList>> List(string UserId);
        Task<ProcessTemplateStageType> UpdateGet(string UserId, int ProcessTemplateStageTypeId);
    }
}