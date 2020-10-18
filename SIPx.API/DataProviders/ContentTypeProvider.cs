
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
    public class ContentTypeProvider : IContentTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ContentTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public Task<List<ProcessTemplateList>> CreateGetProcessTemplates(string UserId)
        {
            string usp = "usp_ContentTypeCreateGetProcessTemplates @UserId";
            return _sqlDataAccess.LoadData<ProcessTemplateList, dynamic>(usp, new { UserId = UserId});
        }

        public async Task<string> CreatePostCheck(ContentTypeCreatePost ContentType)
        {
            string usp = "usp_ContentTypeCreateCheck @ContentTypeGroupId, @ProcessTemplateId  ,@SecurityLevelId,  @LanguageId , @Name ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentType);
            return CheckString;
        }
        //PETER Probably this doesn't work as the table as parameter needs to be inserted
        //see sp name of update or create without post
        //public async Task<string> CreatePost(ContentTypeCreatePost ContentType)
        //{
        //    string usp = "usp_ContentTypeCreatePost @ContentTypeGroupId  , @ProcessTemplateId  ,@SecurityLevelId,  @Name, @Description, @MenuName, @MouseOver, @UserId, @Color, @IconId,  ";
        //    var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentType);
        //    return String;
        //}
        public async Task<bool> CreatePost( ContentTypeCreateGet ContentType)
        {

            System.Data.DataTable ClassificationTable = ContentTypeClassificationValueDataTable.CreateTable();
            var xy = new List<ContentTypeClassification>();

            foreach (var x in ContentType.ContentTypeClassifications)
            {
                //if (x. != null && x.ClassificationValueId != 0)
                //{
                ClassificationTable.Rows.Add(

                x.ClassificationId
                        , x.ContentTypeClassificationStatusId);
                //}
            }
            string usp = "usp_ContentTypeCreatePost @ContentTypeGroupId, @ProcessTemplateId , @SecurityLevelId, @Name , @Description, @MenuName , @MouseOver, @CreatorID, @MouseOver, @IconID, @ContentTypeClassificationTable ";
            _sqlDataAccess.SaveData<dynamic>(usp, new
            {
                ContentTypeGroupId = ContentType.ContentTypeGroupId
                ,
                ProcessTemplateId = ContentType.@ProcessTemplateId
                ,
                SecurityLevelId = ContentType.SecurityLevelId
                ,
                Name = ContentType.Name
                ,
                Description = ContentType.Description
                ,
                MenuName = ContentType.MenuName
                ,
                MouseOver = ContentType.MouseOver
                ,
                CreatorId = ContentType.CreatorId
                ,
                Color = ContentType.Color
                ,
                IconId = ContentType.IconId
                ,
                ContentTypeClassificationTable = ClassificationTable.AsTableValuedParameter("udt_ContentTypeClassificationInsert")
            });
            return true;


        }

        public Task<List<ContentTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ContentTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ContentTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<ContentTypeUpdateGet> UpdateGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeUpdateGet @UserId, @ContentTypeID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeUpdateGet, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });

        }

        public bool UpdatePost(ContentTypeUpdateGet ContentType)
        {
            string usp = "usp_ContentTypeUpdatePost @ContentTypeId, @ContentTypeGroupId  , @ProcessTemplateId  ,@SecurityLevelId,  @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<ContentTypeUpdateGet>(usp, ContentType);
            return true;
        }

        public Task<ContentTypeDeleteGet> DeleteGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeDeleteGet @UserId, @ContentTypeID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeDeleteGet, dynamic>(usp, new { UserId, ContentTypeId });

        }

        public bool DeletePost(int ContentTypeId)
        {
            string usp = "usp_ContentTypeDeletePost @ContentTypeId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ContentTypeId = ContentTypeId });
            return true;
        }

        //public async Task<List<ContentTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ContentTypeId)
        //{
        //    string usp = "usp_ContentTypeLanguageIndexGet @UserId, @ContentTypeID";
        //    var x = await _sqlDataAccess.LoadData<ContentTypeLanguage, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
        //    return x;
        //}

        //public Task<ContentTypeLanguageUpdateGet> LanguageUpdateGet(string UserId, int ContentTypeLanguageId)
        //{
        //    string usp = "usp_ContentTypeLanguageUpdateGet @ContentTypeLanguageID";
        //    return _sqlDataAccess.LoadSingleRecord<ContentTypeLanguageLanguageUpdateGet, dynamic>(usp, new { ContentTypeLanguageId = ContentTypeLanguageId });

        //}

        public Task<List<ContentTypeList>> List(string UserId)
        {
            string usp = "usp_ContentTypeList @UserID";
            return _sqlDataAccess.LoadData<ContentTypeList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
