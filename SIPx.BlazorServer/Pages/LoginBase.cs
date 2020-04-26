using Microsoft.AspNetCore.Components;
using SIPx.BlazorServer.Models;
using SIPx.BlazorServer.Services;
using SIPx.Shared;
using System.Threading.Tasks;

namespace SIPx.BlazorServer.Pages
{
    public class LoginBase : ComponentBase
    {
        [Inject]
        public ILoginService loginService { get; set; }
        public UserManagerResponse loginResult { get; set; } = new UserManagerResponse { Message = "" };
        public LoginViewModel LoginModel { get; set; } = new LoginViewModel();
        
        protected override void OnInitialized()
        {
            LoginModel.Email = "eplegrand@gmail.com";
            LoginModel.Password = "Pipo!9165";

            base.OnInitialized();
        }
        public async Task SubmitLogin()
        {
            loginResult.Message = "load";
            loginResult = await loginService.Login(LoginModel);
            if (loginResult.IsSuccess)
            {
                //var userInfo = new LocalUserInfo()
                //{ AccessToken = loginResult.Message,
                //Email = loginResult.UserInfo[}
                    }

        }
    }
}
