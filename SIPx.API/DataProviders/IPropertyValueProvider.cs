using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPropertyValueProvider
    {
        Task<List<SequenceList>> CreateGetSequence(string UserId, int PropertyId);
        Task<int> CreateGetType(string UserId, int PropertyId);
        bool CreatePost(PropertyValueCreateGet PropertyValue);
        Task<List<ErrorMessage>> CreatePostCheck(PropertyValueCreateGet PropertyValue);
        Task<PropertyValueDeleteGet> DeleteGet(string UserId, int PropertyValueId);
        bool DeletePost(string UserId, int PropertyValueId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PropertyValueId);
        Task<List<PropertyValueIndexGet>> IndexGet(string UserId, int PropertyId);
        Task<List<PropertyList>> List(string UserId);
        Task<PropertyValueUpdateGet> UpdateGet(string UserId, int PropertyValueId);
        bool UpdatePost(PropertyValueUpdateGet PropertyValue);
        Task<List<ErrorMessage>> UpdatePostCheck(PropertyValueUpdateGet PropertyValue);
    }
}