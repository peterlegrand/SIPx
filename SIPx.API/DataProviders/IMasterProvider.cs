using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IMasterProvider
    {
        Task<AddressType> GetAddressType(string UserId, int AddressTypeId);
        Task<List<AddressType>> GetAddressTypes(string UserId);
        Task<List<Country>> GetCountries(string UserId);
        Task<Country> GetCountry(string UserId, int CountryId);
        Task<DateLevel> GetDateLevel(string UserId, int DateLevelId);
        Task<List<DateLevel>> GetDateLevels(string UserId);
        Task<Gender> GetGender(string UserId, int GenderId);
        Task<List<Gender>> GetGenders(string UserId);
        Task<List<Gender>> GetGendersActive(string UserId);
        Task<List<IntermediateRegion>> GetIntermediateRegions(string UserId);
        Task<List<Language>> GetLanguages(string UserId);
        Task<List<Language>> GetLanguagesActive(string UserId);
        Task<Setting> GetSetting(string UserId, int SettingId);
        Task<List<Setting>> GetSettings(string UserId);
        Task<SortBy> GetSortBy(string UserId, int SortById);
        Task<List<SortBy>> GetSortBys(string UserId);
        Task<Status> GetStatus(string UserId, int StatusId);
        Task<List<Status>> GetStatuses(string UserId);
        Task<List<StatusList>> GetStatusList(string UserId);
        Task<List<SubRegion>> GetSubRegions(string UserId);
        Task<TelecomType> GetTelecomType(string UserId, int TelecomTypeId);
        Task<List<TelecomType>> GetTelecomTypes(string UserId);
        Task<UITerm> GetUITerm(string UserId, int UITermId);
        Task<UITermLanguage> GetUITermLanguage(string UserId, int UITermLanguageId);
        Task<UITermLanguageCustomization> GetUITermLanguageCustomization(string UserId, int UITermLanguageCustomizationId);
        Task<List<UITermLanguageCustomization>> GetUITermLanguageCustomizations(string UserId);
        Task<List<UITermLanguage>> GetUITermLanguages(string UserId);
        Task<List<UITerm>> GetUITerms(string UserId);
        Task<LanguageList> GetUserLanguage(string UserId);
        Task<ValueUpdateType> GetValueUpdateType(string UserId, int ValueUpdateTypeId);
        Task<List<ValueUpdateType>> GetValueUpdateTypes(string UserId);
    }
}