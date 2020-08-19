using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonRelationTypeProvider
    {
        Task<string> CreatePost(PersonRelationTypeCreatePost PersonRelationType);
        Task<PersonRelationTypeDeleteGet> DeleteGet(string UserId, int PersonRelationTypeId);
        bool DeletePost(int Id);
        Task<List<PersonRelationType>> IndexGet(string UserId);
        Task<List<PersonRelationTypeLanguage>> LanguageIndexGet(string UserId, int PersonRelationTypeId);
        Task<PersonRelationTypeLanguage> LanguageUpdateGet(string UserId, int PersonRelationTypeLanguageId);
        Task<List<PersonRelationTypeList>> List(string UserId);
        Task<PersonRelationType> UpdateGet(string UserId, int PersonRelationTypeId);
        bool UpdatePost(PersonRelationTypeUpdateGet PersonRelationType);
    }
}