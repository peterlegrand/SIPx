
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
    public class ProcessTypeFieldTypeProvider : IProcessTypeFieldTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeFieldTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public Task<List<ProcessTypeFieldType>> ProcessTypeFieldTypeIndexGet(string UserId)
        //{
        //    string usp = "usp_ProcessTypeFieldTypeIndexGet @UserID";
        //    return _sqlDataAccess.LoadData<ProcessTypeFieldType, dynamic>(usp, new { UserId = UserId });

        //}
        //public Task<ProcessTypeFieldType> ProcessTypeFieldTypeUpdateGet(string UserId, int ProcessTypeFieldTypeId)
        //{
        //    string usp = "usp_ProcessTypeFieldTypeUpdateGet @UserId, @ProcessTypeFieldTypeID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTypeFieldType, dynamic>(usp, new { UserId = UserId, ProcessTypeFieldTypeId = ProcessTypeFieldTypeId });

        //}

        public Task<List<ProcessTypeFieldTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTypeFieldTypeList @UserId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldTypeList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
