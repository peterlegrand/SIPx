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

        public List<UITermLanguageCustomizationList> IndexGet(string Controller, string Action, string UserId)
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
        public async Task<string> OneTerm(string InternalName, string UserId)
        {
            string usp = "usp_MVCUITermLanguageCustomizationOneTerm @InternalName, @UserId";
            // List<SqlParameter> parameters = new List<SqlParameter> {new SqlParameter ("@Controller" , Controller),
            var TermString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { InternalName, UserId });
            return TermString;
        }
        public async Task<string> TableNameToOneTerm(string TableName, string UserId, bool IsPlural, string Prefix, string Suffix)
        {
            string usp = "usp_MVCUITermLanguageCustomizationTableNameToOneTerm @TableName, @UserId, @IsPlural, @Prefix, @Suffix";
            var TermString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { TableName, UserId, IsPlural, Prefix, Suffix });
            return TermString;
        }
        public async Task<string> ParentTableNameToOneTerm(string ChildTableName, string UserId, bool IsPlural, string Prefix, string Suffix)
        {
            string usp = "usp_MVCUITermLanguageCustomizationParentTableNameToOneTerm @ChildTableName, @UserId, @IsPlural, @Prefix, @Suffix";
            var TermString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { ChildTableName, UserId, IsPlural, Prefix, Suffix });
            return TermString;
        }

    }
}
