
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
    public class MetaContentProvider : IMetaContentProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public MetaContentProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ContentList>> CreateGetContentList(string UserId)
        {
            string usp = "[usp_MetaContentCreateGetContentList] @UserID";
            return _sqlDataAccess.LoadData<ContentList, dynamic>(usp, new { UserId });
        }

        public Task<List<MetaContentTypeList>> CreateGetMetaContentTypeList(string UserId)
        {
            string usp = "usp_MetaContentCreateGetMetaContentTypeList @UserID";
            return _sqlDataAccess.LoadData<MetaContentTypeList, dynamic>(usp, new { UserId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(MetaContentCreateGet MetaContent)
        {
            string usp = "usp_MetaContentCreatePostCheck @ContentId, @MetaContentTypeId, @MetaTypeId, @MetaRecordID, @UserID ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, MetaContent);
            return ErrorMessages;
        }

        public bool CreatePost(MetaContentCreateGet MetaContent)
        {
            string usp = "usp_MetaContentCreatePost @ContentId, @MetaContentTypeId, @MetaTypeId, @MetaRecordID, @UserID ";
            _sqlDataAccess.SaveData<MetaContentCreateGet>(usp, MetaContent);
            return true;
        }

        public async Task<List<MetaContentIndexGetGrid>> IndexGet(string UserId, int MetaRecordId, int MetaTypeId)
        {
            string usp = "usp_MetaContentIndexGet @UserId, @MetaRecordId, @MetaTypeID";
            var x = await _sqlDataAccess.LoadData<MetaContentIndexGetGrid, dynamic>(usp, new { UserId, MetaRecordId, MetaTypeId });
            return x;
        }


        public Task<MetaContentDeleteGet> DeleteGet(string UserId, int MetaContentId)
        {
            string usp = "usp_MetaContentDeleteGet @UserId, @MetaContentId";
            return _sqlDataAccess.LoadSingleRecord<MetaContentDeleteGet, dynamic>(usp, new { UserId, MetaContentId });

        }

        public bool DeletePost(string UserId, int MetaContentId)
        {
            string usp = "usp_MetaContentIdDeletePost @UserId, @MetaContentId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, MetaContentId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int MetaContentId)
        {
            string usp = "usp_MetaContentIdDeletePostCheck @UserId, @MetaContentId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, MetaContentId });
            return ErrorMessages;
        }

    }
}
