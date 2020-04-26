using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ISqlDataAccess
    {
        List<T> LoadData2<T>(string sql, List<SqlParameter> parameters);
        Task<List<T>> LoadData<T, U>(string sql, U parameters);
        Task<T> LoadSingleRecord<T, U>(string sql, U parameters);
        Task SaveData<T>(string sql, T parameters);
        Task PopulateDataSIP(string sql);
        Task PopulateDataMaster(string sql);

    }
}