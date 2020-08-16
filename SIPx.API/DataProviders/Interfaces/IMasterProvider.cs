using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IMasterProvider
    {
        bool PostObjectLanguage(ObjectLanguageCreatePost ObjectLanguage);
        Task<bool> PostObjectLanguageCheck(string TableName, int LanguageId, int Id);
        Task<List<UITerm>> UITermIndexGet(string UserId);
        Task<List<UITermLanguageCustomization>> UITermLanguageCustomizationIndexGet(string UserId);
        Task<UITermLanguageCustomization> UITermLanguageCustomizationUpdateGet(string UserId, int UITermLanguageCustomizationId);
        Task<List<UITermLanguage>> UITermLanguageIndexGet(string UserId, int TermID);
        Task<UITermLanguage> UITermLanguageUpdateGet(string UserId, int UITermLanguageId);
        Task<UITerm> UITermUpdateGet(string UserId, int UITermId);
        Task<LanguageList> UserLanguageUpdateGet(string UserId);
    }
}