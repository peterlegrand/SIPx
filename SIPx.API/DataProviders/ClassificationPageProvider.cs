
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
    public class ClassificationPageProvider : IClassificationPageProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public async Task<string> CreatePostCheck(ClassificationPageCreatePost ClassificationPage)
        {
            string usp = "usp_ClassificationPageCreatePostCheck @ClassificationId, @StatusId, @LanguageId , @Name, @CreatorId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationPage);
            return CheckString;
        }

        public bool CreatePost(ClassificationPageCreatePost ClassificationPage)
        {
            string usp = "usp_ClassificationPageCreatePost @ClassificationId,@StatusId, @ShowTitleName, @ShowTitleDescription, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @CreatorId ";
            _sqlDataAccess.SaveData<ClassificationPageCreatePost>(usp, ClassificationPage);
            return true;
        }

        public ClassificationPageProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<ClassificationPageList>> ListGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationPageList @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationPageList, dynamic>(usp, new { UserId, ClassificationId });

        }

        public async Task<List<ClassificationPageIndexGet>> IndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationPageIndexGet @UserId, @ClassificationID";
            var x = await _sqlDataAccess.LoadData<ClassificationPageIndexGet, dynamic>(usp, new { UserId, ClassificationId });
            return x;
        }

        public Task<ClassificationPageUpdateGet> UpdateGet(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageUpdateGet @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageUpdateGet, dynamic>(usp, new { UserId, ClassificationPageId });

        }

        public bool UpdatePost(ClassificationPageUpdateGet ClassificationPage)
        {
            string usp = "usp_ClassificationPageUpdatePost @ClassificationPageId, @StatusId, @ShowTitleName, @ShowTitleDescription, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @ModifierId";
            _sqlDataAccess.SaveData<ClassificationPageUpdateGet>(usp, ClassificationPage);
            return true;
        }
        public Task<ClassificationPageDeleteGet> DeleteGet(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageDeleteGet @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageDeleteGet, dynamic>(usp, new { UserId, ClassificationPageId });

        }
        public bool DeletePost(int Id)
        {
            string usp = "usp_ClassificationPageDeletePost @ClassificationPageId";
            _sqlDataAccess.SaveData<int>(usp, Id);
            return true;
        }

        public Task<List<ClassificationPageLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageLanguageIndexGet @UserId, @ClassificationPageID";
            return _sqlDataAccess.LoadData<ClassificationPageLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationPageId });

        }

        public Task<ClassificationPageLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationPageLanguageId)
        {
            string usp = "usp_ClassificationPageLanguageUpdateGet @UserId, @ClassificationPageLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationPageLanguageId });

        }

    }
}
