
using Dapper;
using SIPx.Shared;
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

        public async Task<LanguageList> GetUserLanguage(string UserId)
        {
            string usp = "usp_GetUserLanguage @UserID";
            var x = await _sqlDataAccess.LoadSingleRecord<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<Country>> GetCountries(string UserId)
        {
            string usp = "usp_Countries @UserID";
            var x = await _sqlDataAccess.LoadData<Country, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Country> GetCountry(string UserId, int CountryId)
        {
            string usp = "usp_Country @UserId, @CountryID";
            return _sqlDataAccess.LoadSingleRecord<Country, dynamic>(usp, new { UserId = UserId, CountryId = CountryId });

        }
        public async Task<List<DateLevel>> GetDateLevels(string UserId)
        {
            string usp = "usp_DateLevels @UserID";
            var x = await _sqlDataAccess.LoadData<DateLevel, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<DateLevel> GetDateLevel(string UserId, int DateLevelId)
        {
            string usp = "usp_DateLevel @UserId, @DateLevelID";
            return _sqlDataAccess.LoadSingleRecord<DateLevel, dynamic>(usp, new { UserId = UserId, DateLevelId = DateLevelId });

        }
        public async Task<List<Gender>> GetGenders(string UserId)
        {
            string usp = "usp_Genders @UserID";
            var x = await _sqlDataAccess.LoadData<Gender, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Gender> GetGender(string UserId, int GenderId)
        {
            string usp = "usp_Gender @UserId, @GenderID";
            return _sqlDataAccess.LoadSingleRecord<Gender, dynamic>(usp, new { UserId = UserId, GenderId = GenderId });

        }
        public Task<List<Gender>> GetGendersActive(string UserId)
        {
            string usp = "usp_GendersActive @UserID";
            return _sqlDataAccess.LoadData<Gender, dynamic>(usp, new { UserId = UserId });

        }
        public async Task<List<IntermediateRegion>> GetIntermediateRegions(string UserId)
        {
            string usp = "usp_IntermediateRegions @UserID";
            var x = await _sqlDataAccess.LoadData<IntermediateRegion, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<Language>> GetLanguages(string UserId)
        {
            string usp = "usp_Languages @UserID";
            var x = await _sqlDataAccess.LoadData<Language, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<Language>> GetLanguagesActive(string UserId)
        {
            string usp = "usp_LanguagesActive @UserID";
            var x = await _sqlDataAccess.LoadData<Language, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<SettingUpdateGet>> GetSettings(string UserId)
        {
            string usp = "usp_Settings @UserID";
            var x = await _sqlDataAccess.LoadData<SettingUpdateGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<SettingUpdateGet> GetSetting(string UserId, int SettingId)
        {
            string usp = "usp_Setting @UserId, @SettingID";
            return _sqlDataAccess.LoadSingleRecord<SettingUpdateGet, dynamic>(usp, new { UserId = UserId, SettingId = SettingId });

        }
        public async Task<List<SortBy>> GetSortBys(string UserId)
        {
            string usp = "usp_SortBys @UserID";
            var x = await _sqlDataAccess.LoadData<SortBy, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<SortBy> GetSortBy(string UserId, int SortById)
        {
            string usp = "usp_SortBy @UserId, @SortByID";
            return _sqlDataAccess.LoadSingleRecord<SortBy, dynamic>(usp, new { UserId = UserId, SortById = SortById });

        }
        public Task<List<StatusList>> GetStatusList(string UserId)
        {
            string usp = "usp_StatusList @UserID";
            return _sqlDataAccess.LoadData<StatusList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<Status>> GetStatuses(string UserId)
        {
            string usp = "usp_Statuses @UserID";
            return _sqlDataAccess.LoadData<Status, dynamic>(usp, new { UserId = UserId });

        }
        public Task<Status> GetStatus(string UserId, int StatusId)
        {
            string usp = "usp_Status @UserId, @StatusID";
            return _sqlDataAccess.LoadSingleRecord<Status, dynamic>(usp, new { UserId = UserId, StatusId = StatusId });

        }
        public Task<List<SubRegion>> GetSubRegions(string UserId)
        {
            string usp = "usp_SubRegions @UserID";
            return _sqlDataAccess.LoadData<SubRegion, dynamic>(usp, new { UserId = UserId });

        }
        public async Task<List<TelecomType>> GetTelecomTypes(string UserId)
        {
            string usp = "usp_TelecomTypes @UserID";
            var x = await _sqlDataAccess.LoadData<TelecomType, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<TelecomType> GetTelecomType(string UserId, int TelecomTypeId)
        {
            string usp = "usp_TelecomType @UserId, @TelecomTypeID";
            return _sqlDataAccess.LoadSingleRecord<TelecomType, dynamic>(usp, new { UserId = UserId, TelecomTypeId = TelecomTypeId });

        }
        public async Task<List<UITermLanguageCustomization>> GetUITermLanguageCustomizations(string UserId)
        {
            string usp = "usp_UITermLanguageCustomizations @UserID";
            var x = await _sqlDataAccess.LoadData<UITermLanguageCustomization, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<UITermLanguageCustomization> GetUITermLanguageCustomization(string UserId, int UITermLanguageCustomizationId)
        {
            string usp = "usp_UITermLanguageCustomization @UserId, @UITermLanguageCustomizationID";
            return _sqlDataAccess.LoadSingleRecord<UITermLanguageCustomization, dynamic>(usp, new { UserId = UserId, UITermLanguageCustomizationId = UITermLanguageCustomizationId });

        }
        public async Task<List<UITermLanguage>> GetUITermLanguages(string UserId)
        {
            string usp = "usp_UITermLanguages @UserID";
            var x = await _sqlDataAccess.LoadData<UITermLanguage, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<UITermLanguage> GetUITermLanguage(string UserId, int UITermLanguageId)
        {
            string usp = "usp_UITermLanguage @UserId, @UITermLanguageID";
            return _sqlDataAccess.LoadSingleRecord<UITermLanguage, dynamic>(usp, new { UserId = UserId, UITermLanguageId = UITermLanguageId });

        }
        public async Task<List<UITerm>> GetUITerms(string UserId)
        {
            string usp = "usp_UITerms @UserID";
            var x = await _sqlDataAccess.LoadData<UITerm, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<UITerm> GetUITerm(string UserId, int UITermId)
        {
            string usp = "usp_UITerm @UserId, @UITermID";
            return _sqlDataAccess.LoadSingleRecord<UITerm, dynamic>(usp, new { UserId = UserId, UITermId = UITermId });

        }
        public async Task<List<ValueUpdateType>> GetValueUpdateTypes(string UserId)
        {
            string usp = "usp_ValueUpdateTypes @UserID";
            var x = await _sqlDataAccess.LoadData<ValueUpdateType, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ValueUpdateType> GetValueUpdateType(string UserId, int ValueUpdateTypeId)
        {
            string usp = "usp_ValueUpdateType @UserId, @ValueUpdateTypeID";
            return _sqlDataAccess.LoadSingleRecord<ValueUpdateType, dynamic>(usp, new { UserId = UserId, ValueUpdateTypeId = ValueUpdateTypeId });

        }
        public async Task<List<AddressType>> GetAddressTypes(string UserId)
        {
            string usp = "usp_AddressTypes @UserID";
            var x = await _sqlDataAccess.LoadData<AddressType, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<AddressType> GetAddressType(string UserId, int AddressTypeId)
        {
            string usp = "usp_AddressType @UserId, @AddressTypeID";
            return _sqlDataAccess.LoadSingleRecord<AddressType, dynamic>(usp, new { UserId = UserId, AddressTypeId = AddressTypeId });

        }


    }
}
