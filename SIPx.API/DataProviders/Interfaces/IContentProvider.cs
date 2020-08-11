using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentProvider
    {
        Task<ClassificationIndexGet> GetClassificationById(int Id, int LanguageId);
        Task<List<Content>> GetContents(string UserId);
        Task<List<ContentType>> GetContentTypes(string UserId);
        Task<ContentCreateListSet> GetContentCreateListSet(string UserId, int ContentTypeId);
        Task<List<ClassificationValueList>> GetContentCreateListSet2(string UserId, int ClassificationId);
        List<ClassificationIndexGet> GetClassifications2(int LanguageId);
        //bool PostClassification(ClassificationCreatePost Classification);
        //bool PutClassification(ClassificationUpdatePut Classification);

        Task<List<LanguageList>> GetLanguageList(string UserId);
        Task<List<ClassificationList>> GetClassificationList(string UserId, int ContentTypeId);
        Task<List<OrganizationList>> GetOrganizationList(string UserId);
        Task<List<ContentForPanel>> ContentForPanel(string UserId);
    }
}