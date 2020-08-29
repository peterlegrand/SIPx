using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IAddressTypeProvider
    {
        Task<List<AddressType>> IndexGet(string UserId);
        Task<AddressTypeUpdateGet> UpdateGet(string UserId, int AddressTypeId);
        bool UpdatePost(AddressTypeUpdateGet AddressType);
        Task<List<AddressTypeList>> List(string UserId);
    }
}