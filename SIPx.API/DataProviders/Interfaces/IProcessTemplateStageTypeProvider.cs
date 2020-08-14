using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateStageTypeProvider
    {
        Task<string> ProcessTemplateStageTypeCreatePost(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType);
        Task<string> ProcessTemplateStageTypeCreatePostCheck(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType);
        Task<List<ProcessTemplateStageType>> ProcessTemplateStageTypeIndexGet(string UserId);
        Task<List<ProcessTemplateStageTypeLanguage>> ProcessTemplateStageTypeLanguageIndexGet(string UserId, int ProcessTemplateStageTypeId);
        Task<ProcessTemplateStageTypeLanguage> ProcessTemplateStageTypeLanguageUpdateGet(string UserId, int ProcessTemplateStageTypeLanguageId);
        Task<List<ProcessTemplateStageTypeList>> ProcessTemplateStageTypeList(string UserId);
        Task<ProcessTemplateStageType> ProcessTemplateStageTypeUpdateGet(string UserId, int ProcessTemplateStageTypeId);
    }
}