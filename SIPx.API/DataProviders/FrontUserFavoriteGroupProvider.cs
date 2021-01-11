
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
    public class FrontUserFavoriteGroupProvider : IFrontUserFavoriteGroupProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontUserFavoriteGroupProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<MVCFavoriteGroupList>> List(string UserId)
        {
            string usp = "usp_FrontUserFavoriteGroupList @UserID";
            return _sqlDataAccess.LoadData<MVCFavoriteGroupList, dynamic>(usp, new { UserId });
        }

    }
}
