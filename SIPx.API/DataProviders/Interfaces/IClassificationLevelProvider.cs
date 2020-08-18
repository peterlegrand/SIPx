using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationLevelProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId, int ClassificationId);
        bool CreatePost(ClassificationLevelCreatePost ClassificationLevel);
        Task<string> CreatePostCheck(ClassificationLevelCreatePost ClassificationLevel);
        Task<List<ClassificationLevelIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationLevelLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationLevelId);
        Task<ClassificationLevelLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationLevelLanguageId);
        Task<ClassificationLevelUpdateGet> UpdateGet(string UserId, int ClassificationLevelId);
        bool UpdatePost(ClassificationLevelUpdateGet ClassificationLevel);
    }
}