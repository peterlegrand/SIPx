using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFieldProvider
    {
        Task<string> CreatePost(ProcessTemplateFieldCreateGet ProcessTemplateField);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateFieldCreateGet ProcessTemplateField);
        Task<ProcessTemplateFieldDeleteGet> DeleteGet(string UserId, int ProcessTemplateFieldId);
        bool DeletePost(string UserId, int ProcessTemplateFieldId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTemplateFieldId);
        Task<List<ProcessTemplateFieldIndexGet>> IndexGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateFieldLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateFieldId);
        Task<ProcessTemplateFieldLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateFieldLanguageId);
        Task<List<ProcessTemplateFieldList>> List(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateFieldUpdateGet> UpdateGet(string UserId, int ProcessTemplateFieldId);
        Task<List<ProcessTemplateFieldList>> UpdateGetFieldList(string UserId, int ProcessTemplateStageFieldId);
        Task<List<ProcessTemplateFieldList>> UpdateGetSequence(string UserId, int ProcessTemplateFieldId);
        bool UpdatePost(ProcessTemplateFieldUpdateGet ProcessTemplateField);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateFieldUpdateGet ProcessTemplateField);
    }
}