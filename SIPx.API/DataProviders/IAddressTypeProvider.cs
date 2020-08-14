using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IAddressTypeProvider
    {
        Task<List<AddressType>> AddressTypeIndexGet(string UserId);
        Task<AddressType> AddressTypeUpdateGet(string UserId, int AddressTypeId);
    }
}