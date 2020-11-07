using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ILanguageProvider
    {
        Task<List<LanguageIndexGet>> IndexGet(string UserId);
        Task<List<LanguageList>> List(string UserId);
        Task<List<LanguageList>> ActiveList(string UserId);
        bool PostObjectLanguage(ObjectLanguageCreatePost ObjectLanguage);
        Task<bool> NoOfLanguagesOnLanguageObject(string TableName, int LanguageId, int Id);
        Task<List<UITermLanguageCustomization>> UITermLanguageCustomizationIndexGet(string UserId);
        Task<UITermLanguageCustomization> UITermLanguageCustomizationUpdateGet(string UserId, int UITermLanguageCustomizationId);
        Task<List<UITermLanguage>> UITermLanguageIndexGet(string UserId);
        Task<UITermLanguage> UITermLanguageUpdateGet(string UserId, int UITermLanguageId);
        Task<LanguageList> UserLanguageUpdateGet(string UserId);
        bool UpdatePost(LanguageUpdateGet ContentType);
        Task<LanguageUpdateGet> UpdateGet(string UserId, int LanguageId);
        Task<List<LanguageList>> ActiveDefaultList();
    }
}