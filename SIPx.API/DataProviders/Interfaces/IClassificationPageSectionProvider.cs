using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationPageSectionProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId, int ClassificationPageId);
        bool CreatePost(ClassificationPageSectionCreatePost ClassificationPageSection);
        Task<string> CreatePostCheck(ClassificationPageSectionCreatePost ClassificationPageSection);
        Task<List<ClassificationPageSectionIndexGet>> IndexGet(string UserId, int ClassificationPageId);
        Task<List<ClassificationPageSectionLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationPageSectionId);
        Task<ClassificationPageSectionLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationPageSectionLanguageId);
        Task<List<ClassificationPageSectionSequenceList>> SequenceListBySectionIdGet(string UserId, int ClassificationPageSectionId);
        Task<ClassificationPageSectionUpdateGet> UpdateGet(string UserId, int ClassificationPageSectionId);
    }
}