using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFieldProvider
    {
        Task<string> CreatePost(ProcessTemplateFieldCreatePost ProcessTemplateField);
        Task<string> CreatePostCheck(ProcessTemplateFieldCreatePost ProcessTemplateField);
        Task<ProcessTemplateFieldDeleteGet> DeleteGet(string UserId, int ProcessTemplateFieldId);
        bool DeletePost(int Id);
        Task<List<ProcessTemplateFieldIndexGet>> IndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateFieldLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateFieldId);
        Task<ProcessTemplateFieldLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateFieldLanguageId);
        Task<List<ProcessTemplateFieldList>> List(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateFieldUpdateGet> UpdateGet(string UserId, int ProcessTemplateFieldId);
        Task<List<ProcessTemplateFieldList>> UpdateGetFieldList(string UserId, int ProcessTemplateStageFieldId);
        Task<List<ProcessTemplateFieldList>> UpdateGetSequence(string UserId, int ProcessTemplateFieldId);
        bool UpdatePost(ProcessTemplateFieldUpdateGet ProcessTemplateField);
    }
}