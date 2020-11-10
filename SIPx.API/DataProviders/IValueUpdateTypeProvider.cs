using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IValueUpdateTypeProvider
    {
        Task<List<ValueUpdateTypeList>> List(string UserId);
    }
}