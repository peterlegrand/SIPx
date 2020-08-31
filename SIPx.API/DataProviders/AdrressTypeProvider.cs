
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

        public async Task<List<AddressTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_AddressTypeIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<AddressTypeIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<AddressTypeUpdateGet> UpdateGet(string UserId, int AddressTypeId)
        {
            string usp = "usp_AddressTypeUpdateGet @UserId, @AddressTypeID";
            return _sqlDataAccess.LoadSingleRecord<AddressTypeUpdateGet, dynamic>(usp, new { UserId = UserId, AddressTypeId = AddressTypeId });

        }

        public bool UpdatePost(AddressTypeUpdateGet AddressType)
        {
            string usp = "usp_AddressTypeUpdatePost @AddressTypeId, @StatusId, @ModifierId";
            _sqlDataAccess.SaveData<AddressTypeUpdateGet>(usp, AddressType);
            return true;
        }

        public async Task<List<AddressTypeList>> List(string UserId)
        {
            string usp = "usp_AddressTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<AddressTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
