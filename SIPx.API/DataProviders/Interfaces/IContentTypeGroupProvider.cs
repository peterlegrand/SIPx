using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeGroupProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId);
        Task<string> CreatePost(ContentTypeGroupCreateGet ContentTypeGroup);
        Task<List<ErrorMessage>> CreatePostCheck(ContentTypeGroupCreateGet ContentTypeGroup);
        Task<ContentTypeGroupDeleteGet> DeleteGet(string UserId, int ContentTypeGroupId);
        bool DeletePost(string UserId, int ContentTypeGroupId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ContentTypeGroupId);
        Task<List<ContentTypeGroupIndexGet>> IndexGet(string UserId);
        Task<List<ContentTypeGroupList>> List(string UserId);
        Task<ContentTypeGroupUpdateGet> UpdateGet(string UserId, int ContentTypeGroupId);
        bool UpdatePost(ContentTypeGroupUpdateGet ContentTypeGroup);
        Task<List<ErrorMessage>> UpdatePostCheck(ContentTypeGroupUpdateGet ContentTypeGroup);
    }
}