using SIPx.Shared;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontClassificationValueProvider
    {
        Task<FrontClassificationValueDashboard> Dashboard(string UserId, int ClassificationValueId);
    }
}