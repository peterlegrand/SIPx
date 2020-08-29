using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IDateLevelProvider
    {
        Task<List<DateLevelList>> List(string UserId);
    }
}