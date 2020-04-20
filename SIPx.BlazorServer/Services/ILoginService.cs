using SIPx.Shared;
using System.Threading.Tasks;

namespace SIPx.BlazorServer.Services
{
    public interface ILoginService
    {
        Task<UserManagerResponse> Login(LoginViewModel model);
    }
}