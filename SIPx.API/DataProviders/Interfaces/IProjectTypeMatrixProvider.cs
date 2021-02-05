using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProjectTypeMatrixProvider
    {
        Task<string> CreatePost(ProjectTypeMatrixCreateGet ProjectTypeMatrix);
        Task<List<ErrorMessage>> CreatePostCheck(ProjectTypeMatrixCreateGet ProjectTypeMatrix);
        Task<ProjectTypeMatrixDeleteGet> DeleteGet(string UserId, int ProjectTypeMatrixId);
        bool DeletePost(string UserId, int ProjectTypeMatrixId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProjectTypeMatrixId);
        Task<List<ProjectTypeMatrixIndexGetGrid>> IndexGet(string UserId, int ProjectTypeId);
        Task<ProjectTypeMatrixUpdateGet> UpdateGet(string UserId, int ProjectTypeMatrixId);
        bool UpdatePost(ProjectTypeMatrixUpdateGet ProjectTypeMatrix);
        Task<List<ErrorMessage>> UpdatePostCheck(ProjectTypeMatrixUpdateGet ProjectTypeMatrix);
    }
}