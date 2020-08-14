using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeClassificationStatusProvider
    {
        Task<List<ContentTypeClassificationStatus>> ContentTypeClassificationStatusIndexGet(string UserId);
        Task<ContentTypeClassificationStatus> ContentTypeClassificationStatusUpdateGet(string UserId, int ContentTypeClassificationStatusId);
    }
}