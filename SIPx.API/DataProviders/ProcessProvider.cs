
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

        public async Task<List<ToDoIndexGet>> ToDoIndexGet(string SQLString)
        {
            var x = await _sqlDataAccess.LoadData<ToDoIndexGet>(SQLString);
            return x;
        }

        //public async Task<List<ProcessViewGet>> GetProcesss(int LanguageId)
        //{
        //    string usp = "usp_ProcessViewGet @LanguageID";
        //    var x = await _sqlDataAccess.LoadData<ProcessViewGet, dynamic>(usp, new { LanguageId = LanguageId });
        //    return x;
        //}
        public async Task<List<FrontProcessTemplateIdFlowId>> CreateGetInitialTemplateFlowList()
        {
            string usp = "usp_NewProcessGetInitialTemplateFlowList";
            var x = await _sqlDataAccess.LoadData<FrontProcessTemplateIdFlowId>(usp);
            return x;
        }


        public async Task<List<FrontProcessProcessTemplateFlowConditions>> CreateGetInitialTemplateFlowConditionList(int ProcessTemplateFlowId)
        {
            string usp = "usp_NewProcessGetFlowConditionList @ProcessTemplateFlowId";
            var x = await _sqlDataAccess.LoadData<FrontProcessProcessTemplateFlowConditions, dynamic>(usp, new { ProcessTemplateFlowId = ProcessTemplateFlowId });
            return x;
        }

        public async Task<List<FrontProcessNewProcessField>> CreateGet(string UserId, int ProcessTemplateId)
        {

            string usp = "usp_NewProcessGet @ProcessTemplateID, @UserId";
            var x = await _sqlDataAccess.LoadData<FrontProcessNewProcessField, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });
            return x;
        }

        public async Task<bool> CreatePost(string SQLString, string UserId, int TemplateId, int StageId, DataTable Fields)
        {
            await _sqlDataAccess.SaveData2<dynamic>(SQLString, new { User = UserId, ProcessTemplateId = TemplateId, ProcessTemplateStageId = StageId, FieldsTable = Fields.AsTableValuedParameter("udt_ProcessFieldsNew") });
            return true;
        }

        public async Task<List<NewProcessTemplateList>> CreateGetTemplateList(string SQLString)
        {
            var x = await _sqlDataAccess.LoadData<NewProcessTemplateList>(SQLString);
            return x;
        }

        public Task<ProcessDeleteGet> DeleteGet(string UserId, int ProcessId)
        {
            string usp = "usp_ProcessDeleteGet @UserId, @ProcessID";
            return _sqlDataAccess.LoadSingleRecord<ProcessDeleteGet, dynamic>(usp, new { UserId, ProcessId });

        }

        public bool DeletePost(int ProcessId)
        {
            string usp = "usp_ProcessDeletePost @ProcessId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ProcessId = ProcessId });
            return true;
        }

        public Task<List<ProcessSearch>> Search(string Contains, string UserId)
        {
            string usp = "usp_ProcessSearch @Contains, @UserId";
            return _sqlDataAccess.LoadData<ProcessSearch, dynamic>(usp, new { Contains, UserId });

        }
        //public async Task<List<ProcessType>> GetProcessTypes(string UserId)
        //{
        //    string usp = "usp_ProcessTypes @UserID";
        //    var x = await _sqlDataAccess.LoadData<ProcessType, dynamic>(usp, new { UserId = UserId });
        //    return x;
        //}
        public Task<List<ProcessAdvancedSearchResult>> AdvancedSearch(string UserId, ProcessAdvancedSearchPost AdvancedSearch)
        {
            string usp = "usp_ProcessAdvancedSearch @UserId, @Contains, @Number, @DateFrom, @DateTo, @SelectedUserId, @OrganizationId, @ProjectId, @LanguageId, @ClassificationId, @ClassificationValueId, @ContentId, @CountryId, @SecurityLevelId, @RoleId, @PersonId, @ProcessTemplateStageTypeId ";
            return _sqlDataAccess.LoadData<ProcessAdvancedSearchResult, dynamic>(usp,  AdvancedSearch );
        }

    }
}
