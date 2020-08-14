using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonRelationProvider
    {
        Task<string> PersonRelationCreatePost(PersonRelationCreatePost PersonRelation);
        Task<string> PersonRelationCreatePostCheck(PersonRelationCreatePost PersonRelation);
        Task<List<PersonRelationIndexGet>> PersonRelationIndexGet(string UserId, int PersonId);
        Task<List<PersonRelationType>> PersonRelationTypeIndexGet(string UserId);
        Task<List<PersonRelationTypeLanguage>> PersonRelationTypeLanguageIndexGet(string UserId, int PersonRelationTypeId);
        Task<PersonRelationTypeLanguage> PersonRelationTypeLanguageUpdateGet(string UserId, int PersonRelationTypeLanguageId);
        Task<List<PersonRelationTypeList>> PersonRelationTypeList(string UserId);
        Task<PersonRelationType> PersonRelationTypeUpdateGet(string UserId, int PersonRelationTypeId);
        Task<PersonRelationUpdateGet> PersonRelationUpdateGet(string UserId, int PersonRelationId);
    }
}