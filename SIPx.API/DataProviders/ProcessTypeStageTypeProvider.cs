
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
    public class ProcessTypeStageTypeProvider : IProcessTypeStageTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeStageTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeStageTypeCreateGet ProcessTypeStageType)
        {
            string usp = "usp_ProcessTypeStageTypeCreatePostCheck @LanguageId, @Name, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeStageType);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTypeStageTypeCreateGet ProcessTypeStageType)
        {
            string usp = "usp_ProcessTypeStageTypeCreatePost @Name, @Description, @MenuName, @MouseOver,@color, @IconId, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTypeStageType);
            return String;
        }

        public Task<List<ProcessTypeStageTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ProcessTypeStageTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTypeStageTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<ProcessTypeStageTypeUpdateGet> UpdateGet(string UserId, int ProcessTypeStageTypeId)
        {
            string usp = "usp_ProcessTypeStageTypeUpdateGet @UserId, @ProcessTypeStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeStageTypeUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeStageTypeId = ProcessTypeStageTypeId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeStageTypeUpdateGet ProcessTypeStageType)
        {
            string usp = "usp_ProcessTypeStageTypeUpdatePostCheck @ProcessTypeStageTypeId, @Name, @Description, @MenuName, @MouseOver, @Color, @IconId, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeStageType);
            return ErrorMessages;
        }
        public bool UpdatePost(ProcessTypeStageTypeUpdateGet ProcessTypeStageType)
        {
            string usp = "usp_ProcessTypeStageTypeUpdatePost @ProcessTypeStageTypeId, @Name, @Description, @MenuName, @MouseOver, @Color, @IconId, @UserId";
            _sqlDataAccess.SaveData<ProcessTypeStageTypeUpdateGet>(usp, ProcessTypeStageType);
            return true;
        }

        public Task<ProcessTypeStageTypeDeleteGet> DeleteGet(string UserId, int ProcessTypeStageTypeId)
        {
            string usp = "usp_ProcessTypeStageTypeDeleteGet @UserId, @ProcessTypeStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeStageTypeDeleteGet, dynamic>(usp, new { UserId, ProcessTypeStageTypeId });

        }

        public bool DeletePost(string UserId, int ProcessTypeStageTypeId)
        {
            string usp = "usp_ProcessTypeStageTypeDeletePost @UserId, @ProcessTypeStageTypeID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTypeStageTypeId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeStageTypeId)
        {
            string usp = "usp_ProcessTypeStageTypeDeletePostCheck @UserId, @ProcessTypeStageTypeID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTypeStageTypeId });
            return ErrorMessages;
        }

        public Task<List<ProcessTypeStageTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeStageTypeId)
        {
            string usp = "usp_ProcessTypeStageTypeLanguageIndexGet @UserId, @ProcessTypeStageTypeID";
            return _sqlDataAccess.LoadData<ProcessTypeStageTypeLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeStageTypeId = ProcessTypeStageTypeId });

        }

        public Task<ProcessTypeStageTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int ProcessTypeStageTypeLanguageId)
        {
            string usp = "usp_ProcessTypeStageTypeLanguageUpdateGet @UserId, @ProcessTypeStageTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeStageTypeLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeStageTypeLanguageId = ProcessTypeStageTypeLanguageId });

        }

        public async Task<List<ProcessTypeStageTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTypeStageTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<ProcessTypeStageTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
