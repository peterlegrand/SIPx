using Microsoft.AspNetCore.Components;
using SIPx.BlazorServer.Services;
using SIPx.Shared;
using System.Threading.Tasks;

namespace SIPx.BlazorServer.Pages
{
    public class LoginBase : ComponentBase
    {
        [Inject]
        public ILoginService loginService { get; set; }
        public UserManagerResponse y { get; set; } = new UserManagerResponse { Message = "" };
        public LoginViewModel LoginModel { get; set; } = new LoginViewModel();
        // protected override  Task OnInitializedAsync()
        //{
        //    LoginModel.Email = "eplegrand@gmail.com";
        //    LoginModel.Password = "Pipo!9165";
        //    //            y = await loginService.Login();
        //    return  ;
        //}
        protected override void OnInitialized()
        {
            LoginModel.Email = "eplegrand@gmail.com";
            LoginModel.Password = "Pipo!9165";

            base.OnInitialized();
        }
        public async Task SubmitLogin()
        {
            y.Message = "load";
            y = await loginService.Login(LoginModel);
        }
    }
}
