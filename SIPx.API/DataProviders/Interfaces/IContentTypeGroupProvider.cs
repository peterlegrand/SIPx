using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeGroupProvider
    {
        Task<string> CreatePost(ContentTypeGroupCreatePost ContentTypeGroup);
        Task<List<ErrorMessage>> CreatePostCheck(ContentTypeGroupCreateGet ContentTypeGroup);
        Task<ContentTypeGroupDeleteGet> DeleteGet(string UserId, int ContentTypeGroupId);
        bool DeletePost(int Id);
        Task<List<ContentTypeGroupIndexGet>> IndexGet(string UserId);
        Task<List<ContentTypeGroupList>> List(string UserId);
        Task<ContentTypeGroupUpdateGet> UpdateGet(string UserId, int ContentTypeGroupId);
        Task<List<ErrorMessage>> UpdatePostCheck(ContentTypeGroupUpdateGet ContentTypeGroup);
        bool UpdatePost(ContentTypeGroupUpdateGet ContentTypeGroup);
        Task<List<SequenceList>> CreateGetSequence(string UserId);
    }
}