
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

        public async Task<List<SequenceList>> CreateGetSequence(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreateGetSequence @UserID, @ProcessTemplateFlowId";
            var Conditions = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ProcessTemplateFlowId });
            Conditions.Add(new SequenceList { Sequence = Conditions.Count + 1, Name = "At the end" });
            return Conditions;
        }
        public async Task<List<SequenceList>> UpdateGetSequence(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionUpdateGetSequence @UserID, @ProcessTemplateFlowConditionId";
            var Conditions = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ProcessTemplateFlowConditionId });
            return Conditions;
        }

        public Task<List<ProcessTemplateFieldList>> CreateGetFieldList(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreateGetFieldList @UserID, @ProcessTemplateFlowId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId, ProcessTemplateFlowId });
        }
        public Task<List<ProcessTemplateFieldList>> UpdateGetFieldList(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionUpdateGetFieldList @UserID, @ProcessTemplateFlowConditionId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId, ProcessTemplateFlowConditionId });
        }

        public Task<List<ProcessTemplateFieldList>> CreateGetFieldRoleList(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreateGetFieldRoleList @UserID, @ProcessTemplateFlowId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId, ProcessTemplateFlowId });
        }
        public Task<List<ProcessTemplateFieldList>> UpdateGetFieldRoleList(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionUpdateGetFieldRoleList @UserID, @ProcessTemplateFlowConditionId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId, ProcessTemplateFlowConditionId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateFlowConditionCreateGet ProcessTemplateFlowCondition)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreatePostCheck @ProcessTemplateFlowId, @Sequence, @ProcessTemplateFlowConditionTypeId, @ProcessTemplateFieldId, @ProcessTemplateFieldIDRole, @ComparisonOperatorId, @Name, @CreaterId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateFlowCondition);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTemplateFlowConditionCreateGet ProcessTemplateFlowCondition)
        {
            string usp = "usp_ProcessTemplateFlowConditionCreatePost @ProcessTemplateFlowId, @Sequence, @ProcessTemplateFlowConditionTypeId, @ProcessTemplateFieldId, @ProcessTemplateFieldIDRole, @ComparisonOperatorId, @ProcessTemplateFlowConditionString, @ProcessTemplateFlowConditionInt, @ProcessTemplateFlowConditionDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlowCondition);
            return String;
        }

        public Task<List<ProcessTemplateFlowConditionIndexGet>> IndexGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowConditionIndexGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowConditionIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }

        public Task<ProcessTemplateFlowConditionUpdateGet> UpdateGet(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionUpdateGet @UserId, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowConditionId = ProcessTemplateFlowConditionId });

        }


        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateFlowConditionUpdateGet ProcessTemplateFlowCondition)
        {
            string usp = "usp_ProcessTemplateFlowConditionUpdatePostCheck @ProcessTemplateFlowConditionId , @Sequence ,@ProcessTemplateFlowConditionTypeID, @ProcessTemplateFieldID, @ProcessTemplateFieldIDRole, @ComparisonOperatorID, @ProcessTemplateFlowConditionString, @ProcessTemplateFlowConditionInt, @ProcessTemplateFlowConditionDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateFlowCondition);
            return ErrorMessages;
        }

        public bool UpdatePost(ProcessTemplateFlowConditionUpdateGet ProcessTemplateFlowCondition)
        {
            string usp = "usp_ProcessTemplateFlowConditionUpdatePost @ProcessTemplateFlowConditionId , @Sequence ,@ProcessTemplateFlowConditionTypeID, @ProcessTemplateFieldID, @ProcessTemplateFieldIDRole, @ComparisonOperatorID, @ProcessTemplateFlowConditionString, @ProcessTemplateFlowConditionInt, @ProcessTemplateFlowConditionDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ProcessTemplateFlowConditionUpdateGet>(usp, ProcessTemplateFlowCondition);
            return true;
        }

        public Task<ProcessTemplateFlowConditionDeleteGet> DeleteGet(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionDeleteGet @UserId, @ProcessTemplateFlowConditionID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowConditionDeleteGet, dynamic>(usp, new { UserId, ProcessTemplateFlowConditionId });

        }

        public bool DeletePost(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionDeletePost @@UserId, @ProcessTemplateFlowConditionID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTemplateFlowConditionId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTemplateFlowConditionId)
        {
            string usp = "usp_ProcessTemplateFlowConditionDeletePostCheck @@UserId, @ProcessTemplateFlowConditionID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTemplateFlowConditionId });
            return ErrorMessages;
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

    }
}
