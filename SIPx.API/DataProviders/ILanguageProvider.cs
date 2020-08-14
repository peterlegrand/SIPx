using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ILanguageProvider
    {
        Task<List<LanguageIndexGet>> LanguageIndexGet(string UserId);
        Task<List<LanguageList>> LanguageList(string UserId);
        Task<List<LanguageList>> LanguagesActiveList(string UserId);
        bool PostObjectLanguage(ObjectLanguageCreatePost ObjectLanguage);
        Task<bool> PostObjectLanguageCheck(string TableName, int LanguageId, int Id);
        Task<List<UITermLanguageCustomization>> UITermLanguageCustomizationIndexGet(string UserId);
        Task<UITermLanguageCustomization> UITermLanguageCustomizationUpdateGet(string UserId, int UITermLanguageCustomizationId);
        Task<List<UITermLanguage>> UITermLanguageIndexGet(string UserId);
        Task<UITermLanguage> UITermLanguageUpdateGet(string UserId, int UITermLanguageId);
        Task<LanguageList> UserLanguageUpdateGet(string UserId);
    }
}