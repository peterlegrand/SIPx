
using Dapper;
using SIPx.Shared;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class GenderProvider : IGenderProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public GenderProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<Gender>> IndexGet(string UserId)
        {
            string usp = "usp_GenderIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<Gender, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<Gender> UpdateGet(string UserId, int GenderId)
        {
            string usp = "usp_GenderUpdateGet @UserId, @GenderID";
            return _sqlDataAccess.LoadSingleRecord<Gender, dynamic>(usp, new { UserId = UserId, GenderId = GenderId });

        }

        public bool UpdatePost(GenderUpdateGet Gender)
        {
            string usp = "usp_GenderUpdatePost @GenderId, Active , @ModifierId";
            _sqlDataAccess.SaveData<GenderUpdateGet>(usp, Gender);
            return true;
        }

        public Task<List<Gender>> Active(string UserId)
        {
            string usp = "usp_GendersActive @UserID";
            return _sqlDataAccess.LoadData<Gender, dynamic>(usp, new { UserId = UserId });

        }

        public Task<List<GenderList>> List(string UserId)
        {
            string usp = "usp_GenderList @UserID";
            return _sqlDataAccess.LoadData<GenderList, dynamic>(usp, new { UserId = UserId });
        }
    }
}
