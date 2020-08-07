
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
    public class UserMenuProvider : IUserMenuProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserMenuProvider(ISqlDataAccess sqlDataAccess)
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

        public async Task<List<UserMenuTemplateOptionIndexGet>> UserMenuTemplateOptionIndexGet(string UserId, int UserMenuTemplateId)
        {
            string usp = "usp_UserMenuTemplateOptionIndexGet @UserId, @UserMenuTemplateID";
            var x = await _sqlDataAccess.LoadData<UserMenuTemplateOptionIndexGet, dynamic>(usp, new { UserId, UserMenuTemplateId });
            return x;
        }
        public Task<UserMenuTemplateOptionUpdateGet> UserMenuTemplateOptionUpdateGet(string UserId, int UserMenuTemplateOptionId)
        {
            string usp = "usp_UserMenuTemplateOptionUpdateGet @UserId, @UserMenuTemplateOptionID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuTemplateOptionUpdateGet, dynamic>(usp, new { UserId, UserMenuTemplateOptionId });

        }
        public async Task<List<UserMenuTemplateOptionLanguageIndexGet>> UserMenuTemplateOptionLanguageIndexGet(string UserId, int UserMenuTemplateOptionId)
        {
            string usp = "usp_UserMenuTemplateOptionLanguageIndex @UserId, @UserMenuTemplateOptionID";
            var x = await _sqlDataAccess.LoadData<UserMenuTemplateOptionLanguageIndexGet, dynamic>(usp, new { UserId, UserMenuTemplateOptionId });
            return x;
        }
        public Task<UserMenuTemplateOptionLanguageIndexGet> UserMenuTemplateOptionLanguageUpdateGet(string UserId, int UserMenuTemplateOptionLanguageId)
        {
            string usp = "usp_UserMenuTemplateOptionLanguageUpdateGet @UserId, @UserMenuTemplateOptionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuTemplateOptionLanguageIndexGet, dynamic>(usp, new { UserId, UserMenuTemplateOptionLanguageId });

        }
        public bool UserMenuTemplateOptionCreatePost(UserMenuTemplateOptionCreatePost UserMenuTemplateOption)
        {
            string usp = "usp_UserMenuTemplateOptionCreatePost @UserMenuTemplateId, @Sequence, @UserPageLeftId, @UserPageRightId, @Icon,@Name, @Description, @MenuName, @MouseOver, @CreatorID";
            _sqlDataAccess.SaveData<UserMenuTemplateOptionCreatePost>(usp, UserMenuTemplateOption);
            return true;
        }
        public Task<List<SequenceList>> UserMenuTemplateOptionCreateGetSequence(string UserId, int UserMenuTemplateId)
        {
            string usp = "[usp_UserMenuTemplateOptionCreateGetSequence] @UserID, @UserMenuTemplateId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, UserMenuTemplateId });
        }
        public async Task<string> UserMenuTemplateOptionCreatePostCheck(UserMenuTemplateOptionCreatePost UserMenuTemplateOption)
        {
            string usp = "usp_UserMenuTemplateOptionCreatePostCheck @UserMenuTemplateId, @Sequence, @UserPageLeftId, @UserPageRightId, @Icon,@Name, @Description, @MenuName, @MouseOver, @CreatorID";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, UserMenuTemplateOption);
            return CheckString;
        }


    }
}
