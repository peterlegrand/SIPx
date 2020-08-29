using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ITelecomTypeProvider
    {
        Task<List<TelecomType>> IndexGet(string UserId);
        Task<TelecomTypeUpdateGet> UpdateGet(string UserId, int TelecomTypeId);
        Task<List<TelecomTypeList>> List(string UserId);
        bool UpdatePost(TelecomTypeUpdateGet TelecomType);
    }
}