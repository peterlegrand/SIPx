
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

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateFlowCreateGet ProcessTemplateFlow)
        {
            string usp = "usp_ProcessTemplateFlowCreatePostCheck @ProcessTemplateId, @ProcessTemplateFromStageId, @ProcessTemplateToStageId, @Name, @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateFlow);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTemplateFlowCreateGet ProcessTemplateFlow)
        {
            string usp = "usp_ProcessTemplateFlowCreatePost @ProcessTemplateId, @ProcessTemplateFromStageId, @ProcessTemplateToStageId, @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateFlow);
            return String;
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
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateFlowUpdateGet ProcessTemplateFlow)
        {
            string usp = "usp_ProcessTemplateFlowUpdatePostCheck @ProcessTemplateFlowId , @ProcessTemplateFromStageId ,@ProcessTemplateToStageId, @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateFlow);
            return ErrorMessages;
        }

        public bool UpdatePost(ProcessTemplateFlowUpdateGet ProcessTemplateFlow)
        {
            string usp = "usp_ProcessTemplateFlowUpdatePost @ProcessTemplateFlowId , @ProcessTemplateFromStageId ,@ProcessTemplateToStageId, @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<ProcessTemplateFlowUpdateGet>(usp, ProcessTemplateFlow);
            return true;
        }

        public Task<ProcessTemplateFlowDeleteGet> DeleteGet(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowDeleteGet @UserId, @ProcessTemplateFlowID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFlowDeleteGet, dynamic>(usp, new { UserId, ProcessTemplateFlowId });

        }

        public bool DeletePost(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowDeletePost @UserId, @ProcessTemplateFlowID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTemplateFlowId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTemplateFlowId)
        {
            string usp = "usp_ProcessTemplateFlowDeletePostCheck @UserId, @ProcessTemplateFlowID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTemplateFlowId });
            return ErrorMessages;
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

    }
}
