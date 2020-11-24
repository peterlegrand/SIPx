
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
    public class ClassificationLevelPropertyStatusProvider : IClassificationLevelPropertyStatusProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationLevelPropertyStatusProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public Task<List<ClassificationLevelPropertyStatusList>> List(string UserId)
        {
            string usp = "usp_ClassificationLevelPropertyStatusList @UserID";
            return _sqlDataAccess.LoadData<ClassificationLevelPropertyStatusList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
