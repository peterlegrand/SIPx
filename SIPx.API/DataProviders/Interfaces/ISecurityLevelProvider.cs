using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ISecurityLevelProvider
    {
        Task<List<SecurityLevelIndexGet>> SecurityLevelIndexGet(string UserId);
        Task<SecurityLevelUpdateGet> SecurityLevelUpdateGet(string UserId, int SecurityLevelId);
        Task<List<SecurityLevelList>> SecurityLevelList(string UserId);
    }
}