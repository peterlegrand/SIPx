using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontProjectProvider
    {
        Task<FrontProjectIndexGet> IndexGet(string UserId, int ProjectId);
        Task<List<FrontProjectIndexGetContent>> IndexGetContent(string UserId, int ProjectId);
        Task<List<FrontProjectIndexGetMember>> IndexGetMember(string UserId, int ProjectId);
        Task<List<FrontProjectIndexGetProcess>> IndexGetProcess(string UserId, int ProjectId);
        Task<List<FrontOrganizationIndexGetSubProject>> IndexGetSubProject(string UserId, int ProjectId);
        //Task<string> IndexGetSubProjectTree(string UserId, int ProjectId);
    }
}