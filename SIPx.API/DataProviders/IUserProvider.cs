using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserProvider
    {
        bool CreatePost(UserCreateGet CreateUser);
        Task<List<ErrorMessage>> CreatePostCheck(UserCreateGet CreateUser);
        Task<UserDeleteGetPerson> DeleteGetPerson(string UserId, int SelectedPersonId);
        Task<UserDeleteGetUser> DeleteGetUser(string UserId, int SelectedPersonId);
        bool DeletePost(string UserId, int SelectedPersonId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int SelectedPersonId);
        Task<List<UserIndexGet>> IndexGet(string UserId);
        Task<List<UserList>> List();
        Task<List<string>> RoleIdForSpecificUser(string UserId);
        Task<UserUpdateGetPerson> UpdateGetPerson(int SelectedPersonId);
        Task<UserUpdateGetUser> UpdateGetUser(int SelectedPersonId);
        bool UpdatePost(UserUpdateGet UpdateUser);
        Task<List<ErrorMessage>> UpdatePostCheck(UserUpdateGet UpdateUser);
        Task<int> UserDefaultOrganization(string UserId);
        Task<List<int>> UserOrganizations(string UserId);
        Task<List<int>> UserProjects(string UserId);
        Task<List<int>> UserRoleOrganizations(string UserId, string RoleId);
        Task<List<int>> UserRoleProjects(string UserId, string RoleId);
        Task<List<string>> UserRoles(string UserId);
        Task<int> UserSecurityLevel(string UserId);
        Task<string> usp_UserUpdatePostGetUserId(int SelectedPersonId);
    }
}