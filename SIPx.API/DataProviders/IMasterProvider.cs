using SIPx.API.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IMasterProvider
    {
        Task<List<Country>> GetCountries(string UserID);
        Task<Country> GetCountry(string UserID, int CountryID);
        Task<DateLevel> GetDateLevel(string UserID, int DateLevelID);
        Task<List<DateLevel>> GetDateLevels(string UserID);
        Task<Gender> GetGender(string UserID, int GenderID);
        Task<List<Gender>> GetGenders(string UserID);
        Task<List<Gender>> GetGendersActive(string UserID);
        Task<List<IntermediateRegion>> GetIntermediateRegions(string UserID);
        Task<List<Language>> GetLanguages(string UserID);
        Task<List<Language>> GetLanguagesActive(string UserID);
        Task<Setting> GetSetting(string UserID, int SettingID);
        Task<List<Setting>> GetSettings(string UserID);
        Task<SortBy> GetSortBy(string UserID, int SortByID);
        Task<List<SortBy>> GetSortBys(string UserID);
        Task<Status> GetStatus(string UserID, int StatusID);
        Task<List<Status>> GetStatuses(string UserID);
        Task<List<SubRegion>> GetSubRegions(string UserID);
        Task<TelecomType> GetTelecomType(string UserID, int TelecomTypeID);
        Task<List<TelecomType>> GetTelecomTypes(string UserID);
        Task<UITerm> GetUITerm(string UserID, int UITermID);
        Task<UITermLanguage> GetUITermLanguage(string UserID, int UITermLanguageID);
        Task<UITermLanguageCustomization> GetUITermLanguageCustomization(string UserID, int UITermLanguageCustomizationID);
        Task<List<UITermLanguageCustomization>> GetUITermLanguageCustomizations(string UserID);
        Task<List<UITermLanguage>> GetUITermLanguages(string UserID);
        Task<List<UITerm>> GetUITerms(string UserID);
        Task<ValueUpdateType> GetValueUpdateType(string UserID, int ValueUpdateTypeID);
        Task<List<ValueUpdateType>> GetValueUpdateTypes(string UserID);
    }
}