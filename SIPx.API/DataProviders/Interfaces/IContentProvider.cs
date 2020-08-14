using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentProvider
    {
        bool ClassificationUpdatePost(ClassificationUpdatePost Classification);
        Task<List<ContentForPanel>> ContentForPanel(string UserId);
        Task<ClassificationIndexGet> GetClassificationById(int Id, int LanguageId);
        Task<List<ClassificationList>> GetClassificationList(string UserId, int ContentTypeId);
        List<ClassificationIndexGet> GetClassifications2(int LanguageId);
        Task<ContentCreateListSet> GetContentCreateListSet(string UserId, int ContentTypeId);
        Task<List<ClassificationValueList>> GetContentCreateListSet2(string UserId, int ClassificationId);
        Task<List<Content>> GetContents(string UserId);
        Task<List<ContentType>> GetContentTypes(string UserId);
        Task<List<LanguageList>> GetLanguageList(string UserId);
        Task<List<OrganizationList>> GetOrganizationList(string UserId);
        bool PostClassification(ClassificationCreatePost Classification);
    }
}