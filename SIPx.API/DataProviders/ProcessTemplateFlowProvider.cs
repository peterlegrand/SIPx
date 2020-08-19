﻿
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
    public class ProcessTemplateFlowProvider : IProcessTemplateFlowProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFlowProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTemplateFlowLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowLanguageIndexGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<ProcessTemplateFlowLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateFlowLanguageId)
        {
            string usp = "usp_ProcessTemplateFlowLanguageUpdateGet @UserId, @ProcessTemplateFlowLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowLanguageId = ProcessTemplateFlowLanguageId });

        }
        public Task<List<ProcessTemplateFlowIndexGet>> IndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFlowIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateFlowUpdateGet> UpdateGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowUpdateGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<List<ProcessTemplateStageList>> UpdateGetStageList(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowUpdateGetStageList @UserId, @ProcessTemplateFlowId";
            return _sqlDataAccess.LoadData<ProcessTemplateStageList, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }

        public async Task<string> CreatePostCheck(ProcessTemplateFlowCreatePost ProcessTemplateFlow)
        {
            string usp = "usp_ProcessTemplateFlowCreatePostCheck @ProcessTemplateId, @ProcessTemplateFromStageId, @ProcessTemplateToStageId, @LanguageId, @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlow);
            return CheckString;
        }
        public async Task<string> CreatePost(ProcessTemplateFlowCreatePost ProcessTemplateFlow)
        {
            string usp = "usp_ProcessTemplateFlowCreatePost @ProcessTemplateId, @ProcessTemplateFromStageId, @ProcessTemplateToStageId, @OnTheFly, @Alhpabetically, @CanLink, @InDropDow, @InMenu, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlow);
            return String;
        }
    }
}