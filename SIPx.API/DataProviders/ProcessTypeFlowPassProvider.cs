
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
    public class ProcessTypeFlowPassProvider : IProcessTypeFlowPassProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeFlowPassProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<SequenceList>> CreateGetSequence(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowPassCreateGetSequence @UserID, @ProcessTypeFlowId";
            var Passes = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ProcessTypeFlowId });
            Passes.Add(new SequenceList { Sequence = Passes.Count + 1, Name = "At the end" });
            return Passes;
        }
        public async Task<List<SequenceList>> UpdateGetSequence(string UserId, int ProcessTypeFlowPassId)
        {
            string usp = "usp_ProcessTypeFlowPassUpdateGetSequence @UserID, @ProcessTypeFlowPassId";
            var Passes = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ProcessTypeFlowPassId });
            return Passes;
        }

        public Task<List<ProcessTypeFieldList>> CreateGetFieldList(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowPassCreateGetFieldList @UserID, @ProcessTypeFlowId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId, ProcessTypeFlowId });
        }
        public Task<List<ProcessTypeFieldList>> UpdateGetFieldList(string UserId, int ProcessTypeFlowPassId)
        {
            string usp = "usp_ProcessTypeFlowPassUpdateGetFieldList @UserID, @ProcessTypeFlowPassId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId, ProcessTypeFlowPassId });
        }

        public Task<List<ProcessTypeFieldList>> CreateGetFieldRoleList(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowPassCreateGetFieldRoleList @UserID, @ProcessTypeFlowId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId, ProcessTypeFlowId });
        }
        public Task<List<ProcessTypeFieldList>> UpdateGetFieldRoleList(string UserId, int ProcessTypeFlowPassId)
        {
            string usp = "usp_ProcessTypeFlowPassUpdateGetFieldRoleList @UserID, @ProcessTypeFlowPassId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId, ProcessTypeFlowPassId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeFlowPassCreateGet ProcessTypeFlowPass)
        {
            string usp = "usp_ProcessTypeFlowPassCreatePostCheck @ProcessTypeFlowId, @Sequence, @ProcessTypeFlowPassTypeId, @ProcessTypeFieldId, @ProcessTypeFieldIDRole, @ComparisonOperatorId, @LanguageId, @Name, @CreaterId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeFlowPass);
            return ErrorMessages;
        }

        public async Task<int> IndexGetProcessTypeId(int ProcessTypeFlowPassId)
        {
            string usp = "usp_processTypeFlowPassIndexGetProcessTypeId @ProcessTypeFlowPassId";
            var ProcessTypeId = await _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { ProcessTypeFlowPassId = ProcessTypeFlowPassId });
            return ProcessTypeId;
        }

        public async Task<string> CreatePost(ProcessTypeFlowPassCreateGet ProcessTypeFlowPass)
        {
            string usp = "usp_ProcessTypeFlowPassCreatePost @ProcessTypeFlowId, @Sequence, @ProcessTypeFlowPassTypeId, @ProcessTypeFieldId, @ProcessTypeFieldIDRole, @ComparisonOperatorId, @ProcessTypeFlowPassString, @ProcessTypeFlowPassInt, @ProcessTypeFlowPassDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTypeFlowPass);
            return String;
        }

        public Task<List<ProcessTypeFlowPassIndexGet>> IndexGet(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowPassIndexGet @UserId, @ProcessTypeFlowID";
            return _sqlDataAccess.LoadData<ProcessTypeFlowPassIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowId = ProcessTypeFlowId });

        }

        public Task<ProcessTypeFlowPassUpdateGet> UpdateGet(string UserId, int ProcessTypeFlowPassId)
        {
            string usp = "usp_ProcessTypeFlowPassUpdateGet @UserId, @ProcessTypeFlowPassID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowPassUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowPassId = ProcessTypeFlowPassId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeFlowPassUpdateGet ProcessTypeFlowPass)
        {
            string usp = "usp_ProcessTypeFlowPassUpdatePostCheck @ProcessTypeFlowPassId , @Sequence ,@ProcessTypeFlowPassTypeID, @ProcessTypeFieldID, @ProcessTypeFieldIDRole, @ComparisonOperatorID, @ProcessTypeFlowPassString, @ProcessTypeFlowPassInt, @ProcessTypeFlowPassDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeFlowPass);
            return ErrorMessages;
        }


        public bool UpdatePost(ProcessTypeFlowPassUpdateGet ProcessTypeFlowPass)
        {
            string usp = "usp_ProcessTypeFlowPassUpdatePost @ProcessTypeFlowPassId , @Sequence ,@ProcessTypeFlowPassTypeID, @ProcessTypeFieldID, @ProcessTypeFieldIDRole, @ComparisonOperatorID, @ProcessTypeFlowPassString, @ProcessTypeFlowPassInt, @ProcessTypeFlowPassDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ProcessTypeFlowPassUpdateGet>(usp, ProcessTypeFlowPass);
            return true;
        }

        public Task<ProcessTypeFlowPassDeleteGet> DeleteGet(string UserId, int ProcessTypeFlowPassId)
        {
            string usp = "usp_ProcessTypeFlowPassDeleteGet @UserId, @ProcessTypeFlowPassID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowPassDeleteGet, dynamic>(usp, new { UserId, ProcessTypeFlowPassId });

        }

        public bool DeletePost(string UserId, int ProcessTypeFlowPassId)
        {
            string usp = "usp_ProcessTypeFlowPassDeletePost @UserId, @ProcessTypeFlowPassID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTypeFlowPassId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeFlowPassId)
        {
            string usp = "usp_ProcessTypeFlowPassDeletePostCheck @UserId, @ProcessTypeFlowPassID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTypeFlowPassId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTypeFlowPassId });
            return ErrorMessages;
        }

        public Task<List<ProcessTypeFlowPassLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeFlowPassId)
        {
            string usp = "usp_ProcessTypeFlowPassLanguageIndexGet @UserId, @ProcessTypeFlowPassID";
            return _sqlDataAccess.LoadData<ProcessTypeFlowPassLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowPassId = ProcessTypeFlowPassId });

        }

        public Task<ProcessTypeFlowPassLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeFlowPassLanguageId)
        {
            string usp = "usp_ProcessTypeFlowPassLanguageUpdateGet @UserId, @ProcessTypeFlowPassLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowPassLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowPassLanguageId = ProcessTypeFlowPassLanguageId });

        }

    }
}
