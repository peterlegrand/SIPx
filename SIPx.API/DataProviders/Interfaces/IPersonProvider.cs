using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonProvider
    {
        Task<List<PersonAdvancedSearchResult>> AdvancedSearch(string UserId, PersonAdvancedSearchPost AdvancedSearch);
        Task<List<UserList>> CreateGetUsers();
        Task<string> CreatePost(PersonCreateGet Person);
        Task<List<ErrorMessage>> CreatePostCheck(PersonCreateGet Person);
        Task<PersonDeleteGet> DeleteGet(string UserId, int PersonId);
        bool DeletePost(string UserId, int PersonId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonId);
        Task<List<UserList>> EditGetUsers(int PersonId);
        Task<List<PersonIndexGet>> IndexGet(string UserId);
        Task<List<PersonList>> List();
        Task<List<PersonForPanel>> Panel(string UserId, string PersonConditionSQLFrom, string PersonConditionSQLWhere, string PersonConditionSQLContains);
        Task<List<PersonForPanelCondition>> PanelCondition(int PageSectionId);
        Task<List<PersonSearch>> Search(string Contains, string UserId);
        Task<PersonUpdateGet> UpdateGet(string UserId, int PersonId);
        bool UpdatePost(PersonUpdateGet Person);
        Task<List<ErrorMessage>> UpdatePostCheck(PersonUpdateGet Person);
    }
}