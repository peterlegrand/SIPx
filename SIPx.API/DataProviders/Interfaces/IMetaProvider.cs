using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IMetaProvider
    {
        Task<List<MetaListAddressType>> AddressTypes();
        Task<List<MetaListClaimGroup>> ClaimGroups();
        Task<List<MetaListClaim>> Claims();
        Task<List<MetaListContentStatus>> ContentStatuses();
        Task<List<MetaListCountry>> Countries();
        Task<List<MetaListDateLevel>> DateLevels();
        Task<List<MetaListGender>> Genders();
        Task<List<MetaListLanguage>> Languages();
        Task<List<MetaListPageSectionDataType>> PageSectionDataTypes();
        Task<List<MetaListPageSectionType>> PageSectionTypes();
        Task<List<MetaListPreferenceType>> PreferenceTypes();
        Task<List<MetaListProcessTemplateFieldType>> ProcessTemplateFieldTypes();
        Task<List<MetaListProcessTemplateFlowConditionComparisonOperator>> ProcessTemplateFlowConditionComparisonOperators();
        Task<List<MetaListProcessTemplateFlowConditionType>> ProcessTemplateFlowConditionTypes();
        Task<List<MetaListProcessTemplateStageFieldStatus>> ProcessTemplateStageFieldStatuses();
        Task<List<MetaListRegion>> Regions();
        Task<List<MetaListSecurityLevel>> SecurityLevels();
        Task<List<MetaListSettings>> Settings();
        Task<List<MetaListSortBy>> SortBys();
        Task<List<MetaListStatus>> Statuses();
        Task<List<MetaListSubRegion>> SubRegions();
        Task<List<MetaListTelecomType>> TelecomTypes();
        Task<List<MetaListUITermCustomization>> UITermCustomizations();
        Task<List<MetaListUITerm>> UITerms();
        Task<List<MetaListValueUpdateType>> ValueUpdateTypes();
        Task<string> GetDefaultUser();
        Task<List<MetaListClassification>> Classifications(string UserId);
        Task<List<MetaListClassificationLevel>> ClassificationLevels(string UserId, int ClassificationId);
    }
}