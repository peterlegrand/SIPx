
using Dapper;
using Microsoft.AspNetCore.Mvc;
using SIPx.API.Models;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class ProcessProvider : IProcessProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public async Task<List<ClassificationViewGet>> GetClassifications(int LanguageId)
        //{
        //    string usp = "usp_ClassificationViewGet @LanguageID";
        //    var x = await _sqlDataAccess.LoadData<ClassificationViewGet, dynamic>(usp, new { LanguageId = LanguageId });
        //    return x;
        //}
        public async Task<List<int>> NewProcessGetInitialTemplateList()
        {
            string usp = "usp_NewProcessGetInitialTemplateFlowList";
            var x = await _sqlDataAccess.LoadData<int>(usp);
            return x;
        }

        public async Task<List<ProcessTemplateFlowCondition>> NewProcessGetFlowConditionList(int FlowId)
        {
            string usp = "usp_NewProcessGetFlowConditionList @FlowID";
            var x = await _sqlDataAccess.LoadData<ProcessTemplateFlowCondition, dynamic>(usp, new { FlowId = FlowId });
            return x;
        }
        public async Task<List<NewProcessFromDB>> NewProcessGet(SipUser User, int ProcessTemplateId)
        {

            string usp = "usp_NewProcessGet @ProcessTemplateID";
            var x = await _sqlDataAccess.LoadData<NewProcessFromDB, dynamic>(usp, new { ProcessTemplateId = ProcessTemplateId });
            return x;
        }

        public async Task<List<NewProcessTemplateList>> NewProcessGetTemplateList(string SQLString)
        {
            var x = await _sqlDataAccess.LoadData<NewProcessTemplateList>(SQLString);
            return x;
        }

        public async Task<bool> NewProcessInsert(string SQLString, string UserId, int TemplateId, int StageId, DataTable Fields)
        {
            await _sqlDataAccess.SaveData2<dynamic>(SQLString, new  { User = UserId, ProcessTemplateId = TemplateId, ProcessTemplateStageId = StageId, FieldsTable = Fields.AsTableValuedParameter("udt_ProcessFieldsNew") });
            return true;
        }

        
 
        //public async Task<List<ProcessType>> GetProcessTypes(string UserId)
        //{
        //    string usp = "usp_ProcessTypes @UserID";
        //    var x = await _sqlDataAccess.LoadData<ProcessType, dynamic>(usp, new { UserId = UserId });
        //    return x;
        //}

    }
}
