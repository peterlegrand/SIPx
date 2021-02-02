using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using SIPx.CallAPI;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.MVC.Classes
{
    public class LoadViewBagModel
    {
        readonly ServiceClient _client = new ServiceClient();
        public async Task<ViewBagModel> ViewBagLoad(string Controller, string Action, string token, string EnvironmentName, IConfiguration configuration, bool IsReadLogIntRecord, int ReadLogIntRecord = 0, string ReadLogStringRecord = "")
        {
            ViewBagModel ViewBagSet = new ViewBagModel();
            ViewBagSet.UITerms = await _client.GetProtectedAsync<List<UITermLanguageCustomizationList>>($"{configuration["APIUrl"]}api/MVC/{Controller}/{Action}", token);
            ViewBagSet.Favorites = await _client.GetProtectedAsync<List<MVCFavoriteMenu>>($"{configuration["APIUrl"]}api/MVCFavorite/Menu", token);
            ViewBagSet.FavoriteGroupList = await _client.GetProtectedAsync<List<MVCFavoriteGroupList>>($"{configuration["APIUrl"]}api/MVCFavorite/GroupList", token);
            ViewBagSet.Env = EnvironmentName;
            ViewBagSet.MVCUIScreenId = await _client.GetProtectedAsync<string>($"{configuration["APIUrl"]}api/MVCUIScreen/ScreenId?Controller={Controller}&Action={Action}", token);
            var ErrorMessage = new List<ErrorMessage>();
            var ReadLogGetGrid = new List<ReadLogGet>();
            var x = new LogParameters() { ActionName = Action, ControllerName = Controller, IsIntRecordId = IsReadLogIntRecord, IntRecordId = ReadLogIntRecord, StringRecordId = ReadLogStringRecord };
            var Readlog = await _client.PostProtectedAsync<List<ReadLogGet>>($"{configuration["APIUrl"]}api/Log/ReadLogView", x, token);

            ViewBagSet.ReadLogGetGrid = ReadLogGetGrid;
            ViewBagSet.ErrorMessages = ErrorMessage;
            return (ViewBagSet);
        }
    }
}
