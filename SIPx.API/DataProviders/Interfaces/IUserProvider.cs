using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserProvider
    {
        Task<List<UserIndexGet>> IndexGet(string UserId);
        Task<List<UserList>> List();
        //Task<UserUpdateGet> UpdateGet(string UserId, string SelectedUserId);
        bool CreatePost(UserCreateGet CreateUser);
        Task<UserUpdateGetPerson> UpdateGetPerson(int SelectedPersonId);
        Task<UserUpdateGetUser> UpdateGetUser(int SelectedPersonId);
        bool UpdatePost(UserUpdateGet UpdateUser);
        Task<string> usp_UserUpdatePostGetUserId(int SelectedPersonId);
        Task<UserDeleteGetUser> DeleteGetUser(string UserId, int SelectedPersonId);
        Task<UserDeleteGetPerson> DeleteGetPerson(string UserId, int SelectedPersonId);
        bool DeletePost(int SelectedPersonId);
        Task<int> UserSecurityLevel(string UserId);
        Task<List<string>> UserRoles(string UserId);
        Task<List<int>> UserOrganizations(string UserId);
        Task<int> UserDefaultOrganization(string UserId);
        Task<List<int>> UserRoleProjects(string UserId, string RoleId);
        Task<List<int>> UserProjects(string UserId);
        Task<List<int>> UserRoleOrganizations(string UserId, string RoleId);

    }
}