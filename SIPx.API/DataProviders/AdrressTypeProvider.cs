
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class AddressTypeProvider : IAddressTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public AddressTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public async Task<List<AddressType>> AddressTypeIndexGet(string UserId)
        {
            string usp = "usp_AddressTypeIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<AddressType, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<AddressType> AddressTypeUpdateGet(string UserId, int AddressTypeId)
        {
            string usp = "usp_AddressTypeUpdateGet @UserId, @AddressTypeID";
            return _sqlDataAccess.LoadSingleRecord<AddressType, dynamic>(usp, new { UserId = UserId, AddressTypeId = AddressTypeId });

        }

    }
}
