using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPropertyStatusProvider
    {
        Task<List<PropertyStatusList>> List(string UserId);
    }
}