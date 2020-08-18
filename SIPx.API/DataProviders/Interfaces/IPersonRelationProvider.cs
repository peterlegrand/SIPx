using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPersonRelationProvider
    {
        Task<string> CreatePost(PersonRelationCreatePost PersonRelation);
        Task<string> CreatePostCheck(PersonRelationCreatePost PersonRelation);
        Task<List<PersonRelationIndexGet>> IndexGet(string UserId, int PersonId);
        Task<PersonRelationUpdateGet> UpdateGet(string UserId, int PersonRelationId);
        bool UpdatePost(PersonRelationUpdateGet PersonRelation);
    }
}