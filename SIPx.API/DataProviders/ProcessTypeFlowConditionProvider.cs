
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
    public class ProcessTypeFlowConditionProvider : IProcessTypeFlowConditionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeFlowConditionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<SequenceList>> CreateGetSequence(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowConditionCreateGetSequence @UserID, @ProcessTypeFlowId";
            var Conditions = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ProcessTypeFlowId });
            Conditions.Add(new SequenceList { Sequence = Conditions.Count + 1, Name = "At the end" });
            return Conditions;
        }
        public async Task<List<SequenceList>> UpdateGetSequence(string UserId, int ProcessTypeFlowConditionId)
        {
            string usp = "usp_ProcessTypeFlowConditionUpdateGetSequence @UserID, @ProcessTypeFlowConditionId";
            var Conditions = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ProcessTypeFlowConditionId });
            return Conditions;
        }

        public Task<List<ProcessTypeFieldList>> CreateGetFieldList(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowConditionCreateGetFieldList @UserID, @ProcessTypeFlowId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId, ProcessTypeFlowId });
        }
        public Task<List<ProcessTypeFieldList>> UpdateGetFieldList(string UserId, int ProcessTypeFlowConditionId)
        {
            string usp = "usp_ProcessTypeFlowConditionUpdateGetFieldList @UserID, @ProcessTypeFlowConditionId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId, ProcessTypeFlowConditionId });
        }

        public Task<List<ProcessTypeFieldList>> CreateGetFieldRoleList(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowConditionCreateGetFieldRoleList @UserID, @ProcessTypeFlowId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId, ProcessTypeFlowId });
        }
        public Task<List<ProcessTypeFieldList>> UpdateGetFieldRoleList(string UserId, int ProcessTypeFlowConditionId)
        {
            string usp = "usp_ProcessTypeFlowConditionUpdateGetFieldRoleList @UserID, @ProcessTypeFlowConditionId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId, ProcessTypeFlowConditionId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeFlowConditionCreateGet ProcessTypeFlowCondition)
        {
            string usp = "usp_ProcessTypeFlowConditionCreatePostCheck @ProcessTypeFlowId, @Sequence, @ProcessTypeFlowConditionTypeId, @ProcessTypeFieldId, @ProcessTypeFieldIDRole, @ComparisonOperatorId, @Name, @CreaterId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeFlowCondition);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTypeFlowConditionCreateGet ProcessTypeFlowCondition)
        {
            string usp = "usp_ProcessTypeFlowConditionCreatePost @ProcessTypeFlowId, @Sequence, @ProcessTypeFlowConditionTypeId, @ProcessTypeFieldId, @ProcessTypeFieldIDRole, @ComparisonOperatorId, @ProcessTypeFlowConditionString, @ProcessTypeFlowConditionInt, @ProcessTypeFlowConditionDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTypeFlowCondition);
            return String;
        }

        public Task<List<ProcessTypeFlowConditionIndexGet>> IndexGet(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowConditionIndexGet @UserId, @ProcessTypeFlowID";
            return _sqlDataAccess.LoadData<ProcessTypeFlowConditionIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowId = ProcessTypeFlowId });

        }

        public Task<ProcessTypeFlowConditionUpdateGet> UpdateGet(string UserId, int ProcessTypeFlowConditionId)
        {
            string usp = "usp_ProcessTypeFlowConditionUpdateGet @UserId, @ProcessTypeFlowConditionID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowConditionUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowConditionId = ProcessTypeFlowConditionId });

        }


        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeFlowConditionUpdateGet ProcessTypeFlowCondition)
        {
            string usp = "usp_ProcessTypeFlowConditionUpdatePostCheck @ProcessTypeFlowConditionId , @Sequence ,@ProcessTypeFlowConditionTypeID, @ProcessTypeFieldID, @ProcessTypeFieldIDRole, @ComparisonOperatorID, @ProcessTypeFlowConditionString, @ProcessTypeFlowConditionInt, @ProcessTypeFlowConditionDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeFlowCondition);
            return ErrorMessages;
        }

        public bool UpdatePost(ProcessTypeFlowConditionUpdateGet ProcessTypeFlowCondition)
        {
            string usp = "usp_ProcessTypeFlowConditionUpdatePost @ProcessTypeFlowConditionId , @Sequence ,@ProcessTypeFlowConditionTypeID, @ProcessTypeFieldID, @ProcessTypeFieldIDRole, @ComparisonOperatorID, @ProcessTypeFlowConditionString, @ProcessTypeFlowConditionInt, @ProcessTypeFlowConditionDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ProcessTypeFlowConditionUpdateGet>(usp, ProcessTypeFlowCondition);
            return true;
        }

        public Task<ProcessTypeFlowConditionDeleteGet> DeleteGet(string UserId, int ProcessTypeFlowConditionId)
        {
            string usp = "usp_ProcessTypeFlowConditionDeleteGet @UserId, @ProcessTypeFlowConditionID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowConditionDeleteGet, dynamic>(usp, new { UserId, ProcessTypeFlowConditionId });

        }

        public bool DeletePost(string UserId, int ProcessTypeFlowConditionId)
        {
            string usp = "usp_ProcessTypeFlowConditionDeletePost @@UserId, @ProcessTypeFlowConditionID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTypeFlowConditionId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeFlowConditionId)
        {
            string usp = "usp_ProcessTypeFlowConditionDeletePostCheck @@UserId, @ProcessTypeFlowConditionID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTypeFlowConditionId });
            return ErrorMessages;
        }

        public Task<List<ProcessTypeFlowConditionLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeFlowConditionId)
        {
            string usp = "usp_ProcessTypeFlowConditionLanguageIndexGet @UserId, @ProcessTypeFlowConditionID";
            return _sqlDataAccess.LoadData<ProcessTypeFlowConditionLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowConditionId = ProcessTypeFlowConditionId });

        }

        public Task<ProcessTypeFlowConditionLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeFlowConditionLanguageId)
        {
            string usp = "usp_ProcessTypeFlowConditionLanguageUpdateGet @UserId, @ProcessTypeFlowConditionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowConditionLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowConditionLanguageId = ProcessTypeFlowConditionLanguageId });

        }

    }
}
