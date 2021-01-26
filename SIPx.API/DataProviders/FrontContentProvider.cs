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
            string usp = "usp_FrontContentTypeIndexGetContentGroup @UserId";
            var x = await _sqlDataAccess.LoadData<FrontContentContentTypeGroup, dynamic>(usp, new { UserId = UserId });
            return x;
        }

        public async Task<FrontContentShowContent> FrontContentShowContent(string UserId, int ContentId)
        {
            string usp = "usp_FrontContentShowContent @UserId, @ContentId";
            var x = await _sqlDataAccess.LoadSingleRecord<FrontContentShowContent, dynamic>(usp, new { UserId = UserId, ContentId = ContentId });
            string usp2 = "usp_FrontContentShowContentClassificationValues @UserId, @ContentId";
            var y = await _sqlDataAccess.LoadData<FrontContentShowContentClassificationValue, dynamic>(usp2, new { UserId = UserId, ContentId = ContentId });
            x.ClassificationValues = y;
            return x;
        }

        public async Task<List<FrontContentContentType>> ContentType(string UserId, int ContentTypeGroupId)
        {
            string usp = "usp_FrontContentTypeIndexGetContent @UserId, @ContentTypeGroupId";
            var x = await _sqlDataAccess.LoadData<FrontContentContentType, dynamic>(usp, new { UserId = UserId, ContentTypeGroupId = ContentTypeGroupId });
            return x;
        }

        public async Task<List<FrontContentContentNewClassification>> NewClassifications(string UserId, int ContentTypeId)
        {
            string usp = "usp_FrontContentNewClassifications @UserId, @ContentTypeId";
            var x = await _sqlDataAccess.LoadData<FrontContentContentNewClassification, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });
            return x;
        }
        public async Task<List<FrontContentContentNewClassificationLevel>> NewClassificationLevels(int ClassificationId)
        {
            string usp = "usp_FrontContentNewClassificationLevels @ClassificationId";
            var x = await _sqlDataAccess.LoadData<FrontContentContentNewClassificationLevel, dynamic>(usp, new { ClassificationId });
            return x;
        }

        public async Task<List<FrontContentContentNewClassificationValue>> NewClassificationValues(string UserId, int ClassificationId, int Sequence, bool Alphabetical)
        {
            string usp = "usp_FrontContentNewClassificationValues @UserId, @ClassificationId, @Sequence, @Alphabetical ";
            var x = await _sqlDataAccess.LoadData<FrontContentContentNewClassificationValue, dynamic>(usp, new { UserId, ClassificationId, Sequence, Alphabetical});
            return x;
        }

        public async Task<int> FrontContentCreatePost(string UserId, FrontContentContentNew Content)
        {

            DataTable ClassificationValueTable = ContentClassificationValueDataTable.CreateTable();
            var xy = new List<ContentClassificationValue>();

            foreach (var x in Content.Classifications)
            {
                if (x.ClassificationValueId != null && x.ClassificationValueId != 0)
                {
                    ClassificationValueTable.Rows.Add(

                    x.ClassificationId
                            , x.ClassificationValueId
                            , UserId
                            , DateTime.Today);
                }
            }
            var p = new DynamicParameters();
            p.Add("@ContentTypeId", Content.ContentTypeId);
            p.Add("@ContentStatusId", Content.ContentStatusId);
            p.Add("@LanguageId", Content.LanguageId);
            p.Add("@Title", Content.Title);
            p.Add("@Description", Content.Description);
            p.Add("@SecurityLevelID", Content.SecurityLevelId);
            p.Add("@OrganizationId", Content.OrganizationId);
            p.Add("@ProjectId", Content.ProjectId);
            p.Add("@UserId", Content.UserId);
            p.Add("@ClassificationValueTable", ClassificationValueTable.AsTableValuedParameter("udt_ContentClassificationValueInsert"));
            p.Add("@NewId", dbType: DbType.Int32,
      direction: ParameterDirection.Output);


//            string usp = "usp_FrontContentNewPost @ContentTypeId, @ContentStatusID , @LanguageID , @Title , @Description , @SecurityLevelID , @ProjectID , @OrganizationId , @UserID, @NewContentId, @ClassificationValueTable ";
            string usp = "usp_FrontContentNewPost";
            var NewId = await _sqlDataAccess.SaveData3(usp, p);

            //_sqlDataAccess.SaveData<dynamic>(usp, new
            //{
            //    ContentTypeId = Content.ContentTypeId
            //    ,
            //    ContentStatusId = Content.ContentStatusId
            //    ,
            //    LanguageId = Content.LanguageId
            //    ,
            //    Title = Content.Title
            //    ,
            //    Description = Content.Description
            //    ,
            //    SecurityLevelID = Content.SecurityLevelId
            //    ,
            //    OrganizationId = Content.OrganizationId
            //    ,
            //    ProjectId = Content.ProjectId
            //    ,
            //    UserId = UserId
            //    ,
            //    ClassificationValueTable = ClassificationValueTable.AsTableValuedParameter("udt_ContentClassificationValueInsert")
            //});
            return NewId;


        }
        public async Task<FrontContentRightsUpdateGet> RightsUpdateGet(int ContentId)
        {
            string usp = "usp_FrontContentRightsUpdateGet @ContentId";
            var UpdateGetRights = await _sqlDataAccess.LoadSingleRecord<FrontContentRightsUpdateGet, dynamic>(usp, new { ContentId = ContentId });
            return UpdateGetRights;
        }
        public async Task<List<ErrorMessage>> RightsUpdatePostCheck(FrontContentRightsUpdateGet FrontContentRights)
        {
            string usp = "usp_FrontContentRightsUpdatePostCheck @ContentId  " +
    " , @IsRelationBasedEdit "  +
    " , @IsRelationBasedRead " +
    " , @IsProjectBasedEdit  " +
    " , @IsProjectBasedEditSub  " +
    " , @IsProjectBasedEditParent  " +
    " , @IsOrganizationBasedEdit  " +
    " , @IsOrganizationBasedEditSub  " +
    " , @IsOrganizationBasedEditParent  " +
    " , @IsProjectBasedRead  " +
    " , @IsProjectBasedReadSub  " +
    " , @IsProjectBasedReadParent  " +
    " , @IsOrganizationBasedRead  " +
    " , @IsOrganizationBasedReadSub  " +
    " , @IsOrganizationBasedReadParent  " + 
    " , @OwnerId  " +
    " , @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, FrontContentRights);
            return ErrorMessages;
        }

        public bool RightsUpdatePost(FrontContentRightsUpdateGet FrontContentRights)
        {
            string usp = "usp_FrontContentRightsUpdatePost @ContentId  " +
   " , @IsRelationBasedEdit " +
   " , @IsRelationBasedRead " +
   " , @IsProjectBasedEdit  " +
   " , @IsProjectBasedEditSub  " +
   " , @IsProjectBasedEditParent  " +
   " , @IsOrganizationBasedEdit  " +
   " , @IsOrganizationBasedEditSub  " +
   " , @IsOrganizationBasedEditParent  " +
   " , @IsProjectBasedRead  " +
   " , @IsProjectBasedReadSub  " +
   " , @IsProjectBasedReadParent  " +
   " , @IsOrganizationBasedRead  " +
   " , @IsOrganizationBasedReadSub  " +
   " , @IsOrganizationBasedReadParent  " +
   " , @OwnerId  " +
   " , @UserId ";
            _sqlDataAccess.SaveData<FrontContentRightsUpdateGet>(usp, FrontContentRights);
            return true;
        }
        public async Task<List<UserList>> RightsUpdateGetOwners(string UserId, bool IsRelationBasedOwnership ,bool IsProjectBasedOwnership  , bool IsOrganizationBasedOwnership , bool IsFreeOwnership )
        {
            string usp = "usp_FrontContentRightsUpdateGetOwners @UserId, @IsRelationBasedOwnership , @IsProjectBasedOwnership , @IsOrganizationBasedOwnership , @IsFreeOwnership ";
            var x = await _sqlDataAccess.LoadData<UserList, dynamic>(usp, new { UserId = UserId, IsRelationBasedOwnership = IsRelationBasedOwnership, IsProjectBasedOwnership = IsProjectBasedOwnership, IsOrganizationBasedOwnership = IsOrganizationBasedOwnership, IsFreeOwnership = IsFreeOwnership });
            return x;
        }

        public async Task<List<ErrorMessage>> RightsEditUserCreatePostCheck(FrontContentRightsEditUserCreateGet FrontContentRightsEditUser)
        {
            string usp = "usp_FrontContentRightsEditUserCreatePostCheck @UserId, @ContentId, @SelectedUserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, FrontContentRightsEditUser);
            return ErrorMessages;
        }

        public async Task<string> RightsEditUserCreatePost(FrontContentRightsEditUserCreateGet FrontContentRightsEditUser)
        {
            string usp = "usp_FrontContentRightsEditUserCreatePost @UserId, @ContentId, @SelectedUserId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, FrontContentRightsEditUser);
            return String;
        }

        public Task<List<FrontContentRightsEditUserIndexGet>> RightsEditUserIndexGet(string UserId, int ContentId)
        {
            string usp = "usp_FrontContentRightsEditUserIndexGet @UserId, @ContentID";
            return _sqlDataAccess.LoadData<FrontContentRightsEditUserIndexGet, dynamic>(usp, new { UserId = UserId, ContentId = ContentId});

        }

        public Task<FrontContentRightsEditUserDeleteGet> RightsEditUserDeleteGet(string UserId, int ContentUserEditId)
        {
            string usp = "usp_FrontContentRightsEditUserDeleteGet @UserId, @ContentUserEditId";
            return _sqlDataAccess.LoadSingleRecord<FrontContentRightsEditUserDeleteGet, dynamic>(usp, new { UserId, ContentUserEditId });

        }

        public Task<FrontContentShowContentRights> ShowContentRightsGet(int ContentId)
        {
            string usp = "usp_FrontContentShowContentRightsGet  @ContentId";
            return _sqlDataAccess.LoadSingleRecord<FrontContentShowContentRights, dynamic>(usp, new { ContentId });

        }

        public bool RightsEditUserDeletePost(int ContentUserEditId)
        {
            string usp = "usp_FrontContentRightsEditUserDeletePost @ContentUserEditId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ContentUserEditId = ContentUserEditId }); 
            return true;
        }
        public async Task<List<UserList>> RightsUpdateGetEditUsers(FrontContentRightsEditUserCreateGet FrontContentRightsEditUser )
        {
            string usp = "usp_FrontContentRightsUpdateGetEditUsers @UserId, @ContentId ";
            var x = await _sqlDataAccess.LoadData<UserList, dynamic>(usp, FrontContentRightsEditUser);
            return x;
        }
        public async Task<List<UserList>> RightsUpdateGetReadUsers( FrontContentRightsReadUserCreateGet FrontContentRightsReadUser )
        {
            string usp = "usp_FrontContentRightsUpdateGetReadUsers @SelectedId, @ContentId ";
            var x = await _sqlDataAccess.LoadData<UserList, dynamic>(usp, FrontContentRightsReadUser);
            return x;
        }
    }
}
