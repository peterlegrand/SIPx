using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ITelecomTypeProvider
    {
        Task<List<TelecomType>> TelecomTypeIndexGet(string UserId);
        Task<TelecomType> TelecomTypeUpdateGet(string UserId, int TelecomTypeId);
    }
}