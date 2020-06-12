using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentProvider
    {
        Task<ClassificationViewGet> GetClassificationById(int Id, int LanguageId);
        Task<List<Content>> GetContents(string UserID);
        Task<List<ContentType>> GetContentTypes(string UserID);
        Task<ContentCreateListSet> GetContentCreateListSet(string UserID, int ContentTypeID);
        Task<List<ClassificationValueList>> GetContentCreateListSet2(string UserID, int ClassificationID);
        List<ClassificationViewGet> GetClassifications2(int LanguageId);
        bool PostClassification(ClassificationCreatePost Classification);
        bool PutClassification(ClassificationUpdatePut Classification);

        Task<List<LanguageList>> GetLanguageList(string UserID);
        Task<List<ClassificationList>> GetClassificationList(string UserID, int ContentTypeID);
        Task<List<OrganizationList>> GetOrganizationList(string UserID);

    }
}