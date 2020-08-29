using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontUserProvider
    {
        Task<FrontUserIndexGet> IndexGet(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontUserIndexGetAddress>> IndexGetAddress(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontUserIndexGetContent>> IndexGetContent(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontUserIndexGetOrganization>> IndexGetOrganization(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontUserIndexGetProcess>> IndexGetProcess(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontUserIndexGetProject>> IndexGetProject(string CurrentUserId, int SelectedPersonId);
        Task<List<FrontUserIndexGetTelecom>> IndexGetTelecom(string CurrentUserId, int SelectedPersonId);
    }
}