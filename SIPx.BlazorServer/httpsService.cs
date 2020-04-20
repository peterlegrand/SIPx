using Newtonsoft.Json;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.BlazorServer
{
    public class HttpsService : IHttpsService
    {
        private readonly HttpClient _httpClient;

        public HttpsService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<string> httpPostService<T>(T Object, string Uri)
        {

            var jsonData = JsonConvert.SerializeObject(Object);

            var content = new StringContent(jsonData, Encoding.UTF8, "application/json");

            var response = await _httpClient.PostAsync(Uri, content);

            var responseBody = await response.Content.ReadAsStringAsync();
            return responseBody;
        }
    }
}
