using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontContentProvider
    {
        Task<List<FrontContentContentType>> ContentType(string UserId, int ContentTypeGroupId);
        Task<List<FrontContentContentTypeGroup>> ContentTypeContentTypeGroup(string UserId);
        Task<List<FrontContentContentNewClassification>> NewClassifications(string UserId, int ContentTypeId);
        Task<List<FrontContentContentNewClassificationValue>> NewClassificationValues(string UserId, int ClassificationId);
        Task<bool> FrontContentCreatePost(string UserId, FrontContentContentNew Content);
        Task<FrontContentShowContent> FrontContentShowContent(string UserId, int ContentId);
    }
}