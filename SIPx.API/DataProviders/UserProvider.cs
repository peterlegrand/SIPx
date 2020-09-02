
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
    public class UserProvider : IUserProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public bool CreatePost(UserCreateGet CreateUser)
        {
            string usp = "usp_UserCreatePost @Salutation , @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DefaultOrganizationId, @Email, @ModifierCreator ";
            _sqlDataAccess.SaveData<UserCreateGet>(usp, CreateUser);
            return true;
        }

        public async Task<List<UserIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_UserIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<UserIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public Task<UserUpdateGetPerson> UpdateGetPerson(int SelectedPersonId)
        {
            string usp = "usp_UserUpdateGetPerson @SelectedPersonId";
            return _sqlDataAccess.LoadSingleRecord<UserUpdateGetPerson, dynamic>(usp, new { SelectedPersonId = SelectedPersonId });
        }
        public Task<UserUpdateGetUser> UpdateGetUser(int SelectedPersonId)
        {
            string usp = "usp_UserUpdateGetUser @SelectedPersonId";
            return _sqlDataAccess.LoadSingleRecord<UserUpdateGetUser, dynamic>(usp, new { SelectedPersonId = SelectedPersonId });
        }
        public Task<string> usp_UserUpdatePostGetUserId(int SelectedPersonId)
        {
            string usp = "usp_UserUpdatePostGetUserId @SelectedPersonId";
            return _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { SelectedPersonId = SelectedPersonId });
        }
        public bool UpdatePost(UserUpdateGet UpdateUser)
        {
            string usp = "usp_UserUpdatePost @PersonId , @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId , @BirthDate, @DefaultOrganizationId , @ModifierId ";
            _sqlDataAccess.SaveData<UserUpdateGet>(usp, UpdateUser);
            return true;
        }

        public Task<UserDeleteGetPerson> DeleteGetPerson(string UserId, int SelectedPersonId)
        {
            string usp = "usp_UserDeleteGetPerson @UserId, @SelectedPersonID";
            return _sqlDataAccess.LoadSingleRecord<UserDeleteGetPerson, dynamic>(usp, new { UserId, SelectedPersonId });

        }
        public Task<UserDeleteGetUser> DeleteGetUser(string UserId, int SelectedPersonId)
        {
            string usp = "usp_UserDeleteGetUser @UserId, @SelectedPersonId";
            return _sqlDataAccess.LoadSingleRecord<UserDeleteGetUser, dynamic>(usp, new { UserId, SelectedPersonId });

        }
        public bool DeletePost(int SelectedPersonId)
        {
            string usp = "usp_UserDeletePost @SelectedPersonId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { SelectedPersonId = SelectedPersonId });
            return true;
        }

        public Task<List<UserList>> List()
        {
            string usp = "usp_UserList";
            return _sqlDataAccess.LoadData<UserList>(usp);

        }
    }
}
