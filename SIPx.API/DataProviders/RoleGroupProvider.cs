
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
        public async Task<string> RoleGroupCreatePostCheck(RoleGroupCreatePost RoleGroup)
        {
            string usp = "usp_RoleGroupCreateCheck @Sequence, @LanguageId  , @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, RoleGroup);
            return CheckString;
        }
        public async Task<string> RoleGroupCreatePost(RoleGroupCreatePost RoleGroup)
        {
            string usp = "usp_RoleGroupCreate @Sequence, @LanguageId  , @Name, @Description, @MenuName, @MouseOve, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, RoleGroup);
            return String;
        }
        public Task<RoleGroupUpdateGet> RoleGroupUpdateGet(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupUpdateGet @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroupUpdateGet, dynamic>(usp, new { UserId = UserId, RoleGroupId = RoleGroupId });

        }
        public Task<List<RoleGroupIndexGet>> RoleGroupIndexGet(string UserId)
        {
            string usp = "usp_RoleGroupIndexGet @UserId";
            return _sqlDataAccess.LoadData<RoleGroupIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<RoleGroupLanguageIndexGet>> RoleGroupLanguageIndexGet(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupLanguageIndexGet @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadData<RoleGroupLanguageIndexGet, dynamic>(usp, new { UserId = UserId, RoleGroupId = RoleGroupId });

        }
        public Task<ObjectLanguageUpdateGet> RoleGroupLanguageUpdateGet(string UserId, int RoleGroupLanguageId)
        {
            string usp = "usp_RoleGroupLanguageUpdateGet @UserId, @RoleGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ObjectLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, RoleGroupLanguageId = RoleGroupLanguageId });

        }

    }
}
