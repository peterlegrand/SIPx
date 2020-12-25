
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

        public async Task<List<ErrorMessage>> CreatePostCheck(PersonRelationCreateGet PersonRelation)
        {
            string usp = "usp_PersonRelationCreatePostCheck @FromPersonId, @ToPersonId, @ValidFrom, @ValidTill, @PersonRelationTypeId, @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonRelation);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(PersonRelationCreateGet PersonRelation)
        {
            string usp = "usp_PersonRelationCreatePost @FromPersonId, @ToPersonId, @ValidFrom, @ValidTill, @PersonRelationTypeId, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonRelation);
            return CheckString;
        }

        public Task<List<PersonRelationIndexGet>> IndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonRelationIndexGet @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonRelationIndexGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }

        public Task<PersonRelationUpdateGet> UpdateGet(string UserId, int PersonRelationId)
        {
            string usp = "usp_PersonRelationUpdateGet @UserId, @PersonRelationID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationUpdateGet, dynamic>(usp, new { UserId = UserId, PersonRelationId = PersonRelationId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(PersonRelationUpdateGet PersonRelation)
        {
            string usp = "usp_PersonRelationUpdatePostCheck @FromPersonId, @ToPersonId, @ValidFrom, @ValidTill, @PersonRelationTypeId, @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonRelation);
            return ErrorMessages;
        }
        public bool UpdatePost(PersonRelationUpdateGet PersonRelation)
        {
            string usp = "usp_PersonRelationUpdatePost @PersonRelationId ,  @FromPersonId, @ToPersonId, @ValidFrom, @ValidTill, @PersonRelationTypeId, @ModifierId";
            _sqlDataAccess.SaveData<PersonRelationUpdateGet>(usp, PersonRelation);
            return true;
        }

        public Task<PersonRelationDeleteGet> DeleteGet(string UserId, int PersonRelationId)
        {
            string usp = "usp_PersonRelationDeleteGet @UserId, @PersonRelationID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationDeleteGet, dynamic>(usp, new { UserId, PersonRelationId });

        }

        public bool DeletePost(string UserId, int PersonRelationId)
        {
            string usp = "usp_PersonRelationDeletePost @UserId, @PersonRelationID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PersonRelationId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonRelationId)
        {
            string usp = "usp_PersonRelationDeletePostCheck @UserId, @PersonRelationID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PersonRelationId });
            return ErrorMessages;
        }

    }
}
