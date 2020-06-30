
using Dapper;
using Microsoft.Extensions.Configuration.UserSecrets;
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
        public async Task<List<MetaListUITerm>> UITerms()
        {
            string usp = "usp_metalistUITerm";
            var MetaList = await _sqlDataAccess.LoadData<MetaListUITerm>(usp);
            return MetaList;
        }
        public async Task<List<MetaListUITermCustomization>> UITermCustomizations()
        {
            string usp = "usp_metalistUITermCustomization";
            var MetaList = await _sqlDataAccess.LoadData<MetaListUITermCustomization>(usp);
            return MetaList;
        }
        public async Task<List<MetaListPageSectionDataType>> PageSectionDataTypes()
        {
            string usp = "usp_metalistPageSectionDataType";
            var MetaList = await _sqlDataAccess.LoadData<MetaListPageSectionDataType>(usp);
            return MetaList;
        }
        public async Task<List<MetaListPageSectionType>> PageSectionTypes()
        {
            string usp = "usp_metalistPageSectionType";
            var MetaList = await _sqlDataAccess.LoadData<MetaListPageSectionType>(usp);
            return MetaList;
        }
        public async Task<List<MetaListPreferenceType>> PreferenceTypes()
        {
            string usp = "usp_metalistPreferenceType";
            var MetaList = await _sqlDataAccess.LoadData<MetaListPreferenceType>(usp);
            return MetaList;
        }
        public async Task<List<MetaListProcessTemplateFieldType>> ProcessTemplateFieldTypes()
        {
            string usp = "usp_metalistProcessTemplateFieldType";
            var MetaList = await _sqlDataAccess.LoadData<MetaListProcessTemplateFieldType>(usp);
            return MetaList;
        }
        public async Task<List<MetaListProcessTemplateStageFieldStatus>> ProcessTemplateStageFieldStatuses()
        {
            string usp = "usp_metalistProcessTemplateStageFieldStatus";
            var MetaList = await _sqlDataAccess.LoadData<MetaListProcessTemplateStageFieldStatus>(usp);
            return MetaList;
        }
        public async Task<List<MetaListProcessTemplateFlowConditionComparisonOperator>> ProcessTemplateFlowConditionComparisonOperators()
        {
            string usp = "usp_metalistProcessTemplateFlowConditionComparisonOperator";
            var MetaList = await _sqlDataAccess.LoadData<MetaListProcessTemplateFlowConditionComparisonOperator>(usp);
            return MetaList;
        }
        public async Task<List<MetaListProcessTemplateFlowConditionType>> ProcessTemplateFlowConditionTypes()
        {
            string usp = "usp_metalistProcessTemplateFlowConditionType";
            var MetaList = await _sqlDataAccess.LoadData<MetaListProcessTemplateFlowConditionType>(usp);
            return MetaList;
        }
        public async Task<string> GetDefaultUser()
        {
            string usp = "usp_GetDefaultUser";
            var MetaList = await _sqlDataAccess.LoadData<string>(usp);
            return MetaList.First();
        }
        public async Task<List<MetaListClassification>> Classifications(string UserId)
        {
            string usp = "usp_Classifications  @UserID";
            var MetaList = await _sqlDataAccess.LoadData<MetaListClassification, dynamic>(usp, new { UserId = UserId });
            return MetaList;
        }
        public async Task<List<MetaListClassificationLevel>> ClassificationLevels(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationLevels  @UserId, @ClassificationID";
            var MetaList = await _sqlDataAccess.LoadData<MetaListClassificationLevel, dynamic>(usp, new { UserId = UserId, ClassificationId  = ClassificationId  });
            return MetaList;
        }

    }
}
