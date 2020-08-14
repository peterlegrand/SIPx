using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeClassificationProvider
    {
        Task<List<ContentTypeClassification>> ContentTypeClassificationIndexGet(string UserId, int ContentTypeId);
        Task<ContentTypeClassification> ContentTypeClassificationUpdateGet(string UserId, int ContentTypeClassificationId);
    }
}