
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
    public class ProcessTemplateStageProvider : IProcessTemplateStageProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateStageProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ProcessTemplateStageLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageLanguageIndexGet @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<ProcessTemplateStageLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateStageLanguageId)
        {
            string usp = "usp_ProcessTemplateStageLanguageUpdateGet @UserId, @ProcessTemplateStageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageLanguageId = ProcessTemplateStageLanguageId });

        }
        public Task<List<ProcessTemplateStageIndexGet>> IndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateStageIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<ProcessTemplateStageUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageUpdateGet @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageId = ProcessTemplateStageId });

        }
        public Task<List<ProcessTemplateStageList>> List(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateStageList @UserId, @ProcessTemplateId";
            return _sqlDataAccess.LoadData<ProcessTemplateStageList, dynamic>(usp, new { UserId = UserId });

        }
        public async Task<string> CreatePostCheck(ProcessTemplateStageCreatePost ProcessTemplateStage)
        {
            string usp = "usp_ProcessTemplateStageCreatePostCheck @ProcessTemplateId, @ProcessTemplateTypeId, @LanguageId, @Name, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateStage);
            return CheckString;
        }
        public async Task<string> CreatePost(ProcessTemplateStageCreatePost ProcessTemplateStage)
        {
            string usp = "usp_ProcessTemplateStageCreatePost @ProcessTemplateId, @ProcessTemplateTypeId, @IsEndStage, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateStage);
            return String;
        }
        public Task<ProcessTemplateStageDeleteGet> DeleteGet(string UserId, int ProcessTemplateStageId)
        {
            string usp = "usp_ProcessTemplateStageDeleteGet @UserId, @ProcessTemplateStageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageDeleteGet, dynamic>(usp, new { UserId, ProcessTemplateStageId });

        }
        public bool DeletePost(int Id)
        {
            string usp = "usp_ProcessTemplateStageDeletePost @ProcessTemplateStageId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ClassificationId = classificationId });
            return true;
        }

    }
}
