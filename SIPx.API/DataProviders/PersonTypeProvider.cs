
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
    public class PersonTypeProvider : IPersonTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PersonTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(PersonTypeCreateGet PersonType)
        {
            string usp = "usp_PersonTypeCreatePostCheck @CodePrefix , @CodeSuffix , @CodeTypeId , @Name, @Description,  @MenuName, @MouseOver,@Color, @IconId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonType);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(PersonTypeCreateGet PersonType)
        {
            string usp = "usp_PersonTypeCreatePost @CodePrefix , @CodeSuffix , @CodeTypeId , @Name, @Description,  @MenuName, @MouseOver,@Color, @IconId, @UserId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonType);
            return String;
        }

        public Task<List<PersonTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_PersonTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<PersonTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<PersonTypeUpdateGet> UpdateGet(string UserId, int PersonTypeId)
        {
            string usp = "usp_PersonTypeUpdateGet @UserId, @PersonTypeID";
            return _sqlDataAccess.LoadSingleRecord<PersonTypeUpdateGet, dynamic>(usp, new { UserId = UserId, PersonTypeId = PersonTypeId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(PersonTypeUpdateGet PersonType)
        {
            string usp = "usp_PersonTypeUpdatePostCheck @PersonTypeId,@CodePrefix , @CodeSuffix , @CodeTypeId ,  @Name, @Description, @MenuName, @MouseOver,  @ModifierId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonType);
            return ErrorMessages;
        }
        public bool UpdatePost(PersonTypeUpdateGet PersonType)
        {
            string usp = "usp_PersonTypeUpdatePost @PersonTypeId,@CodePrefix , @CodeSuffix , @CodeTypeId ,  @Name, @Description, @MenuName, @MouseOver,  @ModifierId";
            _sqlDataAccess.SaveData<PersonTypeUpdateGet>(usp, PersonType);
            return true;
        }

        public Task<PersonTypeDeleteGet> DeleteGet(string UserId, int PersonTypeId)
        {
            string usp = "usp_PersonTypeDeleteGet @UserId, @PersonTypeID";
            return _sqlDataAccess.LoadSingleRecord<PersonTypeDeleteGet, dynamic>(usp, new { UserId, PersonTypeId });

        }

        public bool DeletePost(string UserId, int PersonTypeId)
        {
            string usp = "usp_PersonTypeDeletePost @UserId, @PersonTypeID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PersonTypeId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonTypeId)
        {
            string usp = "usp_PersonTypeDeletePostCheck @UserId, @PersonTypeID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PersonTypeId });
            return ErrorMessages;
        }

        public Task<List<PersonTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int PersonTypeId)
        {
            string usp = "usp_PersonTypeLanguageIndexGet @UserId, @PersonTypeID";
            return _sqlDataAccess.LoadData<PersonTypeLanguageIndexGet, dynamic>(usp, new { UserId = UserId, PersonTypeId = PersonTypeId });

        }



        public async Task<List<PersonTypeList>> List(string UserId)
        {
            string usp = "usp_PersonTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<PersonTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<PersonTypeList>> ListExternal(string UserId)
        {
            string usp = "usp_PersonTypeListExternal @UserID";
            var x = await _sqlDataAccess.LoadData<PersonTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
