
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
    public class ProcessTypeStageProvider : IProcessTypeStageProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeStageProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeStageCreateGet ProcessTypeStage)
        {
            string usp = "usp_ProcessTypeStageCreatePostCheck @ProcessTypeId, @ProcessTypeTypeId, @LanguageId, @Name, @CreatorId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeStage);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTypeStageCreateGet ProcessTypeStage)
        {
            string usp = "usp_ProcessTypeStageCreatePost @ProcessTypeId, @ProcessTypeStageTypeId, @InToDo, @Name, @Description, @MenuName, @MouseOver, @CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTypeStage);
            return String;
        }

        public Task<List<ProcessTypeStageIndexGet>> IndexGet(string UserId, int ProcessTypeId)
        {
            string usp = "usp_ProcessTypeStageIndexGet @UserId, @ProcessTypeID";
            return _sqlDataAccess.LoadData<ProcessTypeStageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeId = ProcessTypeId });

        }

        public Task<ProcessTypeStageUpdateGet> UpdateGet(string UserId, int ProcessTypeStageId)
        {
            string usp = "usp_ProcessTypeStageUpdateGet @UserId, @ProcessTypeStageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeStageUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeStageId = ProcessTypeStageId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeStageUpdateGet ProcessTypeStage)
        {
            string usp = "usp_ProcessTypeStageUpdatePostCheck @ProcessTypeStageId, @ProcessTypeStageTypeId, @InToDo, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeStage);
            return ErrorMessages;
        }


        public bool UpdatePost(ProcessTypeStageUpdateGet ProcessType)
        {
            string usp = "usp_ProcessTypeStageUpdatePost @ProcessTypeStageId, @ProcessTypeStageTypeId, @InToDo, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ProcessTypeStageUpdateGet>(usp, ProcessType);
            return true;
        }

        public Task<ProcessTypeStageDeleteGet> DeleteGet(string UserId, int ProcessTypeStageId)
        {
            string usp = "usp_ProcessTypeStageDeleteGet @UserId, @ProcessTypeStageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeStageDeleteGet, dynamic>(usp, new { UserId, ProcessTypeStageId });

        }

        public bool DeletePost(string UserId, int ProcessTypeStageId)
        {
            string usp = "usp_ProcessTypeStageDeletePost @UserId, @ProcessTypeStageID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTypeStageId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeStageId)
        {
            string usp = "usp_ProcessTypeStageDeletePostCheck @UserId, @ProcessTypeStageID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTypeStageId });
            return ErrorMessages;
        }

        public Task<List<ProcessTypeStageLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeStageId)
        {
            string usp = "usp_ProcessTypeStageLanguageIndexGet @UserId, @ProcessTypeStageID";
            return _sqlDataAccess.LoadData<ProcessTypeStageLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeStageId = ProcessTypeStageId });

        }

        public Task<ProcessTypeStageLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeStageLanguageId)
        {
            string usp = "usp_ProcessTypeStageLanguageUpdateGet @UserId, @ProcessTypeStageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeStageLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeStageLanguageId = ProcessTypeStageLanguageId });

        }

        public Task<List<ProcessTypeStageList>> List(string UserId, int ProcessTypeId)
        {
            string usp = "usp_ProcessTypeStageList @UserId, @ProcessTypeId";
            return _sqlDataAccess.LoadData<ProcessTypeStageList, dynamic>(usp, new { UserId = UserId, ProcessTypeId = ProcessTypeId });

        }
    }
}
