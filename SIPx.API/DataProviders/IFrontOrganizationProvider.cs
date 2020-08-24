using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontOrganizationProvider
    {
        Task<FrontOrganizationIndexGet> IndexGet(string UserId, int OrganizationId);
        Task<List<FrontOrganizationIndexGetContent>> IndexGetContent(string UserId, int OrganizationId);
        Task<List<FrontOrganizationIndexGetMember>> IndexGetMember(string UserId, int OrganizationId);
        Task<List<FrontOrganizationIndexGetProcess>> IndexGetProcess(string UserId, int OrganizationId);
        Task<List<FrontOrganizationIndexGetSubOrganization>> IndexGetSubOrganization(string UserId, int OrganizationId);
        Task<string> IndexGetSubOrganizationTree(string UserId, int OrganizationId);
    }
}