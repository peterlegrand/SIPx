
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

        public async Task<List<ErrorMessage>> CreatePostCheck(UserCreateGet CreateUser)
        {
            string usp = "usp_UserCreatePostCheck @Salutation , @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DefaultOrganizationId, @Email, @ModifierCreator ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, CreateUser);
            return ErrorMessages;
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
        public async Task<List<ErrorMessage>> UpdatePostCheck(UserUpdateGet UpdateUser)
        {
            string usp = "usp_UserUpdatePostCheck @PersonId , @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId , @BirthDate, @DefaultOrganizationId , @UserModifierId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, UpdateUser);
            return ErrorMessages;
        }
        public bool UpdatePost(UserUpdateGet UpdateUser)
        {
            string usp = "usp_UserUpdatePost @PersonId , @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId , @BirthDate, @DefaultOrganizationId , @UserModifierId ";
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
        public Task<int> UserSecurityLevel(string UserId)
        {
            string usp = "usp_UserSecurityLevel @UserId";
            return _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { UserId = UserId });
        }
        public Task<List<string>> UserRoles(string UserId)
        {
            string usp = "usp_UserRoles @UserId, @UserRoleUserId";
            return _sqlDataAccess.LoadData<string, dynamic>(usp, new { UserId = UserId, UserRoleUserId = UserId });
        }
        public Task<List<string>> RoleIdForSpecificUser(string UserId)
        {
            string usp = "usp_RoleIdForSpecificUser @UserId";
            return _sqlDataAccess.LoadData<string, dynamic>(usp, new { UserId = UserId});
        }
        public Task<List<int>> UserOrganizations(string UserId)
        {
            string usp = "usp_UserOrganizations @UserId";
            return _sqlDataAccess.LoadData<int, dynamic>(usp, new { UserId = UserId });
        }
        public Task<int> UserDefaultOrganization(string UserId)
        {
            string usp = "usp_UserDefaultOrganization @UserId";
            return _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { UserId = UserId });
        }
        public Task<List<int>> UserProjects(string UserId)
        {
            string usp = "usp_UserProjects @UserId";
            return _sqlDataAccess.LoadData<int, dynamic>(usp, new { UserId = UserId });
        }
        public Task<List<int>> UserRoleOrganizations(string UserId, string RoleId)
        {
            string usp = "usp_UserRoleOrganizations @UserId, @RoleId";
            return _sqlDataAccess.LoadData<int, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });
        }
        public Task<List<int>> UserRoleProjects(string UserId, string RoleId)
        {
            string usp = "usp_UserRoleProjects @UserId, @RoleId";
            return _sqlDataAccess.LoadData<int, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });
        }
    }
}
