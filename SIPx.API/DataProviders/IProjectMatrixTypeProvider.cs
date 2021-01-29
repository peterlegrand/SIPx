using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectMatrixTypeProvider
    {
        bool CreatePost(ProjectMatrixTypeCreateGet ProjectMatrixType);
        Task<List<ErrorMessage>> CreatePostCheck(ProjectMatrixTypeCreateGet ProjectMatrixType);
        Task<ProjectMatrixTypeDeleteGet> DeleteGet(string UserId, int ProjectMatrixTypeId);
        bool DeletePost(string UserId, int ProjectMatrixTypeId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProjectMatrixTypeId);
        Task<List<ProjectMatrixTypeIndexGet>> IndexGet(string UserId);
        Task<List<ProjectMatrixTypeList>> List(string UserId);
        Task<ProjectMatrixTypeUpdateGet> UpdateGet(string UserId, int ProjectMatrixTypeId);
        Task<bool> UpdatePost(ProjectMatrixTypeUpdateGet ProjectMatrixType);
        Task<List<ErrorMessage>> UpdatePostCheck(ProjectMatrixTypeUpdateGet ProjectMatrixType);
    }
}