
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

        public async Task<LanguageList> UserLanguageUpdateGet(string UserId)
        {
            string usp = "usp_GetUserLanguageUpdateGet @UserID";
            var x = await _sqlDataAccess.LoadSingleRecord<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<LanguageList>> LanguageList(string UserId)
        {
            string usp = "usp_LanguageList @UserID";
            var x = await _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<Country>> CountryIndexGet(string UserId)
        {
            string usp = "usp_CountryIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<Country, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<CountryList>> CountryList(string UserId)
        {
            string usp = "usp_CountryList @UserID";
            var x = await _sqlDataAccess.LoadData<CountryList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Country> CountryUpdateGet(string UserId, int CountryId)
        {
            string usp = "usp_CountryUpdateGet @UserId, @CountryID";
            var x = _sqlDataAccess.LoadSingleRecord<Country, dynamic>(usp, new { UserId = UserId, CountryId = CountryId });
            return x;

        }
        public async Task<List<DateLevel>> DateLevelIndexGet(string UserId)
        {
            string usp = "usp_DateLevelsIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<DateLevel, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<DateLevel> DateLevelUpdateGet(string UserId, int DateLevelId)
        {
            string usp = "usp_DateLevelUpdateGet @UserId, @DateLevelID";
            return _sqlDataAccess.LoadSingleRecord<DateLevel, dynamic>(usp, new { UserId = UserId, DateLevelId = DateLevelId });

        }
        public async Task<List<Gender>> GenderIndexGet(string UserId)
        {
            string usp = "usp_GenderIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<Gender, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Gender> GenderUpdateGet(string UserId, int GenderId)
        {
            string usp = "usp_GenderUpdateGet @UserId, @GenderID";
            return _sqlDataAccess.LoadSingleRecord<Gender, dynamic>(usp, new { UserId = UserId, GenderId = GenderId });

        }
        public Task<List<Gender>> GendersActive(string UserId)
        {
            string usp = "usp_GendersActive @UserID";
            return _sqlDataAccess.LoadData<Gender, dynamic>(usp, new { UserId = UserId });

        }
        public async Task<List<IntermediateRegion>> IntermediateRegionIndexGet(string UserId)
        {
            string usp = "usp_IntermediateRegionIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<IntermediateRegion, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<Language>> LanguageIndexGet(string UserId)
        {
            string usp = "usp_LanguageIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<Language, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<Language>> LanguagesActiveGet(string UserId)
        {
            string usp = "usp_LanguagesActive @UserID";
            var x = await _sqlDataAccess.LoadData<Language, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<SettingUpdateGet>> SettingIndexGet(string UserId)
        {
            string usp = "usp_SettingIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<SettingUpdateGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<SettingUpdateGet> SettingUpdateGet(string UserId, int SettingId)
        {
            string usp = "usp_SettingUpdateGet @UserId, @SettingID";
            return _sqlDataAccess.LoadSingleRecord<SettingUpdateGet, dynamic>(usp, new { UserId = UserId, SettingId = SettingId });

        }
        public async Task<List<SortBy>> SortByIndexGet(string UserId)
        {
            string usp = "usp_SortByIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<SortBy, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<SortByList>> SortByList(string UserId)
        {
            string usp = "usp_SortByList @UserID";
            var x = await _sqlDataAccess.LoadData<SortByList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<SortBy> SortByUpdateGet(string UserId, int SortById)
        {
            string usp = "usp_SortByUpdateGet @UserId, @SortByID";
            return _sqlDataAccess.LoadSingleRecord<SortBy, dynamic>(usp, new { UserId = UserId, SortById = SortById });

        }
        public Task<List<StatusList>> StatusList(string UserId)
        {
            string usp = "usp_StatusList @UserID";
            return _sqlDataAccess.LoadData<StatusList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<Status>> StatusIndexGet(string UserId)
        {
            string usp = "usp_StatusIndexGet @UserID";
            return _sqlDataAccess.LoadData<Status, dynamic>(usp, new { UserId = UserId });

        }
        public Task<Status> StatusUpdateGet(string UserId, int StatusId)
        {
            string usp = "usp_StatusUpdateGet @UserId, @StatusID";
            return _sqlDataAccess.LoadSingleRecord<Status, dynamic>(usp, new { UserId = UserId, StatusId = StatusId });

        }
        public Task<List<SubRegion>> SubRegionIndexGet(string UserId)
        {
            string usp = "usp_SubRegionIndexGet @UserID";
            return _sqlDataAccess.LoadData<SubRegion, dynamic>(usp, new { UserId = UserId });

        }
        public async Task<List<TelecomType>> TelecomTypeIndexGet(string UserId)
        {
            string usp = "usp_TelecomTypeIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<TelecomType, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<TelecomType> TelecomTypeUpdateGet(string UserId, int TelecomTypeId)
        {
            string usp = "usp_TelecomTypeUpdateGet @UserId, @TelecomTypeID";
            return _sqlDataAccess.LoadSingleRecord<TelecomType, dynamic>(usp, new { UserId = UserId, TelecomTypeId = TelecomTypeId });

        }
        public async Task<List<UITermLanguageCustomization>> UITermLanguageCustomizationIndexGet(string UserId)
        {
            string usp = "usp_UITermLanguageCustomizationIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<UITermLanguageCustomization, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<UITermLanguageCustomization> UITermLanguageCustomizationUpdateGet(string UserId, int UITermLanguageCustomizationId)
        {
            string usp = "usp_UITermLanguageCustomizationUpdateGet @UserId, @UITermLanguageCustomizationID";
            return _sqlDataAccess.LoadSingleRecord<UITermLanguageCustomization, dynamic>(usp, new { UserId = UserId, UITermLanguageCustomizationId = UITermLanguageCustomizationId });

        }
        public async Task<List<UITermLanguage>> UITermLanguageIndexGet(string UserId)
        {
            string usp = "usp_UITermLanguageIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<UITermLanguage, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<UITermLanguage> UITermLanguageUpdateGet(string UserId, int UITermLanguageId)
        {
            string usp = "usp_UITermLanguageUpdateGet @UserId, @UITermLanguageID";
            return _sqlDataAccess.LoadSingleRecord<UITermLanguage, dynamic>(usp, new { UserId = UserId, UITermLanguageId = UITermLanguageId });

        }
        public async Task<List<UITerm>> UITermIndexGet(string UserId)
        {
            string usp = "usp_UITermIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<UITerm, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<UITerm> UITermUpdateGet(string UserId, int UITermId)
        {
            string usp = "usp_UITermUpdateGet @UserId, @UITermID";
            return _sqlDataAccess.LoadSingleRecord<UITerm, dynamic>(usp, new { UserId = UserId, UITermId = UITermId });

        }
        public async Task<List<ValueUpdateType>> ValueUpdateTypeIndexGet(string UserId)
        {
            string usp = "usp_ValueUpdateTypeIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ValueUpdateType, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ValueUpdateType> ValueUpdateTypeUpdateGet(string UserId, int ValueUpdateTypeId)
        {
            string usp = "usp_ValueUpdateTypeUpdateGet @UserId, @ValueUpdateTypeID";
            return _sqlDataAccess.LoadSingleRecord<ValueUpdateType, dynamic>(usp, new { UserId = UserId, ValueUpdateTypeId = ValueUpdateTypeId });

        }
        public async Task<List<AddressType>> AddressTypeIndexGet(string UserId)
        {
            string usp = "usp_AddressTypeIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<AddressType, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<AddressType> AddressTypeUpdateGet(string UserId, int AddressTypeId)
        {
            string usp = "usp_AddressTypeUpdateGet @UserId, @AddressTypeID";
            return _sqlDataAccess.LoadSingleRecord<AddressType, dynamic>(usp, new { UserId = UserId, AddressTypeId = AddressTypeId });

        }

        public async Task<bool> PostObjectLanguageCheck(string TableName, int LanguageId , int Id)
        {
            string usp = "usp_LanguageOnLanguageObject @TableName, @LanguageId, @Id";
            var x = await _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { TableName = TableName, LanguageId = LanguageId, Id = Id });
            if (x > 0)
                return (false);
            return (true);
        }
        public bool PostObjectLanguage(ObjectLanguageCreatePost ObjectLanguage)
        {
            string usp = "usp_ObjectLanguageCreate @TableName, @ObjectId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ObjectLanguageCreatePost>(usp, ObjectLanguage);
            return true;
        }
    }
}
