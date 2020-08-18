
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
    public class UserPageSectionProvider : IUserPageSectionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public UserPageSectionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }


        public async Task<List<PageSectionIndexGet>> IndexGet(string UserId, int PageId)
        {
            string usp = "usp_UserPageSectionIndexGet @UserID, @PageID";
            var x = await _sqlDataAccess.LoadData<PageSectionIndexGet, dynamic>(usp, new { UserId = UserId, PageID = PageId });
            return x;
        }
        public Task<PageSectionUpdateGet> UpdateGet(string UserId, int PageSectionId)
        {
            string usp = "usp_UserPageSectionUpdateGet @UserId, @PageSectionID";
            return _sqlDataAccess.LoadSingleRecord<PageSectionUpdateGet, dynamic>(usp, new { UserId = UserId, PageSectionId = PageSectionId });

        }
        public async Task<string> CreatePostCheck(PageSectionCreatePost PageSection)
        {
            string usp = "usp_UserPageSectionCreatePostCheck @PageId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @@OneTwoColumns, @ContentTypeId, @SortById,, @Name, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSection);
            return CheckString;
        }

        public async Task<string> CreatePost(PageSectionCreatePost PageSection)
        {
            string usp = "usp_UserPageSectionCreatePost @PageId, @Sequence, @PageSectionTypeId, @PageSectionDataTypeId, @ShowSectionTitleName, @ShowSectionTitleDescription, @ShowContentTypeTitleName, @ShowContentTypeTitleDescription, @OneTwoColumns, @ContentTypeId, @SortById, @MaxContent, @HasPaging, @LanguageId, @Name, @Description, @MenuName, @MouseOver, @TitleName, @TitleDescription, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PageSection);
            return CheckString;
        }
        public Task<List<SequenceList>> CreateGetSequence(string UserId, int PageId)
        {
            string usp = "usp_UserPageSectionCreateGetSequence @UserID, @PageId";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, PageId });
        }
    }
}
