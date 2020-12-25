using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationLevelProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId, int ClassificationId);
        bool CreatePost(ClassificationLevelCreateGet ClassificationLevel);
        Task<List<ErrorMessage>> CreatePostCheck(ClassificationLevelCreateGet ClassificationLevel);
        Task<ClassificationLevelDeleteGet> DeleteGet(string UserId, int ClassificationLevelId);
        bool DeletePost(string UserId, int ClassificationLevelId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationLevelId);
        Task<List<ClassificationLevelIndexGet>> IndexGet(string UserId, int ClassificationId);
        Task<List<ClassificationLevelLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationLevelId);
        Task<ClassificationLevelLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationLevelLanguageId);
        Task<ClassificationLevelUpdateGet> UpdateGet(string UserId, int ClassificationLevelId);
        bool UpdatePost(ClassificationLevelUpdateGet ClassificationLevel);
        Task<List<ErrorMessage>> UpdatePostCheck(ClassificationLevelUpdateGet ClassificationLevel);
    }
}