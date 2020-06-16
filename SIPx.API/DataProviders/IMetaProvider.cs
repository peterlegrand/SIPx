using SIPx.API.ViewModels;
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
        Task<List<MetaListRegion>> Regions();
        Task<List<MetaListSecurityLevel>> SecurityLevels();
        Task<List<MetaListSettings>> Settings();
        Task<List<MetaListSortBy>> SortBys();
        Task<List<MetaListStatus>> Statuses();
        Task<List<MetaListSubRegion>> SubRegions();
        Task<List<MetaListTelecomType>> TelecomTypes();
        Task<List<MetaListValueUpdateType>> ValueUpdateTypes();
    }
}