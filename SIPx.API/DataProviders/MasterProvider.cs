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
    public class MasterProvider : IMasterProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public MasterProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<LanguageList> UserLanguageUpdateGet(string UserId)
        {
            string usp = "usp_GetUserLanguageUpdateGet @UserID";
            var x = await _sqlDataAccess.LoadSingleRecord<LanguageList, dynamic>(usp, new { UserId = UserId });
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

        public async Task<List<UITermLanguage>> UITermLanguageIndexGet(string UserId,int TermID)
        {
            string usp = "usp_UITermLanguageIndexGet @UserID, @TermID";
            var x = await _sqlDataAccess.LoadData<UITermLanguage, dynamic>(usp, new { UserId = UserId, TermID });
            return x;
        }

        public Task<UITermLanguage> UITermLanguageUpdateGet(string UserId, int UITermLanguageId)
        {
            string usp = "usp_UITermLanguageUpdateGet @UserId, @UITermLanguageID";
            return _sqlDataAccess.LoadSingleRecord<UITermLanguage, dynamic>(usp, new { UserId = UserId, UITermLanguageId = UITermLanguageId });

        }

        public async Task<List<UITerm>> UITermIndexGet(string UserId)
        {
            string usp = "usp_UITermIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<UITerm, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<UITerm> UITermUpdateGet(string UserId, int UITermId)
        {
            string usp = "usp_UITermUpdateGet @UserId, @UITermID";
            return _sqlDataAccess.LoadSingleRecord<UITerm, dynamic>(usp, new { UserId = UserId, UITermId = UITermId });

        }

        public async Task<bool> PostObjectLanguageCheck(string TableName, int LanguageId, int BaseId)
        {
            string usp = "usp_LanguageOnLanguageObject @TableName, @LanguageId, @BaseId";
            var x = await _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { TableName = TableName, LanguageId = LanguageId, BaseId = BaseId });
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
