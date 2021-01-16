
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
    public class LogProvider : ILogProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public LogProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public async Task<List<ReadLogGet>> ReadLogGet(ReadLogParameters ReadLogParameters)
        {
            string usp = "usp_readlogGrid @ControllerName, @ActionName, @IsIntRecordId, @stringRecordId, @IntRecordId ";
            var ReadLog = await _sqlDataAccess.LoadData<ReadLogGet, dynamic>(usp, ReadLogParameters);
            return ReadLog;
        }


    }
}
