﻿
using Dapper;
using SIPx.API.Models;
using SIPx.API.ViewModels;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class MetaProvider : IMetaProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public MetaProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<MetaListAddressType>> AddressTypes()
        {
            string usp = "usp_metalistaddresstype";
            var MetaList = await _sqlDataAccess.LoadData<MetaListAddressType>(usp);
            return MetaList;
        }
        public async Task<List<MetaListClaim>> Claims()
        {
            string usp = "usp_metalistClaim";
            var MetaList = await _sqlDataAccess.LoadData<MetaListClaim>(usp);
            return MetaList;
        }
        public async Task<List<MetaListClaimGroup>> ClaimGroups()
        {
            string usp = "usp_metalistClaimGroup";
            var MetaList = await _sqlDataAccess.LoadData<MetaListClaimGroup>(usp);
            return MetaList;
        }
        public async Task<List<MetaListContentStatus>> ContentStatuses()
        {
            string usp = "usp_metalistContentStatus";
            var MetaList = await _sqlDataAccess.LoadData<MetaListContentStatus>(usp);
            return MetaList;
        }
        public async Task<List<MetaListCountry>> Countries()
        {
            string usp = "usp_metalistCountry";
            var MetaList = await _sqlDataAccess.LoadData<MetaListCountry>(usp);
            return MetaList;
        }
        public async Task<List<MetaListDateLevel>> DateLevels()
        {
            string usp = "usp_metalistDateLevel";
            var MetaList = await _sqlDataAccess.LoadData<MetaListDateLevel>(usp);
            return MetaList;
        }
        public async Task<List<MetaListGender>> Genders()
        {
            string usp = "usp_metalistGender";
            var MetaList = await _sqlDataAccess.LoadData<MetaListGender>(usp);
            return MetaList;
        }
        public async Task<List<MetaListLanguage>> Languages()
        {
            string usp = "usp_metalistLanguage";
            var MetaList = await _sqlDataAccess.LoadData<MetaListLanguage>(usp);
            return MetaList;
        }
        public async Task<List<MetaListRegion>> Regions()
        {
            string usp = "usp_metalistRegion";
            var MetaList = await _sqlDataAccess.LoadData<MetaListRegion>(usp);
            return MetaList;
        }
        public async Task<List<MetaListSecurityLevel>> SecurityLevels()
        {
            string usp = "usp_metalistSecurityLevel";
            var MetaList = await _sqlDataAccess.LoadData<MetaListSecurityLevel>(usp);
            return MetaList;
        }
        public async Task<List<MetaListSettings>> Settings()
        {
            string usp = "usp_metalistSettings";
            var MetaList = await _sqlDataAccess.LoadData<MetaListSettings>(usp);
            return MetaList;
        }
        public async Task<List<MetaListSortBy>> SortBys()
        {
            string usp = "usp_metalistSortBy";
            var MetaList = await _sqlDataAccess.LoadData<MetaListSortBy>(usp);
            return MetaList;
        }
        public async Task<List<MetaListStatus>> Statuses()
        {
            string usp = "usp_metalistStatus";
            var MetaList = await _sqlDataAccess.LoadData<MetaListStatus>(usp);
            return MetaList;
        }
        public async Task<List<MetaListSubRegion>> SubRegions()
        {
            string usp = "usp_metalistSubRegion";
            var MetaList = await _sqlDataAccess.LoadData<MetaListSubRegion>(usp);
            return MetaList;
        }
        public async Task<List<MetaListTelecomType>> TelecomTypes()
        {
            string usp = "usp_metalistTelecomType";
            var MetaList = await _sqlDataAccess.LoadData<MetaListTelecomType>(usp);
            return MetaList;
        }
        public async Task<List<MetaListValueUpdateType>> ValueUpdateTypes()
        {
            string usp = "usp_metalistValueUpdateType";
            var MetaList = await _sqlDataAccess.LoadData<MetaListValueUpdateType>(usp);
            return MetaList;
        }

    }
}