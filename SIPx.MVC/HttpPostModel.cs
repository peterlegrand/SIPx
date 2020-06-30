using Newtonsoft.Json;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.MVC
{
    public class HttpPostModel
    {
        //PETER PROBABLY NO NEED
        public async Task<string> HttpPostAModel<T>(T model)
        {
            HttpClient client = new HttpClient();

            var jsonData = JsonConvert.SerializeObject(model);

            var content = new StringContent(jsonData, Encoding.UTF8, "application/json");

            var response = await client.PostAsync("https://localhost:44393/api/auth/login", content);

            var responseBody = await response.Content.ReadAsStringAsync();

            var responseObject = JsonConvert.DeserializeObject<UserManagerResponse>(responseBody);
            return "sd";
        }
    }
}
