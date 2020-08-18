using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPageSectionDataTypeProvider
    {
        Task<List<PageSectionDataTypeList>> List(string UserId);
    }
}