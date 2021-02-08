using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IObjectTypePropertyStatus
    {
        Task<List<ObjectTypePropertyStatusList>> List(string UserId);
    }
}