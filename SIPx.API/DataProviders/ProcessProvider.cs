
using Dapper;
using SIPx.API.Models;
using SIPx.Shared;
using System;
using System.Collections.Generic;
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
        //    var x = await _sqlDataAccess.LoadData<ClassificationViewGet, dynamic>(usp, new { LanguageID = LanguageId });
        //    return x;
        //}
        public async Task<List<int>> NewProcessGetInitialTemplateList()
        {
            string usp = "usp_NewProcessGetInitialTemplateFlowList";
            var x = await _sqlDataAccess.LoadData<int>(usp);
            return x;
        }

        public async Task<List<ProcessTemplateFlowCondition>> NewProcessGetFlowConditionList(int FlowID)
        {
            string usp = "usp_NewProcessGetFlowConditionList @FlowID";
            var x = await _sqlDataAccess.LoadData<ProcessTemplateFlowCondition, dynamic>(usp, new { FlowID = FlowID });
            return x;
        }
        public async Task<List<NewProcessFromDB>> NewProcessGet(SipUser User, int ProcessTemplateID)
        {

            string usp = "usp_NewProcessGet @UserID, @ProcessTemplateID";
            var x = await _sqlDataAccess.LoadData<NewProcessFromDB, dynamic>(usp, new { UserID = User, ProcessTemplateID = ProcessTemplateID });
            return x;
        }

        public async Task<List<NewProcessTemplateList>> NewProcessGetTemplateList(string SQLString)
        {
            var x = await _sqlDataAccess.LoadData<NewProcessTemplateList>(SQLString);
            return x;
        }
        //public async Task<List<ProcessType>> GetProcessTypes(string UserID)
        //{
        //    string usp = "usp_ProcessTypes @UserID";
        //    var x = await _sqlDataAccess.LoadData<ProcessType, dynamic>(usp, new { UserID = UserID });
        //    return x;
        //}

    }
}
