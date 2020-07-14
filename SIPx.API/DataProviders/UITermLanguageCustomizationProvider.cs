using System.Data.SqlClient;
using SIPx.DataAccess;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dapper;

namespace SIPx.API.DataProviders
{
    public class UITermLanguageCustomizationProvider : IUITermLanguageCustomizationProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UITermLanguageCustomizationProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public List<UITermLanguageCustomizationList> UITermLanguageCustomizationIndexGet(string Controller, string Action, string UserId)
        {
            string usp = "usp_MVCUITermLanguageCustomizationIndexGet @Controller, @Action, @UserId";
            // List<SqlParameter> parameters = new List<SqlParameter> {new SqlParameter ("@Controller" , Controller),
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@Controller", Controller);
            parameters.Add("@Action", Action);
            parameters.Add("@UserId", UserId);

            var x = _sqlDataAccess.LoadData2<UITermLanguageCustomizationList>(usp, parameters);
            return x;
        }

    }
}
