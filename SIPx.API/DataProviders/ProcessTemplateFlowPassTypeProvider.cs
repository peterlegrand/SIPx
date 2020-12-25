
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
    public class ProcessTemplateFlowPassTypeProvider : IProcessTemplateFlowPassTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFlowPassTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTemplateFlowPassTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateFlowPassTypeList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowPassTypeList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
