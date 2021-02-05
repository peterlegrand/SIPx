
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
    public class ProcessTypeFlowProvider : IProcessTypeFlowProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeFlowProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeFlowCreateGet ProcessTypeFlow)
        {
            string usp = "usp_ProcessTypeFlowCreatePostCheck @ProcessTypeId, @ProcessTypeFromStageId, @ProcessTypeToStageId, @Name, @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeFlow);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTypeFlowCreateGet ProcessTypeFlow)
        {
            string usp = "usp_ProcessTypeFlowCreatePost @ProcessTypeId, @ProcessTypeFromStageId, @ProcessTypeToStageId, @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTypeFlow);
            return String;
        }

        public Task<List<ProcessTypeFlowIndexGet>> IndexGet(string UserId, int ProcessTypeId)
        {
            string usp = "usp_ProcessTypeFlowIndexGet @UserId, @ProcessTypeID";
            return _sqlDataAccess.LoadData<ProcessTypeFlowIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeId = ProcessTypeId });

        }

        public Task<ProcessTypeFlowUpdateGet> UpdateGet(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowUpdateGet @UserId, @ProcessTypeFlowID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowId = ProcessTypeFlowId });

        }

        public Task<List<ProcessTypeStageList>> UpdateGetStageList(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowUpdateGetStageList @UserId, @ProcessTypeFlowId";
            return _sqlDataAccess.LoadData<ProcessTypeStageList, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowId = ProcessTypeFlowId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeFlowUpdateGet ProcessTypeFlow)
        {
            string usp = "usp_ProcessTypeFlowUpdatePostCheck @ProcessTypeFlowId , @ProcessTypeFromStageId ,@ProcessTypeToStageId, @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeFlow);
            return ErrorMessages;
        }

        public bool UpdatePost(ProcessTypeFlowUpdateGet ProcessTypeFlow)
        {
            string usp = "usp_ProcessTypeFlowUpdatePost @ProcessTypeFlowId , @ProcessTypeFromStageId ,@ProcessTypeToStageId, @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<ProcessTypeFlowUpdateGet>(usp, ProcessTypeFlow);
            return true;
        }

        public Task<ProcessTypeFlowDeleteGet> DeleteGet(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowDeleteGet @UserId, @ProcessTypeFlowID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowDeleteGet, dynamic>(usp, new { UserId, ProcessTypeFlowId });

        }

        public bool DeletePost(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowDeletePost @UserId, @ProcessTypeFlowID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTypeFlowId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowDeletePostCheck @UserId, @ProcessTypeFlowID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTypeFlowId });
            return ErrorMessages;
        }

        public Task<List<ProcessTypeFlowLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeFlowId)
        {
            string usp = "usp_ProcessTypeFlowLanguageIndexGet @UserId, @ProcessTypeFlowID";
            return _sqlDataAccess.LoadData<ProcessTypeFlowLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowId = ProcessTypeFlowId });

        }

        public Task<ProcessTypeFlowLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeFlowLanguageId)
        {
            string usp = "usp_ProcessTypeFlowLanguageUpdateGet @UserId, @ProcessTypeFlowLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFlowLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFlowLanguageId = ProcessTypeFlowLanguageId });

        }

    }
}
