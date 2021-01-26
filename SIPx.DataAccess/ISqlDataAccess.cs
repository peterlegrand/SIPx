using Dapper;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ISqlDataAccess
    {
        List<T> LoadData2<T>(string sql, DynamicParameters parameters);
        Task<List<T>> LoadData<T, U>(string sql, U parameters);
        Task<List<T>> LoadData<T>(string sql);
        Task<T> LoadSingleRecord<T, U>(string sql, U parameters);
        //Task SaveData<T>(string sql);
        Task SaveData<T>(string sql, T parameters);
        Task SaveData2<T>(string sql, T parameters);
        Task PopulateDataSIP(string sql);
        Task PopulateDataMaster(string sql);
        Task<List<T>> LoadData2<T, U>(string sql, U parameters);
        Task<List<T>> LoadData4<T, U>(string sql, U parameters);
        Task<T> LoadSingleRecord<T>(string sql);
        Task<int> SaveData3(string sql, DynamicParameters parameters);
            }
}