
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
    public class ProcessTypeStageFieldStatusProvider : IProcessTypeStageFieldStatusProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeStageFieldStatusProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

   
        public Task<List<ProcessTypeStageFieldStatusList>> List(string UserId)
        {
            string usp = "usp_ProcessTypeStageFieldStatusList @UserID";
            return _sqlDataAccess.LoadData<ProcessTypeStageFieldStatusList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
