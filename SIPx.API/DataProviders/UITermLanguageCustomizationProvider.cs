using Microsoft.Data.SqlClient;
using SIPx.DataAccess;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.DataProviders
{
    public class UITermLanguageCustomizationProvider : IUITermLanguageCustomizationProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UITermLanguageCustomizationProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<UITermLanguageCustomization>> GetUITermLanguageCustomization(string Controller, string Action, int LanguageId)
        {
            string usp = "usp_MVCUITermLanguageCustomizationsGet @Controller, @Action, @LanguageID";
            SqlParameter[] parameters =  {new SqlParameter ("@Controller" , Controller),
                new SqlParameter ("@Action" , Action),
                new SqlParameter ("@LanguageID" , LanguageId),
            };
            var x = await _sqlDataAccess.LoadData<UITermLanguageCustomization, SqlParameter[]>(usp, parameters);
            return x;
        }

    }
}
