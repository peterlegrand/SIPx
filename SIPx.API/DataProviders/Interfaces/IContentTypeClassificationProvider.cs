using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentTypeClassificationProvider
    {
        Task<List<ContentTypeClassification>> IndexGet(string UserId, int ContentTypeId);
        Task<ContentTypeClassification> UpdateGet(string UserId, int ContentTypeClassificationId);
    }
}