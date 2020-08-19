
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
        public Task<List<ProcessTemplateFieldList>> List(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateFieldList @UserId, @ProcessTemplateId ";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public Task<List<ProcessTemplateFieldList>> UpdateGetFieldList(string UserId, int ProcessTemplateStageFieldId)
        {
            string usp = "usp_ProcessTemplateFlowUpdateGetStageList @UserId, @ProcessTemplateStageFieldId";
            return _sqlDataAccess.LoadData<ProcessTemplateFieldList, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageFieldId = ProcessTemplateStageFieldId });

        }

        public async Task<string> CreatePostCheck(ProcessTemplateFieldCreatePost ProcessTemplateField)
        {
            string usp = "usp_ProcessTemplateFieldCreatePostCheck @ProcessTemplateId, @ProcessTemplateFieldTypeId, @LanguageId, @Name, @CreaterId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateField);
            return CheckString;
        }
        public async Task<string> CreatePost(ProcessTemplateFieldCreatePost ProcessTemplateField)
        {
            string usp = "usp_ProcessTemplateFieldCreatePost @ProcessTemplateId, @ProcessTemplateFieldTypeId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreaterId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateField);
            return String;
        }
        public Task<ProcessTemplateFieldDeleteGet> DeleteGet(string UserId, int ProcessTemplateFieldId)
        {
            string usp = "usp_ProcessTemplateFieldDeleteGet @UserId, @ProcessTemplateFieldID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateFieldDeleteGet, dynamic>(usp, new { UserId, ProcessTemplateFieldId });

        }
        public bool DeletePost(int Id)
        {
            string usp = "usp_ProcessTemplateFieldDeletePost @ProcessTemplateFieldId";
            _sqlDataAccess.SaveData<int>(usp, Id);
            return true;
        }

    }
}
