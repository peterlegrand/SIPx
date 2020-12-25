
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
    public class ProcessTemplateStageFieldStatusProvider : IProcessTemplateStageFieldStatusProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateStageFieldStatusProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

   
        public Task<List<ProcessTemplateStageFieldStatusList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateStageFieldStatusList @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageFieldStatusList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
