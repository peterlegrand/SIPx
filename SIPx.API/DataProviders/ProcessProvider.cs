﻿
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
        public async Task<List<FrontProcessTypeIdFlowId>> CreateGetInitialTemplateFlowList()
        {
            string usp = "usp_NewProcessGetInitialTemplateFlowList";
            var x = await _sqlDataAccess.LoadData<FrontProcessTypeIdFlowId>(usp);
            return x;
        }


        public async Task<List<FrontProcessProcessTypeFlowConditions>> CreateGetInitialTemplateFlowConditionList(int ProcessTypeFlowId)
        {
            string usp = "usp_NewProcessGetFlowConditionList @ProcessTypeFlowId";
            var x = await _sqlDataAccess.LoadData<FrontProcessProcessTypeFlowConditions, dynamic>(usp, new { ProcessTypeFlowId = ProcessTypeFlowId });
            return x;
        }

        public async Task<List<FrontProcessNewProcessField>> CreateGet(string UserId, int ProcessTypeId)
        {

            string usp = "usp_NewProcessGet @ProcessTypeID, @UserId";
            var x = await _sqlDataAccess.LoadData<FrontProcessNewProcessField, dynamic>(usp, new { UserId = UserId, ProcessTypeId = ProcessTypeId });
            return x;
        }
        //PETER TODO PostCheck added

        public async Task<bool> CreatePost(string SQLString, string UserId, int TemplateId, int StageId, DataTable Fields)
        {
            await _sqlDataAccess.SaveData2<dynamic>(SQLString, new { User = UserId, ProcessTypeId = TemplateId, ProcessTypeStageId = StageId, FieldsTable = Fields.AsTableValuedParameter("udt_ProcessFieldsNew") });
            return true;
        }

        public Task<ProcessDeleteGet> DeleteGet(string UserId, int ProcessId)
        {
            string usp = "usp_ProcessDeleteGet @UserId, @ProcessID";
            return _sqlDataAccess.LoadSingleRecord<ProcessDeleteGet, dynamic>(usp, new { UserId, ProcessId });

        }

        public bool DeletePost(string UserId, int ProcessId)
        {
            string usp = "usp_ProcessDeletePost @UserId, @ProcessID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessId)
        {
            string usp = "usp_ProcessDeletePostCheck @UserId, @ProcessID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessId });
            return ErrorMessages;
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
            string usp = "usp_ProcessAdvancedSearch @UserId, @Contains, @Number, @DateFrom, @DateTo, @SelectedUserId, @OrganizationId, @ProjectId, @LanguageId, @ClassificationId, @ClassificationValueId, @ContentId, @CountryId, @SecurityLevelId, @RoleId, @PersonId, @ProcessTypeStageTypeId ";
            return _sqlDataAccess.LoadData<ProcessAdvancedSearchResult, dynamic>(usp, AdvancedSearch);
        }

        public async Task<List<ProcessForPanel>> Panel(string UserId, string ProcessConditionSQLFrom, string ProcessConditionSQLWhere, string ProcessConditionSQLContains)
        {
            string usp = "usp_ProcessForPanel @UserId, @ProcessConditionSQLFrom, @ProcessConditionSQLWhere,@ProcessConditionSQLContains ";
            var x = await _sqlDataAccess.LoadData<ProcessForPanel, dynamic>(usp, new { UserId = UserId, ProcessConditionSQLFrom = ProcessConditionSQLFrom, ProcessConditionSQLWhere = ProcessConditionSQLWhere, ProcessConditionSQLContains = ProcessConditionSQLContains });
            return x;
        }
        public async Task<List<ProcessForPanelCondition>> PanelCondition(int PageSectionId)
        {
            string usp = "usp_ProcessForPanelCondition @PageSectionId";
            var x = await _sqlDataAccess.LoadData<ProcessForPanelCondition, dynamic>(usp, new { PageSectionId = PageSectionId });
            return x;
        }
    }
}
