using Microsoft.AspNetCore.Components;
using Newtonsoft.Json;
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
    public class LoginService
    {
        private readonly HttpClient _httpClient;

        public LoginService(HttpClient httpClient)
        {
            _httpClient = httpClient;

        }
    public async Task<LoginReturn> Login(Login login)
        {
            var jsonData = JsonConvert.SerializeObject(login);
            var content = new StringContent(jsonData, Encoding.UTF8, "Application/json");
            var response = await _httpClient.PostAsync("https://localhost:44393/api/Auth/Login", content);
            var responseBody = await response.Content.ReadAsStringAsync();
            var responseObject = JsonConvert.DeserializeObject<()

            await HttpClientJsonExtensions.PostJsonAsync<Login>(_httpClient, "api/Login",login); 
        }
    
    }
}
