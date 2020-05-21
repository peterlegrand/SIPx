using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.API.DataProviders
{
    public interface IUITermLanguageCustomizationProvider
    {
        List<UITermLanguageCustomization> GetUITermLanguageCustomization(string Controller, string Action, int LanguageId);
    }
}