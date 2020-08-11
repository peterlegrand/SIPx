
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

        public async Task<LanguageList> UserLanguageUpdateGet(string UserId)
        {
            string usp = "usp_GetUserLanguageUpdateGet @UserID";
            var x = await _sqlDataAccess.LoadSingleRecord<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<LanguageList>> LanguageList(string UserId)
        {
            string usp = "usp_LanguageList @UserID";
            var x = await _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<Language>> LanguageIndexGet(string UserId)
        {
            string usp = "usp_LanguageIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<Language, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<LanguageList>> LanguagesActiveList(string UserId)
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

        public async Task<bool> PostObjectLanguageCheck(string TableName, int LanguageId, int Id)
        {
            string usp = "usp_LanguageOnLanguageObject @TableName, @LanguageId, @Id";
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
