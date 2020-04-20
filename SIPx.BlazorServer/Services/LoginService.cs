using Microsoft.AspNetCore.Components;
using Newtonsoft.Json;
using SIPx.Shared;
using SIPx.Shared.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Runtime.CompilerServices;
using System.Text;
//using System.Security.Cryptography.X509Certificates;
//using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace SIPx.BlazorServer.Services
{
    public class LoginService : ILoginService
    {
        private readonly IHttpsService _httpsService;

        public LoginService(IHttpsService httpsService)
        {
            _httpsService = httpsService;
        }

        public async Task<UserManagerResponse> Login(LoginViewModel model) 
        {

            //var model = new LoginViewModel
            //{
            //    Email = "eplegrand@gmail.com",
            //    Password = "Pipo!9165",
            //};

            var responseObject = JsonConvert.DeserializeObject<UserManagerResponse>(await _httpsService.httpPostService<LoginViewModel>(model, "api/auth/login"));

            return responseObject;
        }

    }
}
