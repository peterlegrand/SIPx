
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class PositionProvider : IPositionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PositionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(PositionCreateGet Position)
        {
            string usp = "usp_PositionCreatePostCheck @Name, @Description, @MenuName, @MouseOver, @UserID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Position);
            return ErrorMessages;
        }

        public bool CreatePost(PositionCreateGet Position)
        {
            string usp = "usp_PositionCreatePost @Name, @Description, @MenuName, @MouseOver, @UserID";
            _sqlDataAccess.SaveData<PositionCreateGet>(usp, Position);
            return true;
        }

        public Task<List<PositionIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_PositionIndexGet @UserID";
            return _sqlDataAccess.LoadData<PositionIndexGet, dynamic>(usp, new { UserId });

        }

        public Task<PositionUpdateGet> UpdateGet(string UserId, int PositionId)
        {
            string usp = "usp_PositionUpdateGet @UserId, @PositionID";
            return _sqlDataAccess.LoadSingleRecord<PositionUpdateGet, dynamic>(usp, new { UserId, PositionId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(PositionUpdateGet Position)
        {
            string usp = "usp_PositionUpdatePostCheck @PositionId, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Position);
            return ErrorMessages;
        }
        public bool UpdatePost(PositionUpdateGet Position)
        {
            string usp = "usp_PositionUpdatePost @PositionId, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<PositionUpdateGet>(usp, Position);
            return true;
        }

        public Task<PositionDeleteGet> DeleteGet(string UserId, int PositionId)
        {
            string usp = "usp_PositionDeleteGet @UserId, @PositionID";
            return _sqlDataAccess.LoadSingleRecord<PositionDeleteGet, dynamic>(usp, new { UserId, PositionId });

        }

        public bool DeletePost(string UserId, int PositionId)
        {
            string usp = "usp_PositionDeletePost @UserId, @PositionID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PositionId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PositionId)
        {
            string usp = "usp_PositionDeletePostCheck @UserId, @PositionID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PositionId });
            return ErrorMessages;
        }

        public Task<List<PositionLanguageUpdateGet>> LanguageIndexGet(string UserId, int PositionId)
        {
            string usp = "usp_PositionLanguageIndexGet @UserId, @PositionID";
            return _sqlDataAccess.LoadData<PositionLanguageUpdateGet, dynamic>(usp, new { UserId, PositionId });

        }

        public Task<PositionLanguageIndexGet> LanguageUpdateGet(string UserId, int PositionLanguageId)
        {
            string usp = "usp_PositionLanguageUpdateGet @UserId, @PositionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PositionLanguageIndexGet, dynamic>(usp, new { UserId, PositionLanguageId });

        }

        public Task<List<PositionList>> List(string UserId)
        {
            string usp = "usp_PositionList @UserID";
            return _sqlDataAccess.LoadData<PositionList, dynamic>(usp, new { UserId });
        }
    }
}
