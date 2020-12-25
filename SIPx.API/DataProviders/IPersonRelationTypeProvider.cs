using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonRelationTypeProvider
    {
        Task<string> CreatePost(PersonRelationTypeCreateGet PersonRelationType);
        Task<List<ErrorMessage>> CreatePostCheck(PersonRelationTypeCreateGet PersonRelationType);
        Task<PersonRelationTypeDeleteGet> DeleteGet(string UserId, int PersonRelationTypeId);
        bool DeletePost(string UserId, int PersonRelationTypeId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonRelationTypeId);
        Task<List<PersonRelationTypeIndexGet>> IndexGet(string UserId);
        Task<List<PersonRelationTypeList>> List(string UserId);
        Task<PersonRelationTypeUpdateGet> UpdateGet(string UserId, int PersonRelationTypeId);
        bool UpdatePost(PersonRelationTypeUpdateGet PersonRelationType);
        Task<List<ErrorMessage>> UpdatePostCheck(PersonRelationTypeUpdateGet PersonRelationType);
    }
}