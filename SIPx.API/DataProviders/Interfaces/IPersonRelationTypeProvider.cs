using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonRelationTypeProvider
    {
        Task<List<ErrorMessage>> CreatePostCheck(PersonRelationTypeCreateGet PersonRelationType);
        Task<string> CreatePost(PersonRelationTypeCreateGet PersonRelationType);
        Task<PersonRelationTypeDeleteGet> DeleteGet(string UserId, int PersonRelationTypeId);
        bool DeletePost(int Id);
        Task<List<PersonRelationTypeIndexGet>> IndexGet(string UserId);
        //Task<List<PersonRelationTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int PersonRelationTypeId);
        //Task<PersonRelationTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int PersonRelationTypeLanguageId);
        Task<List<PersonRelationTypeList>> List(string UserId);
        Task<PersonRelationTypeUpdateGet> UpdateGet(string UserId, int PersonRelationTypeId);
        Task<List<ErrorMessage>> UpdatePostCheck(PersonRelationTypeUpdateGet PersonRelationType);
        bool UpdatePost(PersonRelationTypeUpdateGet PersonRelationType);
    }
}