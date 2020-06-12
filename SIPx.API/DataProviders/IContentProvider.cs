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
        List<ClassificationViewGet> GetClassifications2(int LanguageId);
        bool PostClassification(ClassificationCreatePost Classification);
        bool PutClassification(ClassificationUpdatePut Classification);
    }
}