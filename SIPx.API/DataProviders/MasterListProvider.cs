﻿
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
    public class MasterListProvider : IMasterListProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public MasterListProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<LanguageList>> LanguageList(string UserId)
        {
            string usp = "usp_LanguageList @UserID";
            var x = await _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<DateLevelList>> DateLevelList(string UserId)
        {
            string usp = "usp_DateLevelList @UserID";
            var x = await _sqlDataAccess.LoadData<DateLevelList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<AddressTypeList>> AddressTypeList(string UserId)
        {
            string usp = "usp_AddressTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<AddressTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<TelecomTypeList>> TelecomTypeList(string UserId)
        {
            string usp = "usp_TelecomTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<TelecomTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<IconList>> IconList(string UserId)
        {
            string usp = "usp_IconList @UserID";
            var x = await _sqlDataAccess.LoadData<IconList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<CountryList>> CountryList(string UserId)
        {
            string usp = "usp_CountryList @UserID";
            var x = await _sqlDataAccess.LoadData<CountryList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<LanguageList>> LanguagesActiveList(string UserId)
        {
            string usp = "usp_LanguagesActiveList @UserID";
            var x = await _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<SortByList>> SortByList(string UserId)
        {
            string usp = "usp_SortByList @UserID";
            var x = await _sqlDataAccess.LoadData<SortByList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<List<StatusList>> StatusList(string UserId)
        {
            string usp = "usp_StatusList @UserID";
            return _sqlDataAccess.LoadData<StatusList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ValueUpdateTypeList> ValueUpdateTypeList(string UserId)
        {
            string usp = "usp_ValueUpdateTypeList @UserId";
            return _sqlDataAccess.LoadSingleRecord<ValueUpdateTypeList, dynamic>(usp, new { UserId = UserId});

        }

    }
}
