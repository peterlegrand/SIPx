
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
    public class ProcessTemplateGroupProvider : IProcessTemplateGroupProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateGroupProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<SequenceList>> CreateGetSequence(string UserId)
        {
            string usp = "usp_ProcessTemplateGroupCreateGetSequence @UserID";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateGroupCreateGet ProcessTemplateGroup)
        {
            string usp = "usp_ProcessTemplateGroupCreatePostCheck @Sequence, @Name, @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateGroup);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTemplateGroupCreateGet ProcessTemplateGroup)
        {
            string usp = "usp_ProcessTemplateGroupCreatePost @Sequence, @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateGroup);
            return String;
        }

        public Task<List<ProcessTemplateGroupIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateGroupIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateGroupIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<ProcessTemplateGroupUpdateGet> UpdateGet(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroupUpdateGet @UserId, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroupUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupId = ProcessTemplateGroupId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateGroupUpdateGet ProcessTemplateGroup)
        {
            string usp = "usp_ProcessTemplateGroupUpdatePostCheck @ProcessTemplateGroupId, @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplateGroup);
            return ErrorMessages;
        }
        public bool UpdatePost(ProcessTemplateGroupUpdateGet ProcessTemplateGroup)
        {
            string usp = "usp_ProcessTemplateGroupUpdatePost @ProcessTemplateGroupId, @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ProcessTemplateGroupUpdateGet>(usp, ProcessTemplateGroup);
            return true;
        }

        public Task<ProcessTemplateGroupDeleteGet> DeleteGet(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroupDeleteGet @UserId, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroupDeleteGet, dynamic>(usp, new { UserId, ProcessTemplateGroupId });

        }

        public bool DeletePost(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroupDeletePost @UserId, @ProcessTemplateGroupID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTemplateGroupId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroupDeletePostCheck @UserId, @ProcessTemplateGroupID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTemplateGroupId });
            return ErrorMessages;
        }

        public Task<List<ProcessTemplateGroupLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateGroupId)
        {
            string usp = "usp_ProcessTemplateGroupLanguageIndexGet @UserId, @ProcessTemplateGroupID";
            return _sqlDataAccess.LoadData<ProcessTemplateGroupLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupId = ProcessTemplateGroupId });

        }

        public Task<ProcessTemplateGroupLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateGroupLanguageId)
        {
            string usp = "usp_ProcessTemplateGroupLanguageUpdateGet @UserId, @ProcessTemplateGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateGroupLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateGroupLanguageId = ProcessTemplateGroupLanguageId });

        }

        public Task<List<ProcessTemplateGroupList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateGroupList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateGroupList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<SequenceList>> UpdateGetSequence(string UserId)
        {
            string usp = "usp_ProcessTemplateGroupUpdateGetSequence @UserId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
