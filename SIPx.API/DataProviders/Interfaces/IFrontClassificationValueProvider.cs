using SIPx.Shared;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontClassificationValueProvider
    {
        Task<FrontClassificationValueIndexGet> Dashboard(string UserId, int ClassificationValueId);
    }
}