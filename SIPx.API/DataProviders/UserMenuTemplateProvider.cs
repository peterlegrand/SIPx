
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class UserMenuTemplateProvider : IUserMenuTemplateProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserMenuTemplateProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public async Task<List<UserMenuTemplateIndexGet>> UserMenuTemplateIndexGet(string UserId)
        {
            string usp = "usp_UserMenuTemplateIndexGet @UserID";
            List<UserMenuTemplateIndexGet> x = await _sqlDataAccess.LoadData<UserMenuTemplateIndexGet, dynamic>(usp, new { UserId });
            return x;
        }
        public Task<UserMenuTemplateUpdateGet> UserMenuTemplateUpdateGet(string UserId, int UserMenuTemplateID)
        {
            string usp = "usp_UserMenuTemplateUpdateGet @UserId, @UserMenuTemplateID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuTemplateUpdateGet, dynamic>(usp, new { UserId, UserMenuTemplateID });

        }
        public bool UserMenuTemplateUpdatePut(UserMenuTemplateUpdateGet UserMenuTemplate)
        {
            string usp = "usp_UserMenuTemplateUpdatePut @UserMenuTemplateId, @Name , @Description , @MenuName , @MouseOver , @ModifierId ";
            _sqlDataAccess.SaveData<UserMenuTemplateUpdateGet>(usp, UserMenuTemplate);
            return true;
        }
        public bool UserMenuTemplateCreatePost(UserMenuTemplateCreatePost UserMenuTemplate)
        {
            string usp = "usp_UserMenuTemplateCreatePost @Name, @Description, @MenuName, @MouseOver, @CreatorID";
            _sqlDataAccess.SaveData<UserMenuTemplateCreatePost>(usp, UserMenuTemplate);
            return true;
        }
        public async Task<string> UserMenuTemplateCreatePostCheck(UserMenuTemplateCreatePost UserMenuTemplate)
        {
            string usp = "usp_UserMenuTemplateCreatePostCheck @Name, @Description, @MenuName, @MouseOver, @CreatorID";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, UserMenuTemplate);
            return CheckString;
        }
        public async Task<List<UserMenuTemplateLanguageIndexGet>> UserMenuTemplateLanguageIndexGet(string UserId, int UserMenuTemplateId)
        {
            string usp = "usp_UserMenuTemplateLanguageIndexGet @UserId, @UserMenuTemplateID";
            var x = await _sqlDataAccess.LoadData<UserMenuTemplateLanguageIndexGet, dynamic>(usp, new { UserId, UserMenuTemplateId });
            return x;
        }
        public Task<UserMenuTemplateLanguageIndexGet> UserMenuTemplateLanguageUpdateGet(string UserId, int UserMenuTemplateLanguageId)
        {
            string usp = "usp_UserMenuTemplateLanguageUpdateGet @UserId, @UserMenuTemplateLanguageID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuTemplateLanguageIndexGet, dynamic>(usp, new { UserId, UserMenuTemplateLanguageId });

        }

        public bool UserMenuTemplateUpdatePost(UserMenuTemplateUpdateGet UserMenuTemplate)
        {
            string usp = "usp_UserMenuTemplateUpdatePost @UserId, @UserMenuTemplateID, @Name, @Description, @MenuName, @MouseOver";
            _sqlDataAccess.SaveData<UserMenuTemplateUpdateGet>(usp, UserMenuTemplate);
            return true;
        }
        public async Task<string> UserMenuTemplateUpdatePostCheck(UserMenuTemplateUpdateGet UserMenuTemplate)
        {
            string usp = "usp_UserMenuTemplateUpdatePostCheck @UserId, @UserMenuTemplateID, @Name, @Description, @MenuName, @MouseOver";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, UserMenuTemplate);
            return CheckString;
        }
    }
}
