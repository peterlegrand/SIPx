using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonTypeProvider
    {
        Task<string> CreatePost(PersonTypeCreateGet PersonType);
        Task<List<ErrorMessage>> CreatePostCheck(PersonTypeCreateGet PersonType);
        Task<PersonTypeDeleteGet> DeleteGet(string UserId, int PersonTypeId);
        bool DeletePost(string UserId, int PersonTypeId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonTypeId);
        Task<List<PersonTypeIndexGet>> IndexGet(string UserId);
        Task<List<PersonTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int PersonTypeId);
        Task<List<PersonTypeList>> List(string UserId);
        Task<List<PersonTypeList>> ListExternal(string UserId);
        Task<PersonTypeUpdateGet> UpdateGet(string UserId, int PersonTypeId);
        bool UpdatePost(PersonTypeUpdateGet PersonType);
        Task<List<ErrorMessage>> UpdatePostCheck(PersonTypeUpdateGet PersonType);
        Task<string> ReturnName(string UserId, int PersonTypeId);
    }
}