using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ITermProvider
    {
        Task<List<UITerm>> UITermIndexGet(string UserId);
        Task<List<UITermLanguage>> UITermLanguageIndexGet(string UserId, int UITermId);
        Task<UITermLanguage> UITermLanguageUpdateGet(string UserId, int UITermLanguageId);
    }
}