using SIPx.Shared;
using System.Collections.Generic;

namespace SIPx.API.DataProviders
{
    public interface IUITermLanguageCustomizationProvider
    {
        List<UITermLanguageCustomizationList> IndexGet(string Controller, string Action, string UserId);
    }
}