using SIPx.Shared;
using System.Threading.Tasks;

namespace SIPx.API.Services
{
    public interface IUserService
    {
        Task<UserManagerResponse> LoginUserAsync(LoginViewModel model);
        Task<UserManagerResponse> RegisterUserAsync(RegisterViewModel model);
    }
}