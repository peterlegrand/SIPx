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
    public class LanguageProvider : ILanguageProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public LanguageProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<LanguageIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_LanguageIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<LanguageIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<LanguageUpdateGet> UpdateGet(string UserId, int LanguageId)
        {
            string usp = "usp_LanguageUpdateGet @UserId, @LanguageID";
            return _sqlDataAccess.LoadSingleRecord<LanguageUpdateGet, dynamic>(usp, new { UserId = UserId, LanguageId = LanguageId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(LanguageUpdateGet Language)
        {

            string usp = "usp_LanguageUpdatePostCheck @LanguageId, @StatusId, @ModifierID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Language);
            return ErrorMessages;
        }

        public bool UpdatePost(LanguageUpdateGet Language)
        {
            string usp = "usp_LanguageUpdatePost @LanguageId, @StatusId, @ModifierID";
            _sqlDataAccess.SaveData<LanguageUpdateGet>(usp, Language);
            return true;
        }

        public async Task<LanguageList> UserLanguageUpdateGet(string UserId)
        {
            string usp = "usp_GetUserLanguageUpdateGet @UserID";
            var x = await _sqlDataAccess.LoadSingleRecord<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<LanguageList>> List(string UserId)
        {
            string usp = "usp_LanguageList @UserID";
            var x = await _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<LanguageList>> ActiveDefaultList()
        {
            string usp = "usp_ActiveDefaultList";
            var x = await _sqlDataAccess.LoadData<LanguageList>(usp);
            return x;
        }

        public async Task<List<LanguageList>> ActiveList(string UserId)
        {
            string usp = "usp_LanguagesActiveList @UserID";
            var x = await _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<List<UITermLanguageCustomization>> UITermLanguageCustomizationIndexGet(string UserId)
        {
            string usp = "usp_UITermLanguageCustomizationIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<UITermLanguageCustomization, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<UITermLanguageCustomization> UITermLanguageCustomizationUpdateGet(string UserId, int UITermLanguageCustomizationId)
        {
            string usp = "usp_UITermLanguageCustomizationUpdateGet @UserId, @UITermLanguageCustomizationID";
            return _sqlDataAccess.LoadSingleRecord<UITermLanguageCustomization, dynamic>(usp, new { UserId = UserId, UITermLanguageCustomizationId = UITermLanguageCustomizationId });

        }

        public async Task<List<UITermLanguage>> UITermLanguageIndexGet(string UserId)
        {
            string usp = "usp_UITermLanguageIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<UITermLanguage, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<UITermLanguage> UITermLanguageUpdateGet(string UserId, int UITermLanguageId)
        {
            string usp = "usp_UITermLanguageUpdateGet @UserId, @UITermLanguageID";
            return _sqlDataAccess.LoadSingleRecord<UITermLanguage, dynamic>(usp, new { UserId = UserId, UITermLanguageId = UITermLanguageId });

        }

        public async Task<bool> NoOfLanguagesOnLanguageObject(string TableName, int LanguageId, int Id)
        {
            string usp = "usp_NoOfLanguagesOnLanguageObject @TableName, @LanguageId, @Id";
            var x = await _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { TableName = TableName, LanguageId = LanguageId, Id = Id });
            if (x > 0)
                return (false);
            return (true);
        }

        public bool PostObjectLanguage(ObjectLanguageCreatePost ObjectLanguage)
        {
            string usp = "usp_ObjectLanguageCreate @TableName, @ObjectId, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<ObjectLanguageCreatePost>(usp, ObjectLanguage);
            return true;
        }
    }
}
