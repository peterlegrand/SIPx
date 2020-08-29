
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

        public async Task<string> CreatePostCheck(RoleGroupCreatePost RoleGroup)
        {
            string usp = "usp_RoleGroupCreateCheck @Sequence, @LanguageId  , @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, RoleGroup);
            return CheckString;
        }

        public async Task<string> CreatePost(RoleGroupCreatePost RoleGroup)
        {
            string usp = "usp_RoleGroupCreate @Sequence, @LanguageId  , @Name, @Description, @MenuName, @MouseOve, @CreatorId ";
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

        public bool UpdatePost(RoleGroupUpdateGet RoleGroup)
        {
            string usp = "usp_RoleGroupUpdatePost @RoleGroupId, @Sequence, @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<RoleGroupUpdateGet>(usp, RoleGroup);
            return true;
        }

        public Task<RoleGroupDeleteGet> DeleteGet(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupDeleteGet @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroupDeleteGet, dynamic>(usp, new { UserId, RoleGroupId });

        }

        public bool DeletePost(int RoleGroupId)
        {
            string usp = "usp_RoleGroupDeletePost @RoleGroupId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { RoleGroupId = RoleGroupId });
            return true;
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

    }
}
