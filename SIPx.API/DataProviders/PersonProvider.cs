
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
    public class PersonProvider : IPersonProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PersonProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePostCheck(PersonCreatePost Person)
        {
            string usp = "usp_PersonCreateCheck @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId , @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Person);
            return CheckString;
        }
        public async Task<string> CreatePost(PersonCreatePost Person)
        {
            string usp = "usp_PersonCreatePost @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Person);
            return CheckString;
        }
        public Task<List<PersonIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_PersonIndexGet @UserID";
            return _sqlDataAccess.LoadData<PersonIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<PersonUpdateGet> UpdateGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonUpdateGet @UserId, @PersonID";
            return _sqlDataAccess.LoadSingleRecord<PersonUpdateGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });
        }
        public bool UpdatePost(PersonUpdateGet Person)
        {
            string usp = "usp_PersonUpdatePost @PersonId , @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId, @ModifierId";
            _sqlDataAccess.SaveData<PersonUpdateGet>(usp, Person);
            return true;
        }

        public Task<List<PersonList>> List()
        {
            string usp = "usp_PersonList";
            return _sqlDataAccess.LoadData<PersonList>(usp);
        }
        public Task<PersonDeleteGet> DeleteGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonDeleteGet @UserId, @PersonID";
            return _sqlDataAccess.LoadSingleRecord<PersonDeleteGet, dynamic>(usp, new { UserId, PersonId });

        }
        public bool DeletePost(int PersonId)
        {
            string usp = "usp_PersonDeletePost @PersonId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { PersonId = PersonId });
            return true;
        }

    }
}
