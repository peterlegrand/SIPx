
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
    public class HelpProvider 
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public HelpProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<ClassificationDeleteGet> DeleteGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationDeleteGet @UserId, @classificationID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationDeleteGet, dynamic>(usp, new { UserId, ClassificationId });

        }
        }
}
