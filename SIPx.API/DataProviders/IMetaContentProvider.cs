using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IMetaContentProvider
    {
        Task<List<ContentList>> CreateGetContentList(string UserId);
        Task<List<MetaContentTypeList>> CreateGetMetaContentTypeList(string UserId);
        bool CreatePost(MetaContentCreateGet MetaContent);
        Task<List<ErrorMessage>> CreatePostCheck(MetaContentCreateGet MetaContent);
        Task<MetaContentDeleteGet> DeleteGet(string UserId, int MetaContentId);
        bool DeletePost(string UserId, int MetaContentId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int MetaContentId);
        Task<List<MetaContentIndexGetGrid>> IndexGet(string UserId, int MetaRecordId, int MetaTypeId);
    }
}