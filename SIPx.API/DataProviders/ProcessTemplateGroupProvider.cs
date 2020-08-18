﻿
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

        public Task<List<ProcessTemplateGroupList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateGroupList @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateGroupList, dynamic>(usp, new { UserId = UserId });

        }
        public async Task<string> CreatePostCheck(ProcessTemplateGroupCreatePost ProcessTemplateGroup)
        {
            string usp = "usp_ProcessTemplateGroupCreatePostCheck @Sequence, @LanguageId, @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateGroup);
            return CheckString;
        }
        public async Task<string> CreatePost(ProcessTemplateGroupCreatePost ProcessTemplateGroup)
        {
            string usp = "usp_ProcessTemplateGroupCreatePost @Sequence, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplateGroup);
            return String;
        }
        public Task<List<SequenceList>> CreateGetSequence(string UserId)
        {
            string usp = "usp_ProcessTemplateGroupCreateGetSequence @UserID";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
        }

    }
}
