using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.API.DataProviders
{
    public interface IUITermLanguageCustomizationProvider
    {
        List<UITermLanguageCustomizationList> IndexGet(string Controller, string Action, string UserId);
        Task<string> OneTerm(string InternalName, string UserId);
    }
}