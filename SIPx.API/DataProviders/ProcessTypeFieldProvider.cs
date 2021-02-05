
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
    public class ProcessTypeFieldProvider : IProcessTypeFieldProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeFieldProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeFieldCreateGet ProcessTypeField)
        {
            string usp = "usp_ProcessTypeFieldCreatePostCheck @ProcessTypeId, @ProcessTypeFieldTypeId, @Name, @CreaterId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeField);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTypeFieldCreateGet ProcessTypeField)
        {
            string usp = "usp_ProcessTypeFieldCreatePost @ProcessTypeId, @ProcessTypeFieldTypeId, @Name, @Description, @MenuName, @MouseOver, @CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTypeField);
            return String;
        }

        public Task<List<ProcessTypeFieldIndexGet>> IndexGet(string UserId, int ProcessTypeId)
        {
            string usp = "usp_ProcessTypeFieldIndexGet @UserId, @ProcessTypeID";
            return _sqlDataAccess.LoadData<ProcessTypeFieldIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeId = ProcessTypeId });

        }

        public Task<ProcessTypeFieldUpdateGet> UpdateGet(string UserId, int ProcessTypeFieldId)
        {
            string usp = "usp_ProcessTypeFieldUpdateGet @UserId, @ProcessTypeFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFieldUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFieldId = ProcessTypeFieldId });

        }

        public Task<List<ProcessTypeFieldList>> UpdateGetSequence(string UserId, int ProcessTypeFieldId)
        {
            string usp = "usp_ProcessTypeFieldUpdateGetSequence @UserId, @ProcessTypeFieldID";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId = UserId, ProcessTypeFieldId = ProcessTypeFieldId });

        }

        public Task<List<ProcessTypeFieldList>> UpdateGetFieldList(string UserId, int ProcessTypeStageFieldId)
        {
            string usp = "usp_ProcessTypeFlowUpdateGetStageList @UserId, @ProcessTypeStageFieldId";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId = UserId, ProcessTypeStageFieldId = ProcessTypeStageFieldId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeFieldUpdateGet ProcessTypeField)
        {
            string usp = "usp_ProcessTypeFieldUpdatePostCheck @ProcessTypeFieldId , @ProcessTypeFieldTypeId , @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeField);
            return ErrorMessages;
        }
        public bool UpdatePost(ProcessTypeFieldUpdateGet ProcessTypeField)
        {
            string usp = "usp_ProcessTypeFieldUpdatePost @ProcessTypeFieldId , @ProcessTypeFieldTypeId , @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ProcessTypeFieldUpdateGet>(usp, ProcessTypeField);
            return true;
        }

        public Task<ProcessTypeFieldDeleteGet> DeleteGet(string UserId, int ProcessTypeFieldId)
        {
            string usp = "usp_ProcessTypeFieldDeleteGet @UserId, @ProcessTypeFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFieldDeleteGet, dynamic>(usp, new { UserId, ProcessTypeFieldId });

        }

        public bool DeletePost(string UserId, int ProcessTypeFieldId)
        {
            string usp = "usp_ProcessTypeFieldDeletePost @UserId, @ProcessTypeFieldID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTypeFieldId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeFieldId)
        {
            string usp = "usp_ProcessTypeFieldDeletePostCheck @UserId, @ProcessTypeFieldID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTypeFieldId });
            return ErrorMessages;
        }

        public Task<List<ProcessTypeFieldLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeFieldId)
        {
            string usp = "usp_ProcessTypeFieldLanguageIndexGet @UserId, @ProcessTypeFieldID";
            return _sqlDataAccess.LoadData<ProcessTypeFieldLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFieldId = ProcessTypeFieldId });

        }

        public Task<ProcessTypeFieldLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeFieldLanguageId)
        {
            string usp = "usp_ProcessTypeFieldLanguageUpdateGet @UserId, @ProcessTypeFieldLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeFieldLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeFieldLanguageId = ProcessTypeFieldLanguageId });

        }

        public Task<List<ProcessTypeFieldList>> List(string UserId, int ProcessTypeId)
        {
            string usp = "usp_ProcessTypeFieldList @UserId, @ProcessTypeId ";
            return _sqlDataAccess.LoadData<ProcessTypeFieldList, dynamic>(usp, new { UserId = UserId, ProcessTypeId = ProcessTypeId });

        }

    }
}
