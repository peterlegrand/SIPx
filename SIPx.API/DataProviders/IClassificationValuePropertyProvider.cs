using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationValuePropertyProvider
    {
        Task<List<PropertyList>> CreateGetProperties(string UserId, int ClassificationValueId);
        Task<ClassificationValuePropertyCreateGet> CreateGetPropertyType(string UserId, int PropertyId);
        Task<List<PropertyValueList>> CreateGetPropertyValueList(string UserId, int PropertyId);
        bool CreatePost(ClassificationValuePropertyCreateGet ClassificationValueProperty);
        Task<List<ErrorMessage>> CreatePostCheck(ClassificationValuePropertyCreateGet ClassificationValueProperty);
        Task<ClassificationValuePropertyDeleteGet> DeleteGet(string UserId, int ClassificationValuePropertyId);
        bool DeletePost(string UserId, int ClassificationValuePropertyId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ClassificationValuePropertyId);
        Task<List<ClassificationValuePropertyIndexGet>> IndexGet(string UserId, int ClassificationValueId);
        Task<ClassificationValuePropertyUpdateGet> UpdateGet(string UserId, int ClassificationValuePropertyId);
        bool UpdatePost(ClassificationValuePropertyUpdateGet ClassificationValueProperty);
        Task<List<ErrorMessage>> UpdatePostCheck(ClassificationValuePropertyUpdateGet ClassificationValueProperty);
    }
}