
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
    public class PersonRelationProvider : IPersonRelationProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PersonRelationProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public Task<List<PersonRelationIndexGet>> PersonRelationIndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonRelationIndexGet @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonRelationIndexGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<PersonRelationUpdateGet> PersonRelationUpdateGet(string UserId, int PersonRelationId)
        {
            string usp = "usp_PersonRelationUpdateGet @UserId, @PersonRelationID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationUpdateGet, dynamic>(usp, new { UserId = UserId, PersonRelationId = PersonRelationId });

        }
        public Task<List<PersonRelationTypeLanguage>> PersonRelationTypeLanguageIndexGet(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeLanguageIndexGet @UserId, @PersonRelationTypeID";
            return _sqlDataAccess.LoadData<PersonRelationTypeLanguage, dynamic>(usp, new { UserId = UserId, PersonRelationTypeId = PersonRelationTypeId });

        }
        public Task<PersonRelationTypeLanguage> PersonRelationTypeLanguageUpdateGet(string UserId, int PersonRelationTypeLanguageId)
        {
            string usp = "usp_PersonRelationTypeLanguageUpdateGet @UserId, @PersonRelationTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationTypeLanguage, dynamic>(usp, new { UserId = UserId, PersonRelationTypeLanguageId = PersonRelationTypeLanguageId });

        }
        public Task<List<PersonRelationType>> PersonRelationTypeIndexGet(string UserId)
        {
            string usp = "usp_PersonRelationTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<PersonRelationType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<PersonRelationType> PersonRelationTypeUpdateGet(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeUpdateGet @UserId, @PersonRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationType, dynamic>(usp, new { UserId = UserId, PersonRelationTypeId = PersonRelationTypeId });

        }
        public Task<List<PersonRelationTypeList>> PersonRelationTypeList(string UserId)
        {
            string usp = "usp_PersonRelationTypeList @UserID";
            return _sqlDataAccess.LoadData<PersonRelationTypeList, dynamic>(usp, new { UserId = UserId });
        }
        public async Task<string> PersonRelationCreatePostCheck(PersonRelationCreatePost PersonRelation)
        {
            string usp = "usp_PersonRelationCreatePostCheck @FromPersonId, @ToPersonId, @ValidFrom, @ValidTill, @PersonRelationTypeId, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonRelation);
            return CheckString;
        }
        public async Task<string> PersonRelationCreatePost(PersonRelationCreatePost PersonRelation)
        {
            string usp = "usp_PersonRelationCreatePost @FromPersonId, @ToPersonId, @ValidFrom, @ValidTill, @PersonRelationTypeId, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonRelation);
            return CheckString;
        }

    }
}
