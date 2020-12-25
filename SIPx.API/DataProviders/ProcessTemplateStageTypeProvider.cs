
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
    public class ProcessTemplateStageTypeProvider : IProcessTemplateStageTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateStageTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateStageTypeCreateGet ProcessTemplateStageType)
        {
            string usp = "usp_ProcessTemplateStageTypeCreatePostCheck @LanguageId, @Name, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateStageType);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTemplateStageTypeCreateGet ProcessTemplateStageType)
        {
            string usp = "usp_ProcessTemplateStageTypeCreatePost @Name, @Description, @MenuName, @MouseOver,@color, @IconId, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateStageType);
            return String;
        }

        public Task<List<ProcessTemplateStageTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateStageTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<ProcessTemplateStageTypeUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeUpdateGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateStageTypeUpdateGet ProcessTemplateStageType)
        {
            string usp = "usp_ProcessTemplateStageTypeUpdatePostCheck @ProcessTemplateStageTypeId, @Name, @Description, @MenuName, @MouseOver, @Color, @IconId, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateStageType);
            return ErrorMessages;
        }
        public bool UpdatePost(ProcessTemplateStageTypeUpdateGet ProcessTemplateStageType)
        {
            string usp = "usp_ProcessTemplateStageTypeUpdatePost @ProcessTemplateStageTypeId, @Name, @Description, @MenuName, @MouseOver, @Color, @IconId, @UserId";
            _sqlDataAccess.SaveData<ProcessTemplateStageTypeUpdateGet>(usp, ProcessTemplateStageType);
            return true;
        }

        public Task<ProcessTemplateStageTypeDeleteGet> DeleteGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeDeleteGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeDeleteGet, dynamic>(usp, new { UserId, ProcessTemplateStageTypeId });

        }

        public bool DeletePost(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeDeletePost @UserId, @ProcessTemplateStageTypeID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTemplateStageTypeId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeDeletePostCheck @UserId, @ProcessTemplateStageTypeID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTemplateStageTypeId });
            return ErrorMessages;
        }

        public Task<List<ProcessTemplateStageTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageIndexGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageTypeLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }

        public Task<ProcessTemplateStageTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProcessTemplateStageTypeLanguageId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageUpdateGet @UserId, @ProcessTemplateStageTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeLanguageId = ProcessTemplateStageTypeLanguageId });

        }

        public async Task<List<ProcessTemplateStageTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateStageTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<ProcessTemplateStageTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
