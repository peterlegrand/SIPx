
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
    public class ClassificationPageSectionProvider : IClassificationPageSectionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationPageSectionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<SequenceList>> CreateGetSequence(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageSectionCreateGetSequence @UserID, @ClassificationPageId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, ClassificationPageId });
        }

        public async Task<string> CreatePostCheck(ClassificationPageSectionCreatePost ClassificationPageSection)
        {
            string usp = "usp_ClassificationPageSectionCreatePostCheck @ClassificationPageId, @Sequence, @PageSectionTypeId, @PageSectionDateTypeId, @ContentTypeId, @SortById , @OneTwoColumns , @LanguageId , @Name";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationPageSection);
            return CheckString;
        }

        public bool CreatePost(ClassificationPageSectionCreatePost ClassificationPageSection)
        {
            string usp = "usp_ClassificationPageSectionCreatePost @ClassificationPageId, @ClassificationId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @ShowSectionTitleName, @ShowSectionTitleDescription, @ShowContentTypeTitleName, @ShowContentTypeTitleDescription, @OneTwoColumns, @ContentTypeId, @SortById, @MaxContent, @HasPaging, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @CreatorId ";
            _sqlDataAccess.SaveData<ClassificationPageSectionCreatePost>(usp, ClassificationPageSection);
            return true;
        }

        public async Task<List<ClassificationPageSectionIndexGet>> IndexGet(string UserId, int ClassificationPageId)
        {
            string usp = "usp_ClassificationPageSectionIndexGet @UserId, @ClassificationPageID";
            var x = await _sqlDataAccess.LoadData<ClassificationPageSectionIndexGet, dynamic>(usp, new { UserId, ClassificationPageId });
            return x;

        }

        public Task<ClassificationPageSectionUpdateGet> UpdateGet(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSectionUpdateGet @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSectionUpdateGet, dynamic>(usp, new { UserId, ClassificationPageSectionId });

        }

        public bool UpdatePost(ClassificationPageSectionUpdateGet ClassificationPageSection)
        {
            string usp = "usp_ClassificationPageSectionUpdatePost @ClassificationPageSectionId,  @ClassificationId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @ShowSectionTitleName, @ShowSectionTitleDescription, @ShowContentTypeTitleName, @ShowContentTypeTitleDescription, @OneTwoColumns, @ContentTypeId, @SortById, @MaxContent, @HasPaging, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @ModifierId";
            _sqlDataAccess.SaveData<ClassificationPageSectionUpdateGet>(usp, ClassificationPageSection);
            return true;
        }
        public Task<ClassificationPageSectionDeleteGet> DeleteGet(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSectionDeleteGet @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSectionDeleteGet, dynamic>(usp, new { UserId, ClassificationPageSectionId });

        }
        public bool DeletePost(int Id)
        {
            string usp = "usp_ClassificationPageSectionDeletePost @ClassificationPageSectionId";
            _sqlDataAccess.SaveData<int>(usp, Id);
            return true;
        }

        public Task<List<ClassificationPageSectionLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSectionLanguageIndexGet @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadData<ClassificationPageSectionLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationPageSectionId });

        }

        public Task<ClassificationPageSectionLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationPageSectionLanguageId)
        {
            string usp = "usp_ClassificationPageSectionLanguageUpdateGet @UserId, @ClassificationPageSectionLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationPageSectionLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationPageSectionLanguageId });

        }

        public Task<List<ClassificationPageSectionSequenceList>> SequenceListBySectionIdGet(string UserId, int ClassificationPageSectionId)
        {
            string usp = "usp_ClassificationPageSectionSequenceList @UserId, @ClassificationPageSectionID";
            return _sqlDataAccess.LoadData<ClassificationPageSectionSequenceList, dynamic>(usp, new { UserId, ClassificationPageSectionId });

        }
    }
}
