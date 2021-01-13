
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
    public class BaseProvider : IBaseProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public BaseProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }


        public async Task<List<LanguageList>> CreateGetLanguages(int BaseId, string BaseType, string UserId)
        {
            string usp = "usp_BaseLanguageCreateGetLanguageList @BaseId, @BaseType, @UserID";
            var LanguageList = await _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { BaseId, BaseType, UserId });
            return LanguageList;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(BaseLanguageCreateGet BaseLanguage)
        {
            string usp = "usp_BaseLanguageCreatePostCheck @BaseType, @BaseId, @LanguageId, @Name, @Description, @MouseOver, @MenuName, @UserID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, BaseLanguage);
            return ErrorMessages;
        }

        public bool CreatePost(BaseLanguageCreateGet BaseLanguage)
        {
            string usp = "usp_BaseLanguageCreatePost @BaseType, @BaseId, @LanguageId, @Name, @Description, @MouseOver, @MenuName, @UserID";
            _sqlDataAccess.SaveData<BaseLanguageCreateGet>(usp, BaseLanguage);
            return true;
        }

        public async Task<List<BaseLanguageIndexGetGrid>> IndexGet(string BaseType, int BaseId, string UserId)
        {
            string usp = "usp_BaseLanguageIndexGet @BaseType, @BaseId, @UserID";
            List<BaseLanguageIndexGetGrid> x = await _sqlDataAccess.LoadData<BaseLanguageIndexGetGrid, dynamic>(usp, new { BaseType, BaseId, UserId });
            return x;
        }

        public Task<BaseLanguageUpdateGet> UpdateGet(string BaseType, int BaseLanguageId, string UserId)
        {
            string usp = "usp_BaseLanguageUpdateGet @BaseType, @BaseLanguageID, @UserId";
            return _sqlDataAccess.LoadSingleRecord<BaseLanguageUpdateGet, dynamic>(usp, new { BaseType, BaseLanguageId, UserId });
        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(BaseLanguageUpdateGet BaseLanguage)
        {
            string usp = "usp_BaseLanguageUpdatePostCheck @BaseType, @BaseLanguageId, @Name , @Description , @MenuName , @MouseOver, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, BaseLanguage);
            return ErrorMessages;
        }

        public bool UpdatePost(BaseLanguageUpdateGet BaseLanguage)
        {
            string usp = "usp_BaseLanguageUpdatePost @BaseType, @BaseLanguageId, @Name , @Description , @MenuName , @MouseOver, @UserId ";
            _sqlDataAccess.SaveData<BaseLanguageUpdateGet>(usp, BaseLanguage);
            return true;
        } //PETER TODO In the stored procedure the check on hasdropdown is not yet ok.

        public Task<BaseLanguageDeleteGet> DeleteGet(string BaseType, int BaseLanguageId, string UserId)
        {
            string usp = "usp_BaseLanguageDeleteGet @BaseType, @BaseLanguageID, @UserId";
            return _sqlDataAccess.LoadSingleRecord<BaseLanguageDeleteGet, dynamic>(usp, new { BaseType, BaseLanguageId, UserId });

        }
        public Task<string> BaseTypeToTable(string BaseType)
        {
            string usp = "usp_BaseTypeToTable @BaseType";
            return _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { BaseType});

        }
        public bool DeletePost(string UserId, int BaseId)
        {
            string usp = "usp_BaseLanguageDeletePost @UserId, @BaseID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, BaseId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int BaseId)
        {
            string usp = "usp_BaseLanguageDeletePostCheck @UserId, @BaseID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, BaseId });
            return ErrorMessages;
        }
    }
}
