using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IMasterListProvider
    {
        Task<List<AddressTypeList>> AddressTypeList(string UserId);
        Task<List<CountryList>> CountryList(string UserId);
        //Task<List<DateLevelList>> DateLevelList(string UserId);
        Task<List<IconList>> IconList(string UserId);
        Task<List<LanguageList>> LanguageList(string UserId);
        Task<List<LanguageList>> LanguagesActiveList(string UserId);
        Task<List<SortByList>> SortByList(string UserId);
        Task<List<StatusList>> StatusList(string UserId);
        Task<List<TelecomTypeList>> TelecomTypeList(string UserId);
        Task<List<DateLevelList>> DateLevelList(string UserId);
    }
}