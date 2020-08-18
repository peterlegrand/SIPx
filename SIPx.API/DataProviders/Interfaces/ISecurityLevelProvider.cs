using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ISecurityLevelProvider
    {
        Task<List<SecurityLevelList>> List(string UserId);
    }
}