
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
    public class RoleProvider : IRoleProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public RoleProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }


        public async Task<List<ErrorMessage>> CreatePostCheck(RoleCreateGet Role)
        {
            string usp = "usp_RoleCreatePostCheck @RoleId, @Name, @Description, @MenuName, @MouseOver, @UserID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Role);
            return ErrorMessages;
        }
        public bool CreatePost(RoleCreateGet Role)
        {
            string usp = "usp_RoleCreatePost @RoleId, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<RoleCreateGet>(usp, Role);
            return true;
        }
        public async Task<List<RoleClaimIndexGet>> ClaimIndexGet(string UserId, string RoleId)
        {
            string usp = "usp_RoleClaimIndexGet @UserId, @RoleID";
            var x = await _sqlDataAccess.LoadData<RoleClaimIndexGet, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });
            return x;
        }

        public async Task<List<RoleIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_RoleIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<RoleIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<RoleUpdateGet> UpdateGet(string UserId, string RoleId)
        {
            string usp = "usp_roleUpdateGet @UserId, @RoleID";
            return _sqlDataAccess.LoadSingleRecord<RoleUpdateGet, dynamic>(usp, new { UserId = UserId, roleId = RoleId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(RoleUpdateGet Role)
        {
            string usp = "usp_RoleUpdatePostCheck @RoleId, @Name , @Description , @MenuName , @MouseOver, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Role);
            return ErrorMessages;
        }
        public bool UpdatePost(RoleUpdateGet Role)
        {
            string usp = "usp_RoleUpdatePost @RoleId, @Name , @Description , @MenuName , @MouseOver, @UserId ";
            _sqlDataAccess.SaveData<RoleUpdateGet>(usp, Role);
            return true;
        } 
        public Task<RoleDeleteGet> DeleteGet(string UserId, string RoleId)
        {
            string usp = "usp_RoleDeleteGet @UserId, @RoleID";
            return _sqlDataAccess.LoadSingleRecord<RoleDeleteGet, dynamic>(usp, new { UserId, RoleId });

        }

        public bool DeletePost(string UserId, string RoleId)
        {
            string usp = "usp_RoleDeletePost @UserId, @RoleId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId = UserId, RoleId = RoleId });
            return true;
        }

        public Task<List<RoleLanguageIndexGet>> LanguageIndexGet(string UserId, string RoleId)
        {
            string usp = "usp_RoleLanguageIndexGet @UserId, @RoleID";
            return _sqlDataAccess.LoadData<RoleLanguageIndexGet, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });

        }

        public Task<RoleLanguageUpdateGet> LanguageUpdateGet(string UserId, int RoleLanguageId)
        {
            string usp = "usp_RoleLanguageUpdateGet @UserId, @RoleLanguageID";
            return _sqlDataAccess.LoadSingleRecord<RoleLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, RoleLanguageId = RoleLanguageId });

        }

        public Task<List<RoleList>> List(string UserId)
        {
            string usp = "usp_RoleList @UserID";
            return _sqlDataAccess.LoadData<RoleList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
