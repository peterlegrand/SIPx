using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeGroupProvider
    {
        Task<string> CreatePost(ContentTypeGroupCreatePost ContentTypeGroup);
        Task<string> CreatePostCheck(ContentTypeGroupCreatePost ContentTypeGroup);
        Task<List<ContentTypeGroup>> IndexGet(string UserId);
        Task<List<ContentTypeGroupList>> List(string UserId);
        Task<ContentTypeGroup> UpdateGet(string UserId, int ContentTypeGroupId);
    }
}