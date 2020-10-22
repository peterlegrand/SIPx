using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageSectionConditionTypeProvider
    {
        Task<List<PageSectionConditionTypeList>> List(string UserId);
    }
}