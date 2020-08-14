using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPartialProvider
    {
        Task<List<PartialLeftUserMenu>> PartialLeftUserMenu(string UserId);
    }
}