using SIPx.API.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentMasterProvider
    {
        Task<ContentStatus> GetContentStatus(string UserID, int ContentStatusID);
        Task<List<ContentStatus>> GetContentStatuses(string UserID);
        Task<ContentType> GetContentType(string UserID, int ContentTypeID);
        Task<ContentTypeClassification> GetContentTypeClassification(string UserID, int ContentTypeClassificationID);
        Task<List<ContentTypeClassification>> GetContentTypeClassifications(string UserID, int ContentTypeID);
        Task<ContentTypeClassificationStatus> GetContentTypeClassificationStatus(string UserID, int ContentTypeClassificationStatusID);
        Task<List<ContentTypeClassificationStatus>> GetContentTypeClassificationStatuses(string UserID);
        Task<ContentTypeGroup> GetContentTypeGroup(string UserID, int ContentTypeGroupID);
        Task<ContentTypeGroupLanguage> GetContentTypeGroupLanguage(string UserID, int ContentTypeGroupLanguageID);
        Task<List<ContentTypeGroupLanguage>> GetContentTypeGroupLanguages(string UserID, int ContentTypeGroupID);
        Task<List<ContentTypeGroup>> GetContentTypeGroups(string UserID);
        Task<ContentTypeLanguage> GetContentTypeLanguage(string UserID, int ContentTypeLanguageID);
        Task<List<ContentTypeLanguage>> GetContentTypeLanguages(string UserID, int ContentTypeID);
        Task<List<ContentType>> GetContentTypes(string UserID);
    }
}