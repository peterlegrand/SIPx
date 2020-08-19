using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationRelationTypeProvider
    {
        bool CreatePost(ClassificationRelationTypeCreatePost ClassificationRelationType);
        Task<string> CreatePostCheck(ClassificationRelationTypeCreatePost ClassificationRelationType);
        Task<ClassificationRelationTypeDeleteGet> DeleteGet(string UserId, int ClassificationRelationTypeId);
        bool DeletePost(int Id);
        Task<List<ClassificationRelationTypeIndexGet>> IndexGet(string UserId);
        Task<List<ClassificationRelationTypeLanguageUpdateGet>> LanguageIndexGet(string UserId, int ClassificationRelationTypeId);
        Task<ClassificationRelationTypeLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationRelationTypeLanguageId);
        Task<List<ClassificationRelationTypeList>> List(string UserId);
        Task<List<ClassificationRelationTypeList>> ListGet(string UserId);
        Task<ClassificationRelationTypeUpdateGet> UpdateGet(string UserId, int ClassificationRelationTypeId);
        bool UpdatePost(ClassificationRelationTypeUpdateGet ClassificationRelationType);
    }
}