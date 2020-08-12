
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
        public Task<List<ProcessTemplateStageTypeLanguage>> ProcessTemplateStageTypeLanguageIndexGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageIndexGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }
        public Task<ProcessTemplateStageTypeLanguage> ProcessTemplateStageTypeLanguageUpdateGet(string UserId, int ProcessTemplateStageTypeLanguageId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageUpdateGet @UserId, @ProcessTemplateStageTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeLanguageId = ProcessTemplateStageTypeLanguageId });

        }
        public Task<List<ProcessTemplateStageType>> ProcessTemplateStageTypeIndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateStageTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<ProcessTemplateStageType> ProcessTemplateStageTypeUpdateGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeUpdateGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageType, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }
        public async Task<List<ProcessTemplateStageTypeList>> ProcessTemplateStageTypeList(string UserId)
        {
            string usp = "usp_ProcessTemplateStageTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<ProcessTemplateStageTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<string> ProcessTemplateStageTypeCreatePostCheck(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType)
        {
            string usp = "usp_ProcessTemplateStageTypeCreatePostCheck @LanguageId, @Name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateStageType);
            return CheckString;
        }
        public async Task<string> ProcessTemplateStageTypeCreatePost(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType)
        {
            string usp = "usp_ProcessTemplateStageTypeCreatePost @Internal, @LegalEntity,  @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateStageType);
            return String;
        }
    }
}
