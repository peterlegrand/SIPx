
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
    public class UserMenuTemplateOptionProvider : IUserMenuTemplateOptionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserMenuTemplateOptionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
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
            string usp = "usp_UserMenuTemplateOptionCreatePost @UserMenuTemplateId, @Sequence, @UserPageLeftId, @UserPageRightId, @UserMenuTypeIDLeft, @UserMenuTypeIDRight, @Icon,@Name, @Description, @MenuName, @MouseOver, @CreatorID";
            _sqlDataAccess.SaveData<UserMenuTemplateOptionCreatePost>(usp, UserMenuTemplateOption);
            return true;
        }
        public Task<List<SequenceList>> UserMenuTemplateOptionCreateGetSequence(string UserId, int UserMenuTemplateId)
        {
            string usp = "[usp_UserMenuTemplateOptionCreateGetSequence] @UserID, @UserMenuTemplateId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, UserMenuTemplateId });
        }

        public bool UserMenuTemplateOptionCreatePost(UserMenuTemplateOptionCreateGet UserMenuTemplateOption)
        {
            string usp = "usp_UserMenuTemplateOptionCreatePost @UserMenuTemplateId, @Name , @Description , @MenuName , @MouseOver , @UserPageIdLeft , @UserPageIdRight ,@UserMenuTypeIDLeft, @UserMenuTypeIDRight, @Icon , @Sequence , @CreatorId ";
            _sqlDataAccess.SaveData<UserMenuTemplateOptionCreateGet>(usp, UserMenuTemplateOption);
            return true;
        }
        public async Task<string> UserMenuTemplateOptionCreatePostCheck(UserMenuTemplateOptionCreateGet UserMenuTemplateOption)
        {
            string usp = "usp_UserMenuTemplateOptionCreatePostCheck @UserMenuTemplateId, @Name , @Description , @MenuName , @MouseOver , @UserPageIdLeft , @UserPageIdRight , @Icon , @Sequence , @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, UserMenuTemplateOption);
            return CheckString;
        }


    }
}
