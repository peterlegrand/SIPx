using Blazored.LocalStorage;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Authorization;
using SIPx.BlazorServer.Models;
using SIPx.BlazorServer.Services;
using SIPx.Shared;
using System.Security.Claims;
using System.Threading.Tasks;

namespace SIPx.BlazorServer.Pages
{
    public class LoginBase : ComponentBase
    {
        [Inject]
        public ILocalStorageService storageService { get; set; }
        [Inject]
        public ILoginService loginService { get; set; }
        [Inject]
        public AuthenticationStateProvider authenticationStateProvider { get; set; }
        public UserManagerResponse loginResult { get; set; } = new UserManagerResponse { Message = "" };
        public LoginViewModel LoginModel { get; set; } = new LoginViewModel();


        public bool isBusy = false;

        
        protected override void OnInitialized()
        {
            LoginModel.Email = "eplegrand2@gmail.com";
            LoginModel.Password = "Pipo!9165";

            base.OnInitialized();
        }
        public async Task SubmitLogin()
        {
            isBusy = true;
            loginResult.Message = "load";
            loginResult = await loginService.Login(LoginModel);
            if (loginResult.IsSuccess)
            {
                var userInfo = new LocalUserInfo()
                {
                    AccessToken = loginResult.Message,
                    Email = loginResult.UserInfo["Email"].Trim(),
                    FirstName = loginResult.UserInfo["FirstName"].Trim(),
                    LastName = loginResult.UserInfo["LastName"].Trim(),
                    Id = loginResult.UserInfo[System.Security.Claims.ClaimTypes.NameIdentifier],
                };
                await storageService.SetItemAsync("User", userInfo);
                await authenticationStateProvider.GetAuthenticationStateAsync();

                isBusy = false;
                    }

        }
    }
}
