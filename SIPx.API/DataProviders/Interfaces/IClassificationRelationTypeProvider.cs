using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationRelationTypeProvider
    {
        bool CreatePost(ClassificationRelationTypeCreatePost ClassificationRelationType);
        Task<List<ErrorMessage>> CreatePostCheck(ClassificationRelationTypeCreateGet ClassificationRelationType);
        Task<ClassificationRelationTypeDeleteGet> DeleteGet(string UserId, int ClassificationRelationTypeId);
        bool DeletePost(int Id);
        Task<List<ClassificationRelationTypeIndexGet>> IndexGet(string UserId);
        Task<List<ClassificationRelationTypeLanguageUpdateGet>> LanguageIndexGet(string UserId, int ClassificationRelationTypeId);
        Task<ClassificationRelationTypeLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationRelationTypeLanguageId);
        Task<List<ClassificationRelationTypeList>> List(string UserId);
        Task<ClassificationRelationTypeUpdateGet> UpdateGet(string UserId, int ClassificationRelationTypeId);
        Task<List<ErrorMessage>> UpdatePostCheck(ClassificationRelationTypeUpdateGet ClassificationRelationType);
        bool UpdatePost(ClassificationRelationTypeUpdateGet ClassificationRelationType);
    }
}