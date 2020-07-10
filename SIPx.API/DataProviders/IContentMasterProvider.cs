using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentMasterProvider
    {
        Task<ContentStatus> GetContentStatus(string UserId, int ContentStatusId);
        Task<List<ContentStatus>> GetContentStatuses(string UserId);
        Task<ContentType> GetContentType(string UserId, int ContentTypeId);
        Task<ContentTypeClassification> GetContentTypeClassification(string UserId, int ContentTypeClassificationId);
        Task<List<ContentTypeClassification>> GetContentTypeClassifications(string UserId, int ContentTypeId);
        Task<ContentTypeClassificationStatus> GetContentTypeClassificationStatus(string UserId, int ContentTypeClassificationStatusId);
        Task<List<ContentTypeClassificationStatus>> GetContentTypeClassificationStatuses(string UserId);
        Task<ContentTypeGroup> GetContentTypeGroup(string UserId, int ContentTypeGroupId);
        Task<ContentTypeGroupLanguage> GetContentTypeGroupLanguage(string UserId, int ContentTypeGroupLanguageId);
        Task<List<ContentTypeGroupLanguage>> GetContentTypeGroupLanguages(string UserId, int ContentTypeGroupId);
        Task<List<ContentTypeGroup>> GetContentTypeGroups(string UserId);
        Task<ContentTypeLanguage> GetContentTypeLanguage(string UserId, int ContentTypeLanguageId);
        Task<List<ContentTypeLanguage>> GetContentTypeLanguages(string UserId, int ContentTypeId);
        Task<List<ContentTypeList>> GetContentTypeList(string UserId);
        Task<List<ContentType>> GetContentTypes(string UserId);
    }
}