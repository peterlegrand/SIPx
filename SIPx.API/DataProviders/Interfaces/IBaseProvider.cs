using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IBaseProvider
    {
        Task<List<LanguageList>> CreateGetLanguages(int BaseId, string BaseType, string UserId);
        bool CreatePost(BaseLanguageCreateGet BaseLanguage);
        Task<List<ErrorMessage>> CreatePostCheck(BaseLanguageCreateGet BaseLanguage);
        Task<BaseLanguageDeleteGet> DeleteGet(string BaseType, int BaseLanguageId, string UserId);
        bool DeletePost(string UserId, int BaseId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int BaseId);
        Task<List<BaseLanguageIndexGetGrid>> IndexGet(string BaseType, int BaseId, string UserId);
        Task<BaseLanguageUpdateGet> UpdateGet(string BaseType, int BaseLanguageId, string UserId);
        bool UpdatePost(BaseLanguageUpdateGet BaseLanguage);
        Task<List<ErrorMessage>> UpdatePostCheck(BaseLanguageUpdateGet BaseLanguage);
        Task<string> BaseTypeToTable(string BaseType);
    }
}