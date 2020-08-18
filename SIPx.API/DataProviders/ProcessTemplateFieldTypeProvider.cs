
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
    public class ProcessTemplateFieldTypeProvider : IProcessTemplateFieldTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFieldTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }


        //public Task<List<ProcessTemplateFieldType>> ProcessTemplateFieldTypeIndexGet(string UserId)
        //{
        //    string usp = "usp_ProcessTemplateFieldTypeIndexGet @UserID";
        //    return _sqlDataAccess.LoadData<ProcessTemplateFieldType, dynamic>(usp, new { UserId = UserId });

        //}
        //public Task<ProcessTemplateFieldType> ProcessTemplateFieldTypeUpdateGet(string UserId, int ProcessTemplateFieldTypeId)
        //{
        //    string usp = "usp_ProcessTemplateFieldTypeUpdateGet @UserId, @ProcessTemplateFieldTypeID";
        //    return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldType, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldTypeId = ProcessTemplateFieldTypeId });

        //}

        public Task<List<ProcessTemplateFieldTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateFieldTypeList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldTypeList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
