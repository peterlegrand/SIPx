
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

        public Task<List<PersonIndexGet>> PersonIndexGet(string UserId)
        {
            string usp = "usp_PersonIndexGet @UserID";
            return _sqlDataAccess.LoadData<PersonIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<PersonUpdateGet> PersonUpdateGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonUpdateGet @UserId, @PersonID";
            return _sqlDataAccess.LoadSingleRecord<PersonUpdateGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });
        }
        public Task<List<PersonList>> PersonList(string UserId)
        {
            string usp = "usp_PersonList @UserID";
            return _sqlDataAccess.LoadData<PersonList, dynamic>(usp, new { UserId = UserId });
        }
        public async Task<string> PersonCreatePostCheck(PersonCreatePost Person)
        {
            string usp = "usp_PersonCreateCheck @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId , @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Person);
            return CheckString;
        }
        public async Task<string> PersonCreatePost(PersonCreatePost Person)
        {
            string usp = "usp_PersonCreatePost @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Person);
            return CheckString;
        }

    }
}
