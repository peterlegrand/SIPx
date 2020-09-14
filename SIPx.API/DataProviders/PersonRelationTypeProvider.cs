
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
    public class PersonRelationTypeProvider : IPersonRelationTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PersonRelationTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePost(PersonRelationTypeCreatePost PersonRelationType)
        {
            string usp = "usp_PersonRelationTypeCreatePost @Name, @Description , @MenuName, @MouseOver, @FromIsAnXOfTo, @ToIsAnXOfFrom, @SeePersonal, @Color, @IconId, @UserId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonRelationType);
            return CheckString;
        }

        public Task<List<PersonRelationTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_PersonRelationTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<PersonRelationTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<PersonRelationTypeUpdateGet> UpdateGet(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeUpdateGet @UserId, @PersonRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationTypeUpdateGet, dynamic>(usp, new { UserId = UserId, PersonRelationTypeId = PersonRelationTypeId });

        }

        public bool UpdatePost(PersonRelationTypeUpdateGet PersonRelationType)
        {
            string usp = "usp_PersonRelationTypeUpdatePost @PersonRelationTypeId, @Name, @Description, @MenuName, @MouseOver, @FromIsAnXOfTo, @ToIsAnXOfFrom,@SeePersonal, @Color, @IconId, @ModifierId";
            _sqlDataAccess.SaveData<PersonRelationTypeUpdateGet>(usp, PersonRelationType);
            return true;
        }

        public Task<PersonRelationTypeDeleteGet> DeleteGet(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeDeleteGet @UserId, @PersonRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationTypeDeleteGet, dynamic>(usp, new { UserId, PersonRelationTypeId });

        }

        public bool DeletePost(int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeDeletePost @PersonRelationTypeId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { PersonRelationTypeId = PersonRelationTypeId });
            return true;
        }

        //public Task<List<PersonRelationTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int PersonRelationTypeId)
        //{
        //    string usp = "usp_PersonRelationTypeLanguageIndexGet @UserId, @PersonRelationTypeID";
        //    return _sqlDataAccess.LoadData<PersonRelationTypeLanguage, dynamic>(usp, new { UserId = UserId, PersonRelationTypeId = PersonRelationTypeId });

        //}

        //public Task<PersonRelationTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int PersonRelationTypeLanguageId)
        //{
        //    string usp = "usp_PersonRelationTypeLanguageUpdateGet @UserId, @PersonRelationTypeLanguageID";
        //    return _sqlDataAccess.LoadSingleRecord<PersonRelationTypeLanguage, dynamic>(usp, new { UserId = UserId, PersonRelationTypeLanguageId = PersonRelationTypeLanguageId });

        //}

        public Task<List<PersonRelationTypeList>> List(string UserId)
        {
            string usp = "usp_PersonRelationTypeList @UserID";
            return _sqlDataAccess.LoadData<PersonRelationTypeList, dynamic>(usp, new { UserId = UserId });
        }

    }
}
