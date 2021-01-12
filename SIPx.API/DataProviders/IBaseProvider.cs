using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IBaseProvider
    {
        bool CreatePost(BaseLanguageCreateGet BaseLanguage);
        Task<List<ErrorMessage>> CreatePostCheck(BaseLanguageCreateGet BaseLanguage);
        Task<BaseLanguageDeleteGet> DeleteGet(string UserId, int BaseId);
        bool DeletePost(string UserId, int BaseId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int BaseId);
        Task<List<BaseLanguageIndexGet>> IndexGet(string BaseType, int BaseId, string UserId);
        Task<BaseLanguageUpdateGet> UpdateGet(string BaseType, int BaseId, string UserId);
        bool UpdatePost(BaseLanguageUpdateGet BaseLanguage);
        Task<List<ErrorMessage>> UpdatePostCheck(BaseLanguageUpdateGet BaseLanguage);
        Task<List<LanguageList>> CreateGetLanguages(int BaseId, string BaseType, string UserId);
    }
}