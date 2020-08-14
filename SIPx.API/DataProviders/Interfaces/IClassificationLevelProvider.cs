using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationLevelProvider
    {
        Task<List<ClassificationCreateGetSequence>> ClassificationCreateGetSequence(string UserId);
        Task<List<ClassificationIndexGet>> ClassificationIndexGet(string UserId);
        Task<List<SequenceList>> ClassificationLevelCreateGetSequence(string UserId, int ClassificationId);
        bool ClassificationLevelCreatePost(ClassificationLevelCreatePost ClassificationLevel);
        Task<string> ClassificationLevelCreatePostCheck(ClassificationLevelCreatePost ClassificationLevel);
        Task<List<ClassificationLevelIndexGet>> ClassificationLevelIndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationLevelLanguageIndexGet>> ClassificationLevelLanguageIndexGet(string UserId, int ClassificationLevelId);
        Task<ClassificationLevelLanguageIndexGet> ClassificationLevelLanguageUpdateGet(string UserId, int ClassificationLevelLanguageId);
        Task<ClassificationLevelUpdateGet> ClassificationLevelUpdateGet(string UserId, int ClassificationLevelId);
    }
}