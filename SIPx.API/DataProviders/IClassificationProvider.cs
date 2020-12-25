using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationProvider
    {
        Task<List<ContentAdvancedSearchPostClassification>> ClassificationsWithValues(string UserId);
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        bool CreatePost(ClassificationCreateGet Classification);
        Task<List<ErrorMessage>> CreatePostCheck(ClassificationCreateGet Classification);
        Task<ClassificationDeleteGet> DeleteGet(string UserId, int ClassificationId);
        bool DeletePost(string UserId, int ClassificationId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationId);
        Task<List<ClassificationIndexGet>> IndexGet(string UserId);
        Task<List<ClassificationLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationId);
        Task<ClassificationLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationLanguageId);
        Task<List<LanguageList>> LangugageCreateGetLanguageList(string UserId, int ClassificationId);
        Task<List<ClassificationList>> List(string UserId);
        Task<ClassificationUpdateGet> UpdateGet(string UserId, int ClassificationId);
        bool UpdatePost(ClassificationUpdateGet Classification);
        Task<List<ErrorMessage>> UpdatePostCheck(ClassificationUpdateGet Classification);
    }
}