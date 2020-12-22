
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
    public class ProcessTemplateFieldProvider : IProcessTemplateFieldProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateFieldProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateFieldCreateGet ProcessTemplateField)
        {
            string usp = "usp_ProcessTemplateFieldCreatePostCheck @ProcessTemplateId, @ProcessTemplateFieldTypeId, @Name, @CreaterId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateField);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTemplateFieldCreateGet ProcessTemplateField)
        {
            string usp = "usp_ProcessTemplateFieldCreatePost @ProcessTemplateId, @ProcessTemplateFieldTypeId, @Name, @Description, @MenuName, @MouseOver, @CreatorId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateField);
            return String;
        }

        public Task<List<ProcessTemplateFieldIndexGet>> IndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFieldIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }

        public Task<ProcessTemplateFieldUpdateGet> UpdateGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldUpdateGet @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }

        public Task<List<ProcessTemplateFieldList>> UpdateGetSequence(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldUpdateGetSequence @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }

        public Task<List<ProcessTemplateFieldList>> UpdateGetFieldList(string UserId, int ProcessTemplateStageFieldId)
        {
            string usp = "usp_ProcessTemplateFlowUpdateGetStageList @UserId, @ProcessTemplateStageFieldId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldId = ProcessTemplateStageFieldId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateFieldUpdateGet ProcessTemplateField)
        {
            string usp = "usp_ProcessTemplateFieldUpdatePostCheck @ProcessTemplateFieldId , @ProcessTemplateFieldTypeId , @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateField);
            return ErrorMessages;
        }
        public bool UpdatePost(ProcessTemplateFieldUpdateGet ProcessTemplateField)
        {
            string usp = "usp_ProcessTemplateFieldUpdatePost @ProcessTemplateFieldId , @ProcessTemplateFieldTypeId , @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ProcessTemplateFieldUpdateGet>(usp, ProcessTemplateField);
            return true;
        }

        public Task<ProcessTemplateFieldDeleteGet> DeleteGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldDeleteGet @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldDeleteGet, dynamic>(usp, new { UserId, ProcessTemplateFieldId });

        }

        public bool DeletePost(int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldDeletePost @ProcessTemplateFieldId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ProcessTemplateFieldId = ProcessTemplateFieldId });
            return true;
        }

        public Task<List<ProcessTemplateFieldLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldLanguageIndexGet @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldId = ProcessTemplateFieldId });

        }

        public Task<ProcessTemplateFieldLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateFieldLanguageId)
        {
            string usp = "usp_ProcessTemplateFieldLanguageUpdateGet @UserId, @ProcessTemplateFieldLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateFieldLanguageId = ProcessTemplateFieldLanguageId });

        }

        public Task<List<ProcessTemplateFieldList>> List(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFieldList @UserId, @ProcessTemplateId ";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }

    }
}
