
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

        public async Task<List<TelecomType>> IndexGet(string UserId)
        {
            string usp = "usp_TelecomTypeIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<TelecomType, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<TelecomTypeUpdateGet> UpdateGet(string UserId, int TelecomTypeId)
        {
            string usp = "usp_TelecomTypeUpdateGet @UserId, @TelecomTypeID";
            return _sqlDataAccess.LoadSingleRecord<TelecomTypeUpdateGet, dynamic>(usp, new { UserId = UserId, TelecomTypeId = TelecomTypeId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(TelecomTypeUpdateGet TelecomType)
        {
            string usp = "usp_TelecomTypeUpdatePostCheck @TelecomTypeId, @StatusId, @ModifierId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, TelecomType);
            return ErrorMessages;
        }
        public bool UpdatePost(TelecomTypeUpdateGet TelecomType)
        {
            string usp = "usp_TelecomTypeUpdatePost @TelecomTypeId, @StatusId, @ModifierId";
            _sqlDataAccess.SaveData<TelecomTypeUpdateGet>(usp, TelecomType);
            return true;
        }

        public async Task<List<TelecomTypeList>> List(string UserId)
        {
            string usp = "usp_TelecomTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<TelecomTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
