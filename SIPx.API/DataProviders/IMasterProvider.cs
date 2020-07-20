using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IMasterProvider
    {
        Task<List<AddressType>> AddressTypeIndexGet(string UserId);
        Task<AddressType> AddressTypeUpdateGet(string UserId, int AddressTypeId);
        Task<List<Country>> CountryIndexGet(string UserId);
        Task<List<CountryList>> CountryList(string UserId);
        Task<Country> CountryUpdateGet(string UserId, int CountryId);
        Task<List<DateLevel>> DateLevelIndexGet(string UserId);
        Task<DateLevel> DateLevelUpdateGet(string UserId, int DateLevelId);
        Task<List<Gender>> GenderIndexGet(string UserId);
        Task<List<Gender>> GendersActive(string UserId);
        Task<Gender> GenderUpdateGet(string UserId, int GenderId);
        Task<List<IntermediateRegion>> IntermediateRegionIndexGet(string UserId);
        Task<List<Language>> LanguageIndexGet(string UserId);
        Task<List<Language>> LanguagesActiveGet(string UserId);
        Task<List<SettingUpdateGet>> SettingIndexGet(string UserId);
        Task<SettingUpdateGet> SettingUpdateGet(string UserId, int SettingId);
        Task<List<SortBy>> SortByIndexGet(string UserId);
        Task<List<SortByList>> SortByList(string UserId);
        Task<SortBy> SortByUpdateGet(string UserId, int SortById);
        Task<List<Status>> StatusIndexGet(string UserId);
        Task<List<StatusList>> StatusList(string UserId);
        Task<Status> StatusUpdateGet(string UserId, int StatusId);
        Task<List<SubRegion>> SubRegionIndexGet(string UserId);
        Task<List<TelecomType>> TelecomTypeIndexGet(string UserId);
        Task<TelecomType> TelecomTypeUpdateGet(string UserId, int TelecomTypeId);
        Task<List<UITerm>> UITermIndexGet(string UserId);
        Task<List<UITermLanguageCustomization>> UITermLanguageCustomizationIndexGet(string UserId);
        Task<UITermLanguageCustomization> UITermLanguageCustomizationUpdateGet(string UserId, int UITermLanguageCustomizationId);
        Task<List<UITermLanguage>> UITermLanguageIndexGet(string UserId);
        Task<UITermLanguage> UITermLanguageUpdateGet(string UserId, int UITermLanguageId);
        Task<UITerm> UITermUpdateGet(string UserId, int UITermId);
        Task<LanguageList> UserLanguageUpdateGet(string UserId);
        Task<List<ValueUpdateType>> ValueUpdateTypeIndexGet(string UserId);
        Task<ValueUpdateType> ValueUpdateTypeUpdateGet(string UserId, int ValueUpdateTypeId);
    }
}