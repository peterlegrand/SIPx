
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
    public class ProcessTemplateFlowPassProvider : IProcessTemplateFlowPassProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFlowPassProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<SequenceList>> CreateGetSequence(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowPassCreateGetSequence @UserID, @ProcessTemplateFlowId";
            var Passes = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ProcessTemplateFlowId });
            Passes.Add(new SequenceList { Sequence = Passes.Count + 1, Name = "At the end" });
            return Passes;
        }
        public async Task<List<SequenceList>> UpdateGetSequence(string UserId, int ProcessTemplateFlowPassId)
        {
            string usp = "usp_ProcessTemplateFlowPassUpdateGetSequence @UserID, @ProcessTemplateFlowPassId";
            var Passes = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ProcessTemplateFlowPassId });
            return Passes;
        }

        public Task<List<ProcessTemplateFieldList>> CreateGetFieldList(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowPassCreateGetFieldList @UserID, @ProcessTemplateFlowId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId, ProcessTemplateFlowId });
        }
        public Task<List<ProcessTemplateFieldList>> UpdateGetFieldList(string UserId, int ProcessTemplateFlowPassId)
        {
            string usp = "usp_ProcessTemplateFlowPassUpdateGetFieldList @UserID, @ProcessTemplateFlowPassId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId, ProcessTemplateFlowPassId });
        }

        public Task<List<ProcessTemplateFieldList>> CreateGetFieldRoleList(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowPassCreateGetFieldRoleList @UserID, @ProcessTemplateFlowId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId, ProcessTemplateFlowId });
        }
        public Task<List<ProcessTemplateFieldList>> UpdateGetFieldRoleList(string UserId, int ProcessTemplateFlowPassId)
        {
            string usp = "usp_ProcessTemplateFlowPassUpdateGetFieldRoleList @UserID, @ProcessTemplateFlowPassId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId, ProcessTemplateFlowPassId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateFlowPassCreateGet ProcessTemplateFlowPass)
        {
            string usp = "usp_ProcessTemplateFlowPassCreatePostCheck @ProcessTemplateFlowId, @Sequence, @ProcessTemplateFlowPassTypeId, @ProcessTemplateFieldId, @ProcessTemplateFieldIDRole, @ComparisonOperatorId, @LanguageId, @Name, @CreaterId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateFlowPass);
            return ErrorMessages;
        }

        public async Task<int> IndexGetProcessTemplateId(int ProcessTemplateFlowPassId)
        {
            string usp = "usp_processTemplateFlowPassIndexGetProcessTemplateId @ProcessTemplateFlowPassId";
            var ProcessTemplateId = await _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { ProcessTemplateFlowPassId = ProcessTemplateFlowPassId });
            return ProcessTemplateId;
        }

        public async Task<string> CreatePost(ProcessTemplateFlowPassCreateGet ProcessTemplateFlowPass)
        {
            string usp = "usp_ProcessTemplateFlowPassCreatePost @ProcessTemplateFlowId, @Sequence, @ProcessTemplateFlowPassTypeId, @ProcessTemplateFieldId, @ProcessTemplateFieldIDRole, @ComparisonOperatorId, @ProcessTemplateFlowPassString, @ProcessTemplateFlowPassInt, @ProcessTemplateFlowPassDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlowPass);
            return String;
        }

        public Task<List<ProcessTemplateFlowPassIndexGet>> IndexGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowPassIndexGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowPassIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowId = ProcessTemplateFlowId });

        }

        public Task<ProcessTemplateFlowPassUpdateGet> UpdateGet(string UserId, int ProcessTemplateFlowPassId)
        {
            string usp = "usp_ProcessTemplateFlowPassUpdateGet @UserId, @ProcessTemplateFlowPassID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowPassUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowPassId = ProcessTemplateFlowPassId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateFlowPassUpdateGet ProcessTemplateFlowPass)
        {
            string usp = "usp_ProcessTemplateFlowPassUpdatePostCheck @ProcessTemplateFlowPassId , @Sequence ,@ProcessTemplateFlowPassTypeID, @ProcessTemplateFieldID, @ProcessTemplateFieldIDRole, @ComparisonOperatorID, @ProcessTemplateFlowPassString, @ProcessTemplateFlowPassInt, @ProcessTemplateFlowPassDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateFlowPass);
            return ErrorMessages;
        }


        public bool UpdatePost(ProcessTemplateFlowPassUpdateGet ProcessTemplateFlowPass)
        {
            string usp = "usp_ProcessTemplateFlowPassUpdatePost @ProcessTemplateFlowPassId , @Sequence ,@ProcessTemplateFlowPassTypeID, @ProcessTemplateFieldID, @ProcessTemplateFieldIDRole, @ComparisonOperatorID, @ProcessTemplateFlowPassString, @ProcessTemplateFlowPassInt, @ProcessTemplateFlowPassDate, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ProcessTemplateFlowPassUpdateGet>(usp, ProcessTemplateFlowPass);
            return true;
        }

        public Task<ProcessTemplateFlowPassDeleteGet> DeleteGet(string UserId, int ProcessTemplateFlowPassId)
        {
            string usp = "usp_ProcessTemplateFlowPassDeleteGet @UserId, @ProcessTemplateFlowPassID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowPassDeleteGet, dynamic>(usp, new { UserId, ProcessTemplateFlowPassId });

        }

        public bool DeletePost(string UserId, int ProcessTemplateFlowPassId)
        {
            string usp = "usp_ProcessTemplateFlowPassDeletePost @UserId, @ProcessTemplateFlowPassID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTemplateFlowPassId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTemplateFlowPassId)
        {
            string usp = "usp_ProcessTemplateFlowPassDeletePostCheck @UserId, @ProcessTemplateFlowPassID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTemplateFlowPassId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTemplateFlowPassId });
            return ErrorMessages;
        }

        public Task<List<ProcessTemplateFlowPassLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateFlowPassId)
        {
            string usp = "usp_ProcessTemplateFlowPassLanguageIndexGet @UserId, @ProcessTemplateFlowPassID";
            return _sqlDataAccess.LoadData<ProcessTemplateFlowPassLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowPassId = ProcessTemplateFlowPassId });

        }

        public Task<ProcessTemplateFlowPassLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateFlowPassLanguageId)
        {
            string usp = "usp_ProcessTemplateFlowPassLanguageUpdateGet @UserId, @ProcessTemplateFlowPassLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowPassLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFlowPassLanguageId = ProcessTemplateFlowPassLanguageId });

        }

    }
}
