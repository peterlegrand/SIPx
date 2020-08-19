using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageSectionTypeProvider
    {
        Task<List<PageSectionTypeList>> List(string UserId);
    }
}