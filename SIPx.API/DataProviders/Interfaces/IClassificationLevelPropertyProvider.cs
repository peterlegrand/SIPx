using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationLevelPropertyProvider
    {
        Task<ClassificationLevelPropertyCreateGet> CreateGet(string UserId, int ClassificationLevelId);
        Task<List<PropertyList>> CreateGetPropertyList(string UserId, int ClassificationLevelId);
        bool CreatePost(ClassificationLevelPropertyCreateGet ClassificationLevelProperty);
        Task<ClassificationLevelPropertyDeleteGet> DeleteGet(string UserId, int ClassificationLevelPropertyId);
        bool DeletePost(int ClassificationLevelPropertyId);
        Task<List<ClassificationLevelPropertyIndexGet>> IndexGet(string UserId, int ClassificationLevelId);
        Task<ClassificationLevelPropertyUpdateGet> UpdateGet(string UserId, int ClassificationLevelPropertyId);
        bool UpdatePost(ClassificationLevelPropertyUpdateGet ClassificationLevelProperty);
        Task<List<ErrorMessage>> CreatePostCheck(ClassificationLevelPropertyCreateGet ClassificationLevelProperty);
        Task<List<ErrorMessage>> UpdatePostCheck(ClassificationLevelPropertyUpdateGet ClassificationLevelProperty);
    }
}