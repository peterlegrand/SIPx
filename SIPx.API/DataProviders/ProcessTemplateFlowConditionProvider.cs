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
    public class ProcessTemplateFlowConditionProvider : IProcessTemplateFlowConditionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFlowConditionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }


        public Task<List<ProcessTemplateFlowConditionLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionLanguageIndexGet @UserId, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionId = ProcessTemplateFlowConditionId });

        }
        public Task<ProcessTemplateFlowConditionLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateFlowConditionLanguageId)
        {
            string usp = "usp_ProcessTemplateFlowConditionLanguageUpdateGet @UserId, @ProcessTemplateFlowConditionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionLanguageId = ProcessTemplateFlowConditionLanguageId });

        }
        public Task<List<ProcessTemplateFlowConditionIndexGet>> IndexGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowConditionIndexGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }
        public Task<ProcessTemplateFlowConditionUpdateGet> UpdateGet(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditioUpdateGetn @UserId, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionId = ProcessTemplateFlowConditionId });

        }
        public async Task<string> CreatePostCheck(ProcessTemplateFlowConditionCreatePost ProcessTemplateFlowCondition)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreatePostCheck @ProcessTemplateFlowId, @Sequence, @ProcessTemplateFlowConditionTypeId, @ProcessTemplateFieldId, @ProcessTemplateFieldIDRole, @ComparisonOperatorId, @LanguageId, @Name, @CreaterId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlowCondition);
            return CheckString;
        }
        public async Task<string> CreatePost(ProcessTemplateFlowConditionCreatePost ProcessTemplateFlowCondition)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreatePost @ProcessTemplateFlowId, @Sequence, @ProcessTemplateFlowConditionTypeId, @ProcessTemplateFieldId, @ProcessTemplateFieldIDRole, @ComparisonOperatorId, @ProcessTemplateFlowConditionString, @ProcessTemplateFlowConditionInt, @ProcessTemplateFlowConditionDate, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreaterId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlowCondition);
            return String;
        }
        public Task<List<SequenceList>> CreateGetSequence(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreateGetSequence @UserID, @ProcessTemplateFlowId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ProcessTemplateFlowId });
        }

    }
}