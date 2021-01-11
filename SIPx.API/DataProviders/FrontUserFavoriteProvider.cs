
using Dapper;
using SIPx.Shared;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class FrontUserFavoriteProvider : IFrontUserFavoriteProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontUserFavoriteProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        //public Task<List<SequenceList>> CreateGetSequence(string UserId)
        //{
        //    string usp = "usp_FrontUserFavoriteCreateGetSequence @UserID";
        //    return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
        //}

        //public async Task<List<ErrorMessage>> CreatePostCheck(FrontUserFavoriteCreateGet FrontUserFavorite)
        //{
        //    string usp = "usp_FrontUserFavoriteCreatePostCheck @Sequence, @Name, @CreatorId ";
        //    var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, FrontUserFavorite);
        //    return ErrorMessages;
        //}

        //public async Task<string> CreatePost(FrontUserFavoriteCreateGet FrontUserFavorite)
        //{
        //    string usp = "usp_FrontUserFavoriteCreatePost @Sequence, @Name, @Description, @MenuName, @MouseOver, @CreatorId ";
        //    var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, FrontUserFavorite);
        //    return String;
        //}

        public Task<List<MVCFavoriteIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_FrontUserFavoriteIndexGet @UserID";
            return _sqlDataAccess.LoadData<MVCFavoriteIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<MVCFavoriteUpdateGet> UpdateGet(string UserId, int MVCFavoriteId)
        {
            string usp = "usp_FrontUserFavoriteUpdateGet @UserId, @MVCFavoriteId";
            return _sqlDataAccess.LoadSingleRecord<MVCFavoriteUpdateGet, dynamic>(usp, new { UserId = UserId, MVCFavoriteId = MVCFavoriteId });

        }
        public async Task<bool> UpdatePost(MVCFavoriteUpdateGet Favorite)
        {
            string usp = "usp_FrontUserFavoriteUpdatePost @MVCFavoriteId, @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserId";
            _sqlDataAccess.SaveData<dynamic>(usp, Favorite);
            return true;
        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(MVCFavoriteUpdateGet Favorite)
        {
            string usp = "usp_FrontUserFavoriteUpdatePostCheck @MVCFavoriteId, @Sequence, @Name, @Description, @MenuName, @MouseOver, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Favorite);
            return ErrorMessages;
        }

        public Task<MVCFavoriteDeleteGet> DeleteGet(string UserId, int MVCFavoriteId)
        {
            string usp = "usp_FrontUserFavoriteDeleteGet @UserId, @MVCFavoriteID";
            return _sqlDataAccess.LoadSingleRecord<MVCFavoriteDeleteGet, dynamic>(usp, new { UserId, MVCFavoriteId });

        }

        public bool DeletePost(string UserId, int MVCFavoriteId)
        {
            string usp = "usp_FrontUserFavoriteDeletePost @UserId, @MVCFavoriteID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, MVCFavoriteId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int MVCFavoriteId)
        {
            string usp = "usp_FrontUserFavoriteDeletePostCheck @UserId, @MVCFavoriteID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, MVCFavoriteId });
            return ErrorMessages;
        }

        //public Task<List<MVCFavoriteList>> List(string UserId)
        //{
        //    string usp = "usp_FrontUserFavoriteList @UserId";
        //    return _sqlDataAccess.LoadData<FrontUserFavoriteList, dynamic>(usp, new { UserId = UserId });

        //}
        public Task<List<SequenceList>> UpdateGetSequence(string UserId, int MVCFavoriteGroupId)
        {
            string usp = "usp_FrontUserFavoriteUpdateGetSequence @UserId , @MVCFavoriteGroupId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId = UserId, MVCFavoriteGroupId = MVCFavoriteGroupId });

        }
    }
}
