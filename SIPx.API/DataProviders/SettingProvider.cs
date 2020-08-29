
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
    public class SettingProvider : ISettingProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public SettingProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<SettingIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_SettingIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<SettingIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<SettingUpdateGet> UpdateGet(string UserId, int SettingId)
        {
            string usp = "usp_SettingUpdateGet @UserId, @SettingID";
            return _sqlDataAccess.LoadSingleRecord<SettingUpdateGet, dynamic>(usp, new { UserId = UserId, SettingId = SettingId });

        }

        public bool UpdatePost(SettingUpdateGet Setting)
        {
            string usp = "usp_RoleGroupUpdatePost @SettingId, @IntValue, @StringValue, @DateTimeValue, @ModifierId";
            _sqlDataAccess.SaveData<SettingUpdateGet>(usp, Setting);
            return true;
        }
    }
}
