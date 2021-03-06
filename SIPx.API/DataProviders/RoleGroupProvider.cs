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
    public class RoleGroupProvider : IRoleGroupProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public RoleGroupProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(RoleGroupCreateGet RoleGroup)
        {
            string usp = "usp_RoleGroupCreateCheck @Sequence, @LanguageId  , @Name, @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, RoleGroup);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(RoleGroupCreateGet RoleGroup)
        {
            string usp = "usp_RoleGroupCreatePost @Sequence , @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, RoleGroup);
            return String;
        }

        public Task<List<RoleGroupIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_RoleGroupIndexGet @UserId";
            return _sqlDataAccess.LoadData<RoleGroupIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<RoleGroupUpdateGet> UpdateGet(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupUpdateGet @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroupUpdateGet, dynamic>(usp, new { UserId = UserId, RoleGroupId = RoleGroupId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(RoleGroupUpdateGet RoleGroup)
        {
            string usp = "usp_RoleGroupUpdatePostCheck @RoleGroupId, @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, RoleGroup);
            return ErrorMessages;
        }

        public bool UpdatePost(RoleGroupUpdateGet RoleGroup)
        {
            string usp = "usp_RoleGroupUpdatePost @RoleGroupId, @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<RoleGroupUpdateGet>(usp, RoleGroup);
            return true;
        }

        public Task<RoleGroupDeleteGet> DeleteGet(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupDeleteGet @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroupDeleteGet, dynamic>(usp, new { UserId, RoleGroupId });

        }

        public bool DeletePost(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupDeletePost @UserId, @RoleGroupID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, RoleGroupId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupDeletePostCheck @UserId, @RoleGroupID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, RoleGroupId });
            return ErrorMessages;
        }

        public Task<List<RoleGroupLanguageIndexGet>> LanguageIndexGet(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupLanguageIndexGet @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadData<RoleGroupLanguageIndexGet, dynamic>(usp, new { UserId = UserId, RoleGroupId = RoleGroupId });

        }

        public Task<ObjectLanguageUpdateGet> LanguageUpdateGet(string UserId, int RoleGroupLanguageId)
        {
            string usp = "usp_RoleGroupLanguageUpdateGet @UserId, @RoleGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ObjectLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, RoleGroupLanguageId = RoleGroupLanguageId });

        }

        public async Task<List<SequenceList>> CreateGetSequence(string UserId)
        {
            string usp = "usp_RoleGroupCreateGetSequence @UserID";
            var x = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<RoleGroupList>> List(string UserId)
        {
            string usp = "usp_RoleGroupList @UserID";
            var x = await _sqlDataAccess.LoadData<RoleGroupList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
