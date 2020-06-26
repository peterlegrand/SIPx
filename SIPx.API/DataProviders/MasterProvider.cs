
using Dapper;
using SIPx.API.ViewModels;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class MasterProvider : IMasterProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public MasterProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<Country>> GetCountries(string UserID)
        {
            string usp = "usp_Countries @UserID";
            var x = await _sqlDataAccess.LoadData<Country, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<Country> GetCountry(string UserID, int CountryID)
        {
            string usp = "usp_Country @UserID, @CountryID";
            return _sqlDataAccess.LoadSingleRecord<Country, dynamic>(usp, new { UserID = UserID, CountryID = CountryID });

        }
        public async Task<List<DateLevel>> GetDateLevels(string UserID)
        {
            string usp = "usp_DateLevels @UserID";
            var x = await _sqlDataAccess.LoadData<DateLevel, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<DateLevel> GetDateLevel(string UserID, int DateLevelID)
        {
            string usp = "usp_DateLevel @UserID, @DateLevelID";
            return _sqlDataAccess.LoadSingleRecord<DateLevel, dynamic>(usp, new { UserID = UserID, DateLevelID = DateLevelID });

        }
        public async Task<List<Gender>> GetGenders(string UserID)
        {
            string usp = "usp_Genders @UserID";
            var x = await _sqlDataAccess.LoadData<Gender, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<Gender> GetGender(string UserID, int GenderID)
        {
            string usp = "usp_Gender @UserID, @GenderID";
            return _sqlDataAccess.LoadSingleRecord<Gender, dynamic>(usp, new { UserID = UserID, GenderID = GenderID });

        }
        public Task<List<Gender>> GetGendersActive(string UserID)
        {
            string usp = "usp_GendersActive @UserID";
            return _sqlDataAccess.LoadData<Gender, dynamic>(usp, new { UserID = UserID });

        }
        public async Task<List<IntermediateRegion>> GetIntermediateRegions(string UserID)
        {
            string usp = "usp_IntermediateRegions @UserID";
            var x = await _sqlDataAccess.LoadData<IntermediateRegion, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public async Task<List<Language>> GetLanguages(string UserID)
        {
            string usp = "usp_Languages @UserID";
            var x = await _sqlDataAccess.LoadData<Language, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public async Task<List<Language>> GetLanguagesActive(string UserID)
        {
            string usp = "usp_LanguagesActive @UserID";
            var x = await _sqlDataAccess.LoadData<Language, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public async Task<List<Setting>> GetSettings(string UserID)
        {
            string usp = "usp_Settings @UserID";
            var x = await _sqlDataAccess.LoadData<Setting, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<Setting> GetSetting(string UserID, int SettingID)
        {
            string usp = "usp_Setting @UserID, @SettingID";
            return _sqlDataAccess.LoadSingleRecord<Setting, dynamic>(usp, new { UserID = UserID, SettingID = SettingID });

        }
        public async Task<List<SortBy>> GetSortBys(string UserID)
        {
            string usp = "usp_SortBys @UserID";
            var x = await _sqlDataAccess.LoadData<SortBy, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<SortBy> GetSortBy(string UserID, int SortByID)
        {
            string usp = "usp_SortBy @UserID, @SortByID";
            return _sqlDataAccess.LoadSingleRecord<SortBy, dynamic>(usp, new { UserID = UserID, SortByID = SortByID });

        }
        public Task<List<Status>> GetStatuses(string UserID)
        {
            string usp = "usp_Statuses @UserID";
            return _sqlDataAccess.LoadData<Status, dynamic>(usp, new { UserID = UserID });

        }
        public Task<Status> GetStatus(string UserID, int StatusID)
        {
            string usp = "usp_Status @UserID, @StatusID";
            return _sqlDataAccess.LoadSingleRecord<Status, dynamic>(usp, new { UserID = UserID, StatusID = StatusID });

        }
        public Task<List<SubRegion>> GetSubRegions(string UserID)
        {
            string usp = "usp_SubRegions @UserID";
            return _sqlDataAccess.LoadData<SubRegion, dynamic>(usp, new { UserID = UserID });

        }
        public async Task<List<TelecomType>> GetTelecomTypes(string UserID)
        {
            string usp = "usp_TelecomTypes @UserID";
            var x = await _sqlDataAccess.LoadData<TelecomType, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<TelecomType> GetTelecomType(string UserID, int TelecomTypeID)
        {
            string usp = "usp_TelecomType @UserID, @TelecomTypeID";
            return _sqlDataAccess.LoadSingleRecord<TelecomType, dynamic>(usp, new { UserID = UserID, TelecomTypeID = TelecomTypeID });

        }
        public async Task<List<UITermLanguageCustomization>> GetUITermLanguageCustomizations(string UserID)
        {
            string usp = "usp_UITermLanguageCustomizations @UserID";
            var x = await _sqlDataAccess.LoadData<UITermLanguageCustomization, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<UITermLanguageCustomization> GetUITermLanguageCustomization(string UserID, int UITermLanguageCustomizationID)
        {
            string usp = "usp_UITermLanguageCustomization @UserID, @UITermLanguageCustomizationID";
            return _sqlDataAccess.LoadSingleRecord<UITermLanguageCustomization, dynamic>(usp, new { UserID = UserID, UITermLanguageCustomizationID = UITermLanguageCustomizationID });

        }
        public async Task<List<UITermLanguage>> GetUITermLanguages(string UserID)
        {
            string usp = "usp_UITermLanguages @UserID";
            var x = await _sqlDataAccess.LoadData<UITermLanguage, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<UITermLanguage> GetUITermLanguage(string UserID, int UITermLanguageID)
        {
            string usp = "usp_UITermLanguage @UserID, @UITermLanguageID";
            return _sqlDataAccess.LoadSingleRecord<UITermLanguage, dynamic>(usp, new { UserID = UserID, UITermLanguageID = UITermLanguageID });

        }
        public async Task<List<UITerm>> GetUITerms(string UserID)
        {
            string usp = "usp_UITerms @UserID";
            var x = await _sqlDataAccess.LoadData<UITerm, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<UITerm> GetUITerm(string UserID, int UITermID)
        {
            string usp = "usp_UITerm @UserID, @UITermID";
            return _sqlDataAccess.LoadSingleRecord<UITerm, dynamic>(usp, new { UserID = UserID, UITermID = UITermID });

        }
        public async Task<List<ValueUpdateType>> GetValueUpdateTypes(string UserID)
        {
            string usp = "usp_ValueUpdateTypes @UserID";
            var x = await _sqlDataAccess.LoadData<ValueUpdateType, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<ValueUpdateType> GetValueUpdateType(string UserID, int ValueUpdateTypeID)
        {
            string usp = "usp_ValueUpdateType @UserID, @ValueUpdateTypeID";
            return _sqlDataAccess.LoadSingleRecord<ValueUpdateType, dynamic>(usp, new { UserID = UserID, ValueUpdateTypeID = ValueUpdateTypeID });

        }
    }
}
