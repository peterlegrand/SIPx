using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class SqlDataAccess : ISqlDataAccess
    {
        private readonly IConfiguration _config;
        //   public string ConnectionString { get; set; } = "Default";

        public SqlDataAccess(IConfiguration config)
        {
            _config = config;
        }

        public List<T> LoadData2<T>(string sql, DynamicParameters parameters)
        {

            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = connection.Query<T>(sql, parameters);
                return data.ToList();
            }
        }
        public async Task<List<T>> LoadData<T, U>(string sql, U parameters)
        {
            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = await connection.QueryAsync<T>(sql, parameters);
                return data.ToList();
            }
        }
        public async Task<List<T>> LoadData4<T, U>(string sql, U parameters)
        {
            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = await connection.QueryAsync<T>(sql, parameters, commandType: CommandType.StoredProcedure);
                return data.ToList();
            }
        }

        public async Task<List<T>> LoadData<T, U>(string sql)
        {
            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = await connection.QueryAsync<T>(sql);
                return data.ToList();
            }
        }
        public async Task<List<T>> LoadData<T>(string sql)
        {
            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = await connection.QueryAsync<T>(sql);
                return data.ToList();
            }
        }

        //PETER the difference between this and LoadData is that it returns a single record
        //PETER DOTO maybe no need for this, and use the top only
        public async Task<T> LoadSingleRecord<T>(string sql)
        {
            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = await connection.QueryAsync<T>(sql);
                return data.ToList().First();
            }
        }
        public async Task<T> LoadSingleRecord<T, U>(string sql, U parameters)
        {
            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = await connection.QueryAsync<T>(sql, parameters);
                return data.ToList().First();
            }
        }
        public async Task SaveData<T>(string sql, T parameters)
        {
            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = await connection.ExecuteAsync(sql, parameters);
            }
        }

        public async Task<List<T>> LoadData2<T, U>(string sql, U parameters)
        {
            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = await connection.QueryAsync<T>(sql, parameters, commandType: CommandType.StoredProcedure);
                return data.ToList();
            }
        }

        public async Task SaveData2<T>(string sql, T parameters)
        {
            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {

                var data = await connection.ExecuteAsync(sql, parameters,commandType : CommandType.StoredProcedure);
            }
        }

        public async Task PopulateDataMaster(string sql)
        {
            string connectionString = _config.GetConnectionString("Initial");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = await connection.ExecuteAsync(sql);
            }
        }

        public async Task PopulateDataSIP(string sql)
        {
            string connectionString = _config.GetConnectionString("DefaultConnection");
            using (IDbConnection connection = new SqlConnection(connectionString))
            {
                var data = await connection.ExecuteAsync(sql);
            }
        }

    }
}
