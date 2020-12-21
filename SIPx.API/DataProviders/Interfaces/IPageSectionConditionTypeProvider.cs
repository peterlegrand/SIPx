using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageSectionContentConditionTypeProvider
    {
        Task<List<PageSectionContentConditionTypeList>> List(string UserId);
        Task<List<PageSectionContentConditionTypeListExtended>> ListExtended(string UserId);
    }
}