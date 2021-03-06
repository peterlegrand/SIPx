﻿
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

        public bool CreatePost(UserMenuTemplateCreateGet UserMenuTemplate)
        {
            string usp = "usp_UserMenuTemplateCreatePost @Name, @Description, @MenuName, @MouseOver, @CreatorID";
            _sqlDataAccess.SaveData<UserMenuTemplateCreateGet>(usp, UserMenuTemplate);
            return true;
        }

        public async Task<List<UserMenuTemplateIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_UserMenuTemplateIndexGet @UserID";
            List<UserMenuTemplateIndexGet> x = await _sqlDataAccess.LoadData<UserMenuTemplateIndexGet, dynamic>(usp, new { UserId });
            return x;
        }

        public Task<UserMenuTemplateUpdateGet> UpdateGet(string UserId, int UserMenuTemplateID)
        {
            string usp = "usp_UserMenuTemplateUpdateGet @UserId, @UserMenuTemplateID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuTemplateUpdateGet, dynamic>(usp, new { UserId, UserMenuTemplateID });

        }

        public bool UpdatePut(UserMenuTemplateUpdateGet UserMenuTemplate)
        {
            string usp = "usp_UserMenuTemplateUpdatePut @UserMenuTemplateId, @Name , @Description , @MenuName , @MouseOver , @ModifierId ";
            _sqlDataAccess.SaveData<UserMenuTemplateUpdateGet>(usp, UserMenuTemplate);
            return true;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(UserMenuTemplateCreateGet UserMenuTemplate)
        {
            string usp = "usp_UserMenuTemplateCreatePostCheck @Name, @Description, @MenuName, @MouseOver, @CreatorID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, UserMenuTemplate);
            return ErrorMessages;
        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(UserMenuTemplateUpdateGet UserMenuTemplate)
        {
            string usp = "usp_UserMenuTemplateUpdatePost @UserId, @UserMenuTemplateID, @Name, @Description, @MenuName, @MouseOver";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, UserMenuTemplate);
            return ErrorMessages;
        }

        public async Task<List<UserMenuTemplateLanguageIndexGet>> LanguageIndexGet(string UserId, int UserMenuTemplateId)
        {
            string usp = "usp_UserMenuTemplateLanguageIndexGet @UserId, @UserMenuTemplateID";
            var x = await _sqlDataAccess.LoadData<UserMenuTemplateLanguageIndexGet, dynamic>(usp, new { UserId, UserMenuTemplateId });
            return x;
        }

        public Task<UserMenuTemplateLanguageIndexGet> LanguageUpdateGet(string UserId, int UserMenuTemplateLanguageId)
        {
            string usp = "usp_UserMenuTemplateLanguageUpdateGet @UserId, @UserMenuTemplateLanguageID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuTemplateLanguageIndexGet, dynamic>(usp, new { UserId, UserMenuTemplateLanguageId });

        }


        public bool UpdatePost(UserMenuTemplateUpdateGet UserMenuTemplate)
        {
            string usp = "usp_UserMenuTemplateUpdatePost @UserId, @UserMenuTemplateID, @Name, @Description, @MenuName, @MouseOver";
            _sqlDataAccess.SaveData<UserMenuTemplateUpdateGet>(usp, UserMenuTemplate);
            return true;
        }



        public Task<UserMenuTemplateDeleteGet> DeleteGet(string UserId, int UserMenuTemplateId)
        {
            string usp = "usp_UserMenuTemplateDeleteGet @UserId, @UserMenuTemplateID";
            return _sqlDataAccess.LoadSingleRecord<UserMenuTemplateDeleteGet, dynamic>(usp, new { UserId, UserMenuTemplateId });

        }

        public bool DeletePost(string UserId, int UserMenuTemplateId)
        {
            string usp = "usp_UserMenuTemplateDeletePost @UserId, @UserMenuTemplateID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, UserMenuTemplateId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int UserMenuTemplateId)
        {
            string usp = "usp_UserMenuTemplateDeletePostCheck @UserId, @UserMenuTemplateID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, UserMenuTemplateId });
            return ErrorMessages;
        }

    }
}
