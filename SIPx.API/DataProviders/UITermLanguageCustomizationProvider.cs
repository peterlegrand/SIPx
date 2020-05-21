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

        public List<UITermLanguageCustomization> GetUITermLanguageCustomization(string Controller, string Action, int LanguageId)
        {
            string usp = "usp_MVCUITermLanguageCustomizationsGet @Controller, @Action, @LanguageID";
            // List<SqlParameter> parameters = new List<SqlParameter> {new SqlParameter ("@Controller" , Controller),
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@Controller", Controller);
            parameters.Add("@Action", Action);
            parameters.Add("@LanguageID", LanguageId);
            
            var x = _sqlDataAccess.LoadData2<UITermLanguageCustomization>(usp, parameters);
            return x;
        }

    }
}
