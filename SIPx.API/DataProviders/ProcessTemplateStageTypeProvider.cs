
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

        public async Task<string> CreatePostCheck(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType)
        {
            string usp = "usp_ProcessTemplateStageTypeCreatePostCheck @LanguageId, @Name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateStageType);
            return CheckString;
        }

        public async Task<string> CreatePost(ProcessTemplateStageTypeCreatePost ProcessTemplateStageType)
        {
            string usp = "usp_ProcessTemplateStageTypeCreatePost @Internal, @LegalEntity,  @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateStageType);
            return String;
        }

        public Task<List<ProcessTemplateStageType>> IndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateStageTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageType, dynamic>(usp, new { UserId = UserId });

        }

        public Task<ProcessTemplateStageTypeUpdateGet> UpdateGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeUpdateGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }

        public bool UpdatePost(ProcessTemplateStageTypeUpdateGet ProcessTemplateStageType)
        {
            string usp = "usp_ProcessTemplateStageTypeUpdatePost @ProcessTemplateStageTypeId, @Name, @Description, @MenuName, @MouseOver, @Color, @IconId, @ModifierId";
            _sqlDataAccess.SaveData<ProcessTemplateStageTypeUpdateGet>(usp, ProcessTemplateStageType);
            return true;
        }

        public Task<ProcessTemplateStageTypeDeleteGet> DeleteGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeDeleteGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeDeleteGet, dynamic>(usp, new { UserId, ProcessTemplateStageTypeId });

        }

        public bool DeletePost(int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeDeletePost @ProcessTemplateStageTypeId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });
            return true;
        }

        public Task<List<ProcessTemplateStageTypeLanguage>> LanguageIndexGet(string UserId, int ProcessTemplateStageTypeId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageIndexGet @UserId, @ProcessTemplateStageTypeID";
            return _sqlDataAccess.LoadData<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeId = ProcessTemplateStageTypeId });

        }

        public Task<ProcessTemplateStageTypeLanguage> LanguageUpdateGet(string UserId, int ProcessTemplateStageTypeLanguageId)
        {
            string usp = "usp_ProcessTemplateStageTypeLanguageUpdateGet @UserId, @ProcessTemplateStageTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateStageTypeLanguage, dynamic>(usp, new { UserId = UserId, ProcessTemplateStageTypeLanguageId = ProcessTemplateStageTypeLanguageId });

        }

        public async Task<List<ProcessTemplateStageTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateStageTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<ProcessTemplateStageTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
