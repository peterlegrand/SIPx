using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateGroupProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<string> CreatePost(ProcessTemplateGroupCreatePost ProcessTemplateGroup);
        Task<string> CreatePostCheck(ProcessTemplateGroupCreatePost ProcessTemplateGroup);
        Task<ProcessTemplateGroupDeleteGet> DeleteGet(string UserId, int ProcessTemplateGroupId);
        bool DeletePost(int Id);
        Task<List<ProcessTemplateGroupIndexGet>> IndexGet(string UserId);
        Task<List<ProcessTemplateGroupLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateGroupId);
        Task<ProcessTemplateGroupLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateGroupLanguageId);
        Task<List<ProcessTemplateGroupList>> List(string UserId);
        Task<ProcessTemplateGroupUpdateGet> UpdateGet(string UserId, int ProcessTemplateGroupId);
    }
}