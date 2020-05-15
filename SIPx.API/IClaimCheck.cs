using SIPx.API.Models;
using System.Threading.Tasks;

namespace SIPx.API
{
    public interface IClaimCheck
    {
        Task<bool> CheckClaim(SipUser User, string ClaimValue);
    }
}