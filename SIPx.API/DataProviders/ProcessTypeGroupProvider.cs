
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
    public class ProcessTypeGroupProvider : IProcessTypeGroupProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeGroupProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<SequenceList>> CreateGetSequence(string UserId)
        {
            string usp = "usp_ProcessTypeGroupCreateGetSequence @UserID";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeGroupCreateGet ProcessTypeGroup)
        {
            string usp = "usp_ProcessTypeGroupCreatePostCheck @Sequence, @Name, @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeGroup);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTypeGroupCreateGet ProcessTypeGroup)
        {
            string usp = "usp_ProcessTypeGroupCreatePost @Sequence, @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTypeGroup);
            return String;
        }

        public Task<List<ProcessTypeGroupIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ProcessTypeGroupIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTypeGroupIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<ProcessTypeGroupUpdateGet> UpdateGet(string UserId, int ProcessTypeGroupId)
        {
            string usp = "usp_ProcessTypeGroupUpdateGet @UserId, @ProcessTypeGroupID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeGroupUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeGroupId = ProcessTypeGroupId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeGroupUpdateGet ProcessTypeGroup)
        {
            string usp = "usp_ProcessTypeGroupUpdatePostCheck @ProcessTypeGroupId, @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTypeGroup);
            return ErrorMessages;
        }
        public bool UpdatePost(ProcessTypeGroupUpdateGet ProcessTypeGroup)
        {
            string usp = "usp_ProcessTypeGroupUpdatePost @ProcessTypeGroupId, @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<ProcessTypeGroupUpdateGet>(usp, ProcessTypeGroup);
            return true;
        }

        public Task<ProcessTypeGroupDeleteGet> DeleteGet(string UserId, int ProcessTypeGroupId)
        {
            string usp = "usp_ProcessTypeGroupDeleteGet @UserId, @ProcessTypeGroupID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeGroupDeleteGet, dynamic>(usp, new { UserId, ProcessTypeGroupId });

        }

        public bool DeletePost(string UserId, int ProcessTypeGroupId)
        {
            string usp = "usp_ProcessTypeGroupDeletePost @UserId, @ProcessTypeGroupID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTypeGroupId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeGroupId)
        {
            string usp = "usp_ProcessTypeGroupDeletePostCheck @UserId, @ProcessTypeGroupID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTypeGroupId });
            return ErrorMessages;
        }

        public Task<List<ProcessTypeGroupLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeGroupId)
        {
            string usp = "usp_ProcessTypeGroupLanguageIndexGet @UserId, @ProcessTypeGroupID";
            return _sqlDataAccess.LoadData<ProcessTypeGroupLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeGroupId = ProcessTypeGroupId });

        }

        public Task<ProcessTypeGroupLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeGroupLanguageId)
        {
            string usp = "usp_ProcessTypeGroupLanguageUpdateGet @UserId, @ProcessTypeGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeGroupLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeGroupLanguageId = ProcessTypeGroupLanguageId });

        }

        public Task<List<ProcessTypeGroupList>> List(string UserId)
        {
            string usp = "usp_ProcessTypeGroupList @UserId";
            return _sqlDataAccess.LoadData<ProcessTypeGroupList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<SequenceList>> UpdateGetSequence(string UserId)
        {
            string usp = "usp_ProcessTypeGroupUpdateGetSequence @UserId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
