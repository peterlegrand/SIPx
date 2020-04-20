using SIPx.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Components;
using SIPx.BlazorServer.Pages;

namespace SIPx.BlazorServer.Services
{
    public class ClassificationService : IClassificationService
    {
        private readonly HttpClient _httpClient;

        //public ClassificationService(HttpClient httpClient)
        //{
        //    _httpClient = httpClient;
        //}

        public Task<IEnumerable<AdminClassificationDetails>> getclassifications()
        {
            throw new NotImplementedException();
        }
        //  public async Task<IEnumerable<AdminClassificationDetails>> getclassifications()
        //  {
        ////      return await  HttpClientJsonExtensions.GetJsonAsync<List<AdminClassificationDetails>>(_httpClient, "api/");
        //  }
    }
}
