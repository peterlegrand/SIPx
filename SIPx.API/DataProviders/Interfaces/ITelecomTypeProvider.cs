using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ITelecomTypeProvider
    {
        Task<List<TelecomType>> IndexGet(string UserId);
        Task<TelecomType> UpdateGet(string UserId, int TelecomTypeId);
    }
}