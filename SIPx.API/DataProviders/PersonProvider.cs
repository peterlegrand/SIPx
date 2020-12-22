
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

        public async Task<List<ErrorMessage>> CreatePostCheck(PersonCreateGet Person)
        {
            string usp = "usp_PersonCreateCheck @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId , @CreatorId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Person);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(PersonCreatePost Person)
        {
            string usp = "usp_PersonCreatePost @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DefaultOrganizationId, @UserId, @CreatorId ";
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
        public async Task<List<ErrorMessage>> UpdatePostCheck(PersonUpdateGet Person)
        {
            string usp = "usp_PersonUpdateCheck @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId , @CreatorId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Person);
            return ErrorMessages;
        }
        public bool UpdatePost(PersonUpdateGet Person)
        {
            string usp = "usp_PersonUpdatePost @PersonId , @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId, @ModifierId";
            _sqlDataAccess.SaveData<PersonUpdateGet>(usp, Person);
            return true;
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

        public Task<List<PersonList>> List()
        {
            string usp = "usp_PersonList";
            return _sqlDataAccess.LoadData<PersonList>(usp);
        }
        public Task<List<UserList>> CreateGetUsers()
        {
            string usp = "usp_PersonCreateGetUsers";
            return _sqlDataAccess.LoadData<UserList>(usp);
        }
        public Task<List<UserList>> EditGetUsers(int PersonId)
        {
            string usp = "usp_PersonCreateGetUsers @PersonId";
            return _sqlDataAccess.LoadData<UserList,dynamic>(usp, new { PersonId });
        }
        public Task<List<PersonSearch>> Search(string Contains, string UserId)
        {
            string usp = "usp_PersonSearch @Contains, @UserId";
            return _sqlDataAccess.LoadData<PersonSearch, dynamic>(usp, new { Contains, UserId });
        }
        //
        public async Task<List<PersonAdvancedSearchResult>> AdvancedSearch(string UserId, PersonAdvancedSearchPost AdvancedSearch)
        {
            string usp = "usp_PersonAdvancedSearch @UserId, @Contains, @Age, @BirthDate, @MainOrganizationId, @IsUser, @RoleId, @OrganizationId, @ProjectId, @CountryId, @ProvinceState, @County, @City, @ClassificationId, @ClassificationValueId ";
            var x = await _sqlDataAccess.LoadData<PersonAdvancedSearchResult, dynamic>(usp,  AdvancedSearch );
            return x;
        }
        //

        public async Task<List<PersonForPanel>> Panel(string UserId, string PersonConditionSQLFrom, string PersonConditionSQLWhere, string PersonConditionSQLContains)
        {
            string usp = "usp_PersonForPanel @UserId, @PersonConditionSQLFrom, @PersonConditionSQLWhere,@PersonConditionSQLContains ";
            var x = await _sqlDataAccess.LoadData<PersonForPanel, dynamic>(usp, new { UserId = UserId, PersonConditionSQLFrom = PersonConditionSQLFrom, PersonConditionSQLWhere = PersonConditionSQLWhere, PersonConditionSQLContains = PersonConditionSQLContains });
            return x;
        }
        public async Task<List<PersonForPanelCondition>> PanelCondition(int PageSectionId)
        {
            string usp = "usp_PersonForPanelCondition @PageSectionId";
            var x = await _sqlDataAccess.LoadData<PersonForPanelCondition, dynamic>(usp, new { PageSectionId = PageSectionId });
            return x;
        }
    }
}
