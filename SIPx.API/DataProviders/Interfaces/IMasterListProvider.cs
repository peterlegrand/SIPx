using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IMasterListProvider
    {
        Task<List<CountryList>> CountryList(string UserId);
        //Task<List<DateLevelList>> DateLevelList(string UserId);
        Task<List<IconList>> IconList(string UserId);
        Task<List<SortByList>> SortByList(string UserId);
        Task<List<StatusList>> StatusList(string UserId);
        Task<List<ClaimList>> ClaimList(string UserId);
        Task<List<ValueUpdateTypeList>> ValueUpdateTypeList(string UserId);
        Task<List<ProcessTemplateStageFieldStatusList>> ProcessTemplateStageFieldStatusList(string UserId);
    }
}