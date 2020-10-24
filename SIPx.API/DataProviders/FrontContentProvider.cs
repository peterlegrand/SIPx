
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Metadata;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class FrontContentProvider : IFrontContentProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontContentProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<FrontContentContentTypeGroup>> ContentTypeContentTypeGroup(string UserId)
        {
            string usp = usp_FrontContentTypeIndexGetContentGroup @UserId;
            var x = await _sqlDataAccess.LoadData<FrontContentContentTypeGroup, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<FrontContentShowContent> FrontContentShowContent(string UserId, int ContentId)
        {
            string usp = usp_FrontContentShowContent @UserId, @ContentId;
            var x = await _sqlDataAccess.LoadSingleRecord<FrontContentShowContent, dynamic>(usp, new { UserId = UserId, ContentId = ContentId });
            string usp2 = usp_FrontContentShowContentClassificationValues @UserId, @ContentId;
            var y = await _sqlDataAccess.LoadData<FrontContentShowContentClassificationValue, dynamic>(usp2, new { UserId = UserId, ContentId = ContentId });
            x.ClassificationValues = y;
            return x;
        }

        public async Task<List<FrontContentContentType>> ContentType(string UserId, int ContentTypeGroupId)
        {
            string usp = usp_FrontContentTypeIndexGetContent @UserId, @ContentTypeGroupId;
            var x = await _sqlDataAccess.LoadData<FrontContentContentType, dynamic>(usp, new { UserId = UserId, ContentTypeGroupId = ContentTypeGroupId });
            return x;
        }

        public async Task<List<FrontContentContentNewClassification>> NewClassifications(string UserId, int ContentTypeId)
        {
            string usp = usp_FrontContentNewClassifications @UserId, @ContentTypeId;
            var x = await _sqlDataAccess.LoadData<FrontContentContentNewClassification, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x;
        }

        public async Task<List<FrontContentContentNewClassificationValue>> NewClassificationValues(string UserId, int ClassificationId)
        {
            string usp = usp_FrontContentNewClassificationValues @UserId, @ClassificationId;
            var x = await _sqlDataAccess.LoadData<FrontContentContentNewClassificationValue, dynamic>(usp, new { UserId = UserId, ClassificationId = ClassificationId });
            return x;
        }

        public async Task<bool> FrontContentCreatePost(string UserId, FrontContentContentNew Content)
        {
           
            DataTable ClassificationValueTable = ContentClassificationValueDataTable.CreateTable();
            var xy = new List<ContentClassificationValue>();

            foreach (var x in Content.Classifications)
            {
                if(x.ClassificationValueId!=null && x.ClassificationValueId !=0)
                { 
                ClassificationValueTable.Rows.Add(

                x.ClassificationId
                        , x.ClassificationValueId
                        , UserId
                        , DateTime.Today);
                }
            }
            string usp = usp_FrontContentNewPost @ContentTypeId, @ContentStatusID , @LanguageID , @Title , @Description , @SecurityLevelID , @ProjectID , @OrganizationId , @CreatorID, @ClassificationValueTable ;
            _sqlDataAccess.SaveData<dynamic>(usp, new { 
                ContentTypeId = Content.ContentTypeId
                , ContentStatusId = Content.ContentStatusId
                , LanguageId = Content.LanguageId
                , Title = Content.Title
                , Description = Content.Description
                , SecurityLevelID = Content.SecurityLevelId
                , OrganizationId = Content.OrganizationId
                , ProjectId = Content.ProjectId
                , CreatorId = UserId
                , ClassificationValueTable = ClassificationValueTable.AsTableValuedParameter(udt_ContentClassificationValueInsert) });
            return true;
        

        }
    }
}
