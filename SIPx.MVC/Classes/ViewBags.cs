using SIPx.CallAPI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.MVC.Classes
{
    public class ViewBags
    {
        readonly ServiceClient _client = new ServiceClient();
        private readonly string _baseUrl = "https://localhost:44393/";

        public async static void Create<T>(string APIPath, string token)
        {
          //  ViewBag.Favorites = await _client.GetProtectedAsync<List<T>>($"{_baseUrl}{APIPath}", token);

        }
    }
}
