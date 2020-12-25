using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<string> CreatePost(ProcessTemplateCreateGet ProcessTemplate);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateCreateGet ProcessTemplate);
        Task<ProcessTemplateDeleteGet> DeleteGet(string UserId, int ProcessTemplateId);
        bool DeletePost(string UserId, int ProcessTemplateId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateIndexGet>> IndexGet(string UserId);
        Task<List<ProcessTemplateLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateLanguageId);
        Task<List<ProcessTemplateList>> List(string UserId);
        Task<ProcessTemplateUpdateGet> UpdateGet(string UserId, int ProcessTemplateId);
        bool UpdatePost(ProcessTemplateUpdateGet ProcessTemplate);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateUpdateGet ProcessTemplate);
    }
}