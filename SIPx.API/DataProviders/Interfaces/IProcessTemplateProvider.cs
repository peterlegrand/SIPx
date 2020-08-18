using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<string> CreatePost(ProcessTemplateCreatePost ProcessTemplate);
        Task<string> CreatePostCheck(ProcessTemplateCreatePost ProcessTemplate);
        Task<List<ProcessTemplateIndexGet>> IndexGet(string UserId);
        Task<List<ProcessTemplateLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateId);
        Task<ProcessTemplateLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateLanguageId);
        Task<ProcessTemplateUpdateGet> UpdateGet(string UserId, int ProcessTemplateId);
    }
}