using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IMVCUIScreenProvider
    {
        Task<List<MVCUIScreenIndexGet>> IndexGet(string UserId);
    }
}