
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
    public class TelecomTypeProvider : ITelecomTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public TelecomTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public async Task<List<TelecomType>> TelecomTypeIndexGet(string UserId)
        {
            string usp = "usp_TelecomTypeIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<TelecomType, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<TelecomType> TelecomTypeUpdateGet(string UserId, int TelecomTypeId)
        {
            string usp = "usp_TelecomTypeUpdateGet @UserId, @TelecomTypeID";
            return _sqlDataAccess.LoadSingleRecord<TelecomType, dynamic>(usp, new { UserId = UserId, TelecomTypeId = TelecomTypeId });

        }
    }
}
