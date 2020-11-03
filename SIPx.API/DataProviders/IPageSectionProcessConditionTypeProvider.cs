using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageSectionProcessConditionTypeProvider
    {
        Task<List<PageSectionProcessConditionTypeList>> List(string UserId);
        Task<List<PageSectionProcessConditionTypeListExtended>> ListExtended(string UserId);
    }
}