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
    public class DevFrontContentProvider : IFrontContentProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public DevFrontContentProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<FrontContentContentTypeGroup>> ContentTypeContentTypeGroup(string UserId)
        {
            List<FrontContentContentTypeGroup> contentTypeGroups = new List<FrontContentContentTypeGroup>();
            List<FrontContentContentType> contentTypes1 = new List<FrontContentContentType>();
            contentTypes1.Add(new FrontContentContentType { ContentTypeGroupID = 1, ContentTypeID = 1, ContentTypeName = "Energy assignments" });
            contentTypes1.Add(new FrontContentContentType { ContentTypeGroupID = 1, ContentTypeID = 2, ContentTypeName = "Bio diversity assignments" });
            contentTypes1.Add(new FrontContentContentType { ContentTypeGroupID = 1, ContentTypeID = 3, ContentTypeName = "Polution assignments" });

            List<FrontContentContentType> contentTypes2 = new List<FrontContentContentType>();
            contentTypes1.Add(new FrontContentContentType { ContentTypeGroupID = 2, ContentTypeID = 4, ContentTypeName = "Energy knowledge" });
            contentTypes1.Add(new FrontContentContentType { ContentTypeGroupID = 2, ContentTypeID = 5, ContentTypeName = "Steady state economy knowledge" });


            contentTypeGroups.Add(new FrontContentContentTypeGroup { ContentTypeGroupID = 1, ContentTypeGroupName = "Assignments", ContentTypes = contentTypes1 });
            contentTypeGroups.Add(new FrontContentContentTypeGroup { ContentTypeGroupID = 2, ContentTypeGroupName = "Knowledge", ContentTypes = contentTypes2 });
            return contentTypeGroups;
        }

        public async Task<FrontContentShowContent> FrontContentShowContent(string UserId, int ContentId)
        {
            FrontContentShowContent content = new FrontContentShowContent();
            content.ContentId = 1;
            content.ContentStatusName = "Active";
            content.ContentTypeId = 1;
            content.ContentTypeName = "Energy assignment";
            content.CreatedDate = DateTime.Now;
            content.CreatorId = 1;
            content.CreatorName = "John Cleese";
            content.Description = "<html><head><meta http-equiv=\"content - type\" content=\"text / html; charset = UTF - 8\"><title></title></head><body><h1>What is Sustainable Energy?</h1><p>Sustainable energy is a form of energy that meets our today’s demand of energy without putting them in danger of getting expired or depleted and can be used over and over again. Sustainable energy should be widely encouraged as it does not cause any harm to the environment and is available widely free of cost. All renewable energy sources like solar, wind, geothermal, hydropower and ocean energy are sustainable as they are stable and available in plenty.<br><br> Sun will continue to provide sunlight till we all are here on earth, heat caused by the sun will continue to produce winds, the earth will continue to produce heat from inside and will not cool down anytime soon, movement of earth, sun and moon will not stop, and this will keep on producing tides. <br> </p> <p>The process of evaporation will cause water to evaporate that will fall down in the form of rain or ice which will go through rivers or streams and merge in the oceans and can be used to produce energy through hydropower. This clearly states that all these renewable energy sources are sustainable and will continue to provide energy to the coming generations.<br> </p> <p>There are many forms of sustainable energy sources that can be incorporated by countries to stop the use of fossil fuels. Sustainable energy does not include any sources that are derived from fossil fuels or waste products. This energy is replenishable and helps us to reduce greenhouse gas emissions and causes no damage to the environment. If we are going to use fossil fuels at a steady rate, they will expire soon and cause adverse effects on our planet.<br> <br> Fossil fuels are not considered as sustainable energy sources because they are limited, cause immense pollution by releasing harmful gases and are not available everywhere on earth. Fossil fuels normally include coal, oil and natural gas. Steps must be taken to reduce our dependency on fossil fuels as pose dangerous to the environment. Most of the counties have already started taking steps to make use of alternative energy sources.<br> </p> </body> </html>";
            content.IsOwner = true;
            content.LanguageName = "English";
            content.ModifiedDate = DateTime.Now;
            content.ModifierId = 1;
            content.ModifierName = "John Cleese";
            content.OrganizationId = 1;
            content.OrganizationName = "Absegami High School";
            content.ParentContentTitle = "";
            content.ProjectId = 0;
            content.ProjectName = "No project";
            content.SecurityLevelName = "Level 1";
            content.Title = "What is Sustainable Energy?";
            
            return content;
        }
        public async Task<List<FrontContentShowContentClassificationValue>> FrontContentShowContentClassificationValue(string UserId, int ContentId)
        {
            List<FrontContentShowContentClassificationValue> ClassificationValues = new List<FrontContentShowContentClassificationValue>();
            ClassificationValues.Add(new FrontContentShowContentClassificationValue { ClassificationName = "Energy", ClassificationValueId = 1, ClassificationValueName = "Renewable energy" });
            ClassificationValues.Add(new FrontContentShowContentClassificationValue { ClassificationName = "Location", ClassificationValueId = 2, ClassificationValueName = "North America" });
            return ClassificationValues;
        }

        public async Task<List<FrontContentContentType>> ContentType(string UserId, int ContentTypeGroupId)
        {
            List<FrontContentContentType> contentTypes = new List<FrontContentContentType>();
            contentTypes.Add(new FrontContentContentType { ContentTypeGroupID = 1, ContentTypeID = 1, ContentTypeName = "Energy assignments" });
            contentTypes.Add(new FrontContentContentType { ContentTypeGroupID = 1, ContentTypeID = 2, ContentTypeName = "Bio diversity assignments" });
            contentTypes.Add(new FrontContentContentType { ContentTypeGroupID = 1, ContentTypeID = 3, ContentTypeName = "Polution assignments" });
            contentTypes.Add(new FrontContentContentType { ContentTypeGroupID = 2, ContentTypeID = 4, ContentTypeName = "Energy knowledge" });
            contentTypes.Add(new FrontContentContentType { ContentTypeGroupID = 2, ContentTypeID = 5, ContentTypeName = "Steady state economy knowledge" });

            return contentTypes;
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

            p.Add("@IsRelationBasedEdit", Content.IsRelationBasedEdit);
            p.Add("@IsRelationBasedRead", Content.IsRelationBasedRead);
            p.Add("@IsFreeEdit", Content.IsFreeEdit);
            p.Add("@IsFreeRead", Content.IsFreeRead);
            p.Add("@IsOrganizationBasedEdit", Content.IsOrganizationBasedEdit);
            p.Add("@IsOrganizationBasedEditParent", Content.IsOrganizationBasedEditParent);
            p.Add("@IsOrganizationBasedEditSub", Content.IsOrganizationBasedEditSub);
            p.Add("@IsOrganizationBasedRead", Content.IsOrganizationBasedRead);
            p.Add("@IsOrganizationBasedReadParent", Content.IsOrganizationBasedReadParent);
            p.Add("@IsOrganizationBasedReadSub", Content.IsOrganizationBasedReadSub);

            p.Add("@IsProjectBasedEdit", Content.IsProjectBasedEdit);
            p.Add("@IsProjectBasedEditParent", Content.IsProjectBasedEditParent);
            p.Add("@IsProjectBasedEditSub", Content.IsProjectBasedEditSub);
            p.Add("@IsProjectBasedRead", Content.IsProjectBasedRead);
            p.Add("@IsProjectBasedReadParent", Content.IsProjectBasedReadParent);
            p.Add("@IsProjectBasedReadSub", Content.IsProjectBasedReadSub);



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


        public Task<FrontContentContentNew> ContentNewGetContentType(int ContentTypeId)
        {
            string usp = "usp_FrontContentContentNewGetContentType  @ContentTypeID";
            return _sqlDataAccess.LoadSingleRecord<FrontContentContentNew, dynamic>(usp, new { ContentTypeId = ContentTypeId });

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
