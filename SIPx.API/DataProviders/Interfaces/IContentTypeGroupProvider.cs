using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeGroupProvider
    {
        Task<string> ContentTypeGroupCreatePost(ContentTypeGroupCreatePost ContentTypeGroup);
        Task<string> ContentTypeGroupCreatePostCheck(ContentTypeGroupCreatePost ContentTypeGroup);
        Task<List<ContentTypeGroup>> ContentTypeGroupIndexGet(string UserId);
        Task<List<ContentTypeGroupList>> ContentTypeGroupList(string UserId);
        Task<ContentTypeGroup> ContentTypeGroupUpdateGet(string UserId, int ContentTypeGroupId);
    }
}