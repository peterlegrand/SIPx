
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


        public bool CreatePost(UserMenuTemplateOptionCreateGet UserMenuTemplateOption)
        {
            string usp = "usp_UserMenuTemplateOptionCreatePost @UserMenuTemplateId, @Name , @Description , @MenuName , @MouseOver , @UserPageIdLeft , @UserPageIdRight ,@UserMenuTypeIDLeft, @UserMenuTypeIDRight, @IconId , @Sequence , @CreatorId ";
            _sqlDataAccess.SaveData<UserMenuTemplateOptionCreateGet>(usp, UserMenuTemplateOption);
            return true;
        }

        public Task<List<SequenceList>> CreateGetSequence(string UserId, int UserMenuTemplateId)
        {
            string usp = "[usp_UserMenuTemplateOptionCreateGetSequence] @UserID, @UserMenuTemplateId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, UserMenuTemplateId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(UserMenuTemplateOptionCreateGet UserMenuTemplateOption)
        {
            string usp = "usp_UserMenuTemplateOptionCreatePostCheck @UserMenuTemplateId, @Name , @Description , @MenuName , @MouseOver , @UserPageIdLeft , @UserPageIdRight , @Icon , @Sequence , @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, UserMenuTemplateOption);
            return ErrorMessages;
        }

        public bool CreatePost(UserMenuTemplateOptionCreatePost UserMenuTemplateOption)
        {
            string usp = "usp_UserMenuTemplateOptionCreatePost @UserMenuTemplateId, @Sequence, @UserPageLeftId, @UserPageRightId, @UserMenuTypeIDLeft, @UserMenuTypeIDRight, @Icon,@Name, @Description, @MenuName, @MouseOver, @CreatorID";
            _sqlDataAccess.SaveData<UserMenuTemplateOptionCreatePost>(usp, UserMenuTemplateOption);
            return true;
        }

        public async Task<List<UserMenuTemplateOptionIndexGet>> IndexGet(string UserId, int UserMenuTemplateId)
        {
            string usp = "usp_UserMenuTemplateOptionIndexGet @UserId, @UserMenuTemplateID";
            var x = await _sqlDataAccess.LoadData<UserMenuTemplateOptionIndexGet, dynamic>(usp, new { UserId, UserMenuTemplateId });
            return x;
        }

        public Task<UserMenuTemplateOptionUpdateGet> UpdateGet(string UserId, int UserMenuTemplateOptionId)
        {
            string usp = "usp_UserMenuTemplateOptionUpdateGet @UserId, @UserMenuTemplateOptionID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuTemplateOptionUpdateGet, dynamic>(usp, new { UserId, UserMenuTemplateOptionId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(UserMenuTemplateOptionUpdateGet UserMenuTemplateOption)
        {
            string usp = "usp_UserMenuTemplateOptionUpdatePostCheck @UserMenuTemplateOptionId, @IconId, @UserPageIdLeft, @UserPageIdRight, @UserMenuTypeIDLeft, @UserMenuTypeIDRight, @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, UserMenuTemplateOption);
            return ErrorMessages;
        }
        public bool UpdatePost(UserMenuTemplateOptionUpdateGet UserMenuTemplateOption)
        {
            string usp = "usp_UserMenuTemplateOptionUpdatePost @UserMenuTemplateOptionId, @IconId, @UserPageIdLeft, @UserPageIdRight, @UserMenuTypeIDLeft, @UserMenuTypeIDRight, @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<UserMenuTemplateOptionUpdateGet>(usp, UserMenuTemplateOption);
            return true;
        }

        public Task<UserMenuTemplateOptionDeleteGet> DeleteGet(string UserId, int UserMenuTemplateOptionId)
        {
            string usp = "usp_UserMenuTemplateOptionDeleteGet @UserId, @UserMenuTemplateOptionID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuTemplateOptionDeleteGet, dynamic>(usp, new { UserId, UserMenuTemplateOptionId });

        }

        public bool DeletePost(string UserId, int UserMenuTemplateOptionId)
        {
            string usp = "usp_UserMenuTemplateOptionDeletePost @UserId, @UserMenuTemplateOptionID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, UserMenuTemplateOptionId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int UserMenuTemplateOptionId)
        {
            string usp = "usp_UserMenuTemplateOptionDeletePostCheck @UserId, @UserMenuTemplateOptionID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, UserMenuTemplateOptionId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, UserMenuTemplateOptionId });
            return ErrorMessages;
        }

        public async Task<List<UserMenuTemplateOptionLanguageIndexGet>> LanguageIndexGet(string UserId, int UserMenuTemplateOptionId)
        {
            string usp = "usp_UserMenuTemplateOptionLanguageIndex @UserId, @UserMenuTemplateOptionID";
            var x = await _sqlDataAccess.LoadData<UserMenuTemplateOptionLanguageIndexGet, dynamic>(usp, new { UserId, UserMenuTemplateOptionId });
            return x;
        }

        public Task<UserMenuTemplateOptionLanguageIndexGet> LanguageUpdateGet(string UserId, int UserMenuTemplateOptionLanguageId)
        {
            string usp = "usp_UserMenuTemplateOptionLanguageUpdateGet @UserId, @UserMenuTemplateOptionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuTemplateOptionLanguageIndexGet, dynamic>(usp, new { UserId, UserMenuTemplateOptionLanguageId });

        }
    }
}
