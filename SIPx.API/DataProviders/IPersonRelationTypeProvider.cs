using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonRelationTypeProvider
    {
        Task<List<PersonRelationType>> PersonRelationTypeIndexGet(string UserId);
        Task<List<PersonRelationTypeLanguage>> PersonRelationTypeLanguageIndexGet(string UserId, int PersonRelationTypeId);
        Task<PersonRelationTypeLanguage> PersonRelationTypeLanguageUpdateGet(string UserId, int PersonRelationTypeLanguageId);
        Task<List<PersonRelationTypeList>> PersonRelationTypeList(string UserId);
        Task<PersonRelationType> PersonRelationTypeUpdateGet(string UserId, int PersonRelationTypeId);
    }
}