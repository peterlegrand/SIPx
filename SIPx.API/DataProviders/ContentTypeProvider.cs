﻿
using Dapper;
using SIPx.Shared;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data;
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

        public Task<List<ProcessTypeList>> CreateGetProcessTypes(string UserId)
        {
            string usp = "usp_ContentTypeCreateGetProcessTypes @UserId";
            return _sqlDataAccess.LoadData<ProcessTypeList, dynamic>(usp, new { UserId = UserId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ContentTypeCreateGet ContentType)
        {
            DataTable ClassificationTable = ContentTypeClassificationValueDataTable.CreateTable();
            var xy = new List<ContentTypeClassification>();

            foreach (var ContentTypeClassification in ContentType.ContentTypeClassifications)
            {
                ClassificationTable.Rows.Add(
                ContentTypeClassification.ClassificationId
                , ContentTypeClassification.ObjectTypeClassificationStatusId);

            }
            string usp = "usp_ContentTypeCreatePostCheck @ContentTypeGroupId,@CodePrefix , @CodeSuffix , @CodeTypeId ,   @ProcessTypeId , @SecurityLevelId, @Name , @Description, @MenuName , @MouseOver, @UserId " +
 " , @IsRelationBasedOwnership " +
           " , @IsProjectBasedOwnership " +
           " , @IsOrganizationBasedOwnership " +
           " , @IsFreeOwnership " +
           " , @IsRelationBasedEdit " +
           " , @IsRelationBasedEditSelectable " +
           " , @IsOrganizationBasedEdit " +
           " , @IsOrganizationBasedEditSelectable " +
           " , @IsOrganizationBasedEditSub " +
           " , @IsOrganizationBasedEditParent " +
           " , @IsProjectBasedEdit " +
           " , @IsProjectBasedEditSelectable " +
           " , @IsProjectBasedEditSub " +
           " , @IsProjectBasedEditParent " +
           " , @IsFreeEdit " +
           " , @IsFreeEditSelectable " +
           " , @IsRelationBasedRead " +
           " , @IsRelationBasedReadSelectable " +
           " , @IsOrganizationBasedRead " +
           " , @IsOrganizationBasedReadSelectable " +
           " , @IsOrganizationBasedReadSub " +
           " , @IsOrganizationBasedReadParent " +
           " , @IsProjectBasedRead " +
           " , @IsProjectBasedReadSelectable " +
           " , @IsProjectBasedReadSub " +
           " , @IsProjectBasedReadParent " +
           " , @IsFreeRead " +
           " , @IsFreeReadSelectable, @Color, @IconId, @ContentTypeClassificationTable";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new
            {
                ContentTypeGroupId = ContentType.ContentTypeGroupId
                ,
                ProcessTypeId = ContentType.@ProcessTypeId
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
                UserId = ContentType.UserId
                ,
                IsRelationBasedOwnership = ContentType.IsRelationBasedOwnership
                ,
                IsProjectBasedOwnership = ContentType.IsProjectBasedOwnership
                ,
                IsOrganizationBasedOwnership = ContentType.IsOrganizationBasedOwnership
                ,
                IsFreeOwnership = ContentType.IsFreeOwnership
                ,
                IsRelationBasedEdit = ContentType.IsRelationBasedEdit
                ,
                IsRelationBasedEditSelectable = ContentType.IsRelationBasedEditSelectable
                ,
                IsOrganizationBasedEdit = ContentType.IsOrganizationBasedEdit
                ,
                IsOrganizationBasedEditSelectable = ContentType.IsOrganizationBasedEditSelectable
                ,
                IsOrganizationBasedEditSub = ContentType.IsOrganizationBasedEditSub
                ,
                IsOrganizationBasedEditParent = ContentType.IsOrganizationBasedEditParent
                ,
                IsProjectBasedEdit = ContentType.IsProjectBasedEdit
                ,
                IsProjectBasedEditSelectable = ContentType.IsProjectBasedEditSelectable
                ,
                IsProjectBasedEditSub = ContentType.IsProjectBasedEditSub
                ,
                IsProjectBasedEditParent = ContentType.IsProjectBasedEditParent
                ,
                IsFreeEdit = ContentType.IsFreeEdit
                ,
                IsFreeEditSelectable = ContentType.IsFreeEditSelectable
                ,
                IsRelationBasedRead = ContentType.IsRelationBasedRead
                ,
                IsRelationBasedReadSelectable = ContentType.IsRelationBasedReadSelectable
                ,
                IsOrganizationBasedRead = ContentType.IsOrganizationBasedRead
                ,
                IsOrganizationBasedReadSelectable = ContentType.IsOrganizationBasedReadSelectable
                ,
                IsOrganizationBasedReadSub = ContentType.IsOrganizationBasedReadSub
                ,
                IsOrganizationBasedReadParent = ContentType.IsOrganizationBasedReadParent
                ,
                IsProjectBasedRead = ContentType.IsProjectBasedRead
                ,
                IsProjectBasedReadSelectable = ContentType.IsProjectBasedReadSelectable
                ,
                IsProjectBasedReadSub = ContentType.IsProjectBasedReadSub
                ,
                IsProjectBasedReadParent = ContentType.IsProjectBasedReadParent
                ,
                IsFreeRead = ContentType.IsFreeRead
                ,
                IsFreeReadSelectable = ContentType.IsFreeReadSelectable
                ,
                Color = ContentType.Color
                ,
                IconId = ContentType.IconId
                ,
                ContentTypeClassificationTable = ClassificationTable.AsTableValuedParameter("udt_ContentTypeClassificationNew")
            });
            return ErrorMessages;
        }
        //PETER Probably this doesn't work as the table as parameter needs to be inserted
        //see sp name of update or create without post
        //public async Task<string> CreatePost(ContentTypeCreatePost ContentType)
        //{
        //    string usp = "usp_ContentTypeCreatePost @ContentTypeGroupId  , @ProcessTypeId  ,@SecurityLevelId,  @Name, @Description, @MenuName, @MouseOver, @UserId, @Color, @IconId,  ";
        //    var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ContentType);
        //    return String;
        //}
        public async Task<bool> CreatePost(ContentTypeCreateGet ContentType)
        {

            DataTable ClassificationTable = ContentTypeClassificationValueDataTable.CreateTable();
            var xy = new List<ContentTypeClassification>();

            foreach (var ContentTypeClassification in ContentType.ContentTypeClassifications)
            {
                ClassificationTable.Rows.Add(
                ContentTypeClassification.ClassificationId
                , ContentTypeClassification.ObjectTypeClassificationStatusId);

            }
            string usp = "usp_ContentTypeCreatePost @ContentTypeGroupId,@CodePrefix , @CodeSuffix , @CodeTypeId ,   @ProcessTypeId , @SecurityLevelId, @Name , @Description, @MenuName , @MouseOver, @UserId " +
   " , @IsRelationBasedOwnership " +
             " , @IsProjectBasedOwnership " +
             " , @IsOrganizationBasedOwnership " +
             " , @IsFreeOwnership " +
             " , @IsRelationBasedEdit " +
             " , @IsRelationBasedEditSelectable " +
             " , @IsOrganizationBasedEdit " +
             " , @IsOrganizationBasedEditSelectable " +
             " , @IsOrganizationBasedEditSub " +
             " , @IsOrganizationBasedEditParent " +
             " , @IsProjectBasedEdit " +
             " , @IsProjectBasedEditSelectable " +
             " , @IsProjectBasedEditSub " +
             " , @IsProjectBasedEditParent " +
             " , @IsFreeEdit " +
             " , @IsFreeEditSelectable " +
             " , @IsRelationBasedRead " +
             " , @IsRelationBasedReadSelectable " +
             " , @IsOrganizationBasedRead " +
             " , @IsOrganizationBasedReadSelectable " +
             " , @IsOrganizationBasedReadSub " +
             " , @IsOrganizationBasedReadParent " +
             " , @IsProjectBasedRead " +
             " , @IsProjectBasedReadSelectable " +
             " , @IsProjectBasedReadSub " +
             " , @IsProjectBasedReadParent " +
             " , @IsFreeRead " +
             " , @IsFreeReadSelectable, @Color, @IconId, @ContentTypeClassificationTable";


            _sqlDataAccess.SaveData<dynamic>(usp, new
            {
                ContentTypeGroupId = ContentType.ContentTypeGroupId
                ,
                ProcessTypeId = ContentType.@ProcessTypeId
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
                UserId = ContentType.UserId
                ,
                IsRelationBasedOwnership = ContentType.IsRelationBasedOwnership
                ,
                IsProjectBasedOwnership = ContentType.IsProjectBasedOwnership
                ,
                IsOrganizationBasedOwnership = ContentType.IsOrganizationBasedOwnership
                ,
                IsFreeOwnership = ContentType.IsFreeOwnership
                ,
                IsRelationBasedEdit = ContentType.IsRelationBasedEdit
                ,
                IsRelationBasedEditSelectable = ContentType.IsRelationBasedEditSelectable
                ,
                IsOrganizationBasedEdit = ContentType.IsOrganizationBasedEdit
                ,
                IsOrganizationBasedEditSelectable = ContentType.IsOrganizationBasedEditSelectable
                ,
                IsOrganizationBasedEditSub = ContentType.IsOrganizationBasedEditSub
                ,
                IsOrganizationBasedEditParent = ContentType.IsOrganizationBasedEditParent
                ,
                IsProjectBasedEdit = ContentType.IsProjectBasedEdit
                ,
                IsProjectBasedEditSelectable = ContentType.IsProjectBasedEditSelectable
                ,
                IsProjectBasedEditSub = ContentType.IsProjectBasedEditSub
                ,
                IsProjectBasedEditParent = ContentType.IsProjectBasedEditParent
                ,
                IsFreeEdit = ContentType.IsFreeEdit
                ,
                IsFreeEditSelectable = ContentType.IsFreeEditSelectable
                ,
                IsRelationBasedRead = ContentType.IsRelationBasedRead
                ,
                IsRelationBasedReadSelectable = ContentType.IsRelationBasedReadSelectable
                ,
                IsOrganizationBasedRead = ContentType.IsOrganizationBasedRead
                ,
                IsOrganizationBasedReadSelectable = ContentType.IsOrganizationBasedReadSelectable
                ,
                IsOrganizationBasedReadSub = ContentType.IsOrganizationBasedReadSub
                ,
                IsOrganizationBasedReadParent = ContentType.IsOrganizationBasedReadParent
                ,
                IsProjectBasedRead = ContentType.IsProjectBasedRead
                ,
                IsProjectBasedReadSelectable = ContentType.IsProjectBasedReadSelectable
                ,
                IsProjectBasedReadSub = ContentType.IsProjectBasedReadSub
                ,
                IsProjectBasedReadParent = ContentType.IsProjectBasedReadParent
                ,
                IsFreeRead = ContentType.IsFreeRead
                ,
                IsFreeReadSelectable = ContentType.IsFreeReadSelectable
                ,
                Color = ContentType.Color
                ,
                IconId = ContentType.IconId
                ,
                ContentTypeClassificationTable = ClassificationTable.AsTableValuedParameter("udt_ContentTypeClassificationNew")
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
        public async Task<List<ErrorMessage>> UpdatePostCheck(ContentTypeUpdateGet ContentType)
        {
            string usp = "usp_ContentTypeUpdatePostCheck @ContentTypeId,@CodePrefix , @CodeSuffix , @CodeTypeId ,   @ContentTypeGroupId  , @ProcessTypeId  ,@SecurityLevelId,  @Name, @Description, @MenuName, @MouseOver, @UserId " +
             " , @IsRelationBasedOwnership " +
             " , @IsProjectBasedOwnership " +
             " , @IsOrganizationBasedOwnership " +
             " , @IsFreeOwnership " +
             " , @IsRelationBasedEdit " +
             " , @IsRelationBasedEditSelectable " +
             " , @IsOrganizationBasedEdit " +
             " , @IsOrganizationBasedEditSelectable " +
             " , @IsOrganizationBasedEditSub " +
             " , @IsOrganizationBasedEditParent " +
             " , @IsProjectBasedEdit " +
             " , @IsProjectBasedEditSelectable " +
             " , @IsProjectBasedEditSub " +
             " , @IsProjectBasedEditParent " +
             " , @IsFreeEdit " +
             " , @IsFreeEditSelectable " +
             " , @IsRelationBasedRead " +
             " , @IsRelationBasedReadSelectable " +
             " , @IsOrganizationBasedRead " +
             " , @IsOrganizationBasedReadSelectable " +
             " , @IsOrganizationBasedReadSub " +
             " , @IsOrganizationBasedReadParent " +
             " , @IsProjectBasedRead " +
             " , @IsProjectBasedReadSelectable " +
             " , @IsProjectBasedReadSub " +
             " , @IsProjectBasedReadParent " +
             " , @IsFreeRead " +
             " , @IsFreeReadSelectable, @Color, @IconId, @ContentTypeClassificationTable";
            //    _sqlDataAccess.SaveData<ContentTypeUpdateGet>(usp, ContentType);
            //   return true;



            System.Data.DataTable ClassificationTable = ContentTypeClassificationValueDataTable.CreateTable();
            var xy = new List<ContentTypeClassification>();

            foreach (var x in ContentType.ContentTypeClassifications)
            {
                //if (x. != null && x.ClassificationValueId != 0)
                //{
                ClassificationTable.Rows.Add(

                x.ClassificationId
                        , x.ObjectTypeClassificationStatusId);
                //}
            }
            //   string usp = "usp_ContentTypeCreatePost @ContentTypeGroupId, @ProcessTypeId , @SecurityLevelId, @Name , @Description, @MenuName , @MouseOver, @CreatorID, @MouseOver, @IconID, @ContentTypeClassificationTable ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new
            {
                ContentTypeId = ContentType.ContentTypeId
                ,
                ContentTypeGroupId = ContentType.ContentTypeGroupId
                ,
                ProcessTypeId = ContentType.@ProcessTypeId
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
                UserId = ContentType.UserId
                ,
                IsRelationBasedOwnership = ContentType.IsRelationBasedOwnership
                ,
                IsProjectBasedOwnership = ContentType.IsProjectBasedOwnership
                ,
                IsOrganizationBasedOwnership = ContentType.IsOrganizationBasedOwnership
                ,
                IsFreeOwnership = ContentType.IsFreeOwnership
                ,
                IsRelationBasedEdit = ContentType.IsRelationBasedEdit
                ,
                IsRelationBasedEditSelectable = ContentType.IsRelationBasedEditSelectable
                ,
                IsOrganizationBasedEdit = ContentType.IsOrganizationBasedEdit
                ,
                IsOrganizationBasedEditSelectable = ContentType.IsOrganizationBasedEditSelectable
                ,
                IsOrganizationBasedEditSub = ContentType.IsOrganizationBasedEditSub
                ,
                IsOrganizationBasedEditParent = ContentType.IsOrganizationBasedEditParent
                ,
                IsProjectBasedEdit = ContentType.IsProjectBasedEdit
                ,
                IsProjectBasedEditSelectable = ContentType.IsProjectBasedEditSelectable
                ,
                IsProjectBasedEditSub = ContentType.IsProjectBasedEditSub
                ,
                IsProjectBasedEditParent = ContentType.IsProjectBasedEditParent
                ,
                IsFreeEdit = ContentType.IsFreeEdit
                ,
                IsFreeEditSelectable = ContentType.IsFreeEditSelectable
                ,
                IsRelationBasedRead = ContentType.IsRelationBasedRead
                ,
                IsRelationBasedReadSelectable = ContentType.IsRelationBasedReadSelectable
                ,
                IsOrganizationBasedRead = ContentType.IsOrganizationBasedRead
                ,
                IsOrganizationBasedReadSelectable = ContentType.IsOrganizationBasedReadSelectable
                ,
                IsOrganizationBasedReadSub = ContentType.IsOrganizationBasedReadSub
                ,
                IsOrganizationBasedReadParent = ContentType.IsOrganizationBasedReadParent
                ,
                IsProjectBasedRead = ContentType.IsProjectBasedRead
                ,
                IsProjectBasedReadSelectable = ContentType.IsProjectBasedReadSelectable
                ,
                IsProjectBasedReadSub = ContentType.IsProjectBasedReadSub
                ,
                IsProjectBasedReadParent = ContentType.IsProjectBasedReadParent
                ,
                IsFreeRead = ContentType.IsFreeRead
                ,
                IsFreeReadSelectable = ContentType.IsFreeReadSelectable
                ,
                Color = ContentType.Color
                ,
                IconId = ContentType.IconId
                ,
                ContentTypeClassificationTable = ClassificationTable.AsTableValuedParameter("udt_ContentTypeClassificationNew")
            });
            return ErrorMessages;
        }

        public bool UpdatePost(ContentTypeUpdateGet ContentType)
        {
            string usp = "usp_ContentTypeUpdatePost @ContentTypeId, @CodePrefix , @CodeSuffix , @CodeTypeId ,  @ContentTypeGroupId  , @ProcessTypeId  ,@SecurityLevelId,  @Name, @Description, @MenuName, @MouseOver, @UserId, @IsRelationBasedOwnership " +
   " , @IsProjectBasedOwnership " +
   " , @IsOrganizationBasedOwnership " +
   " , @IsFreeOwnership " +
   " , @IsRelationBasedEdit " +
   " , @IsRelationBasedEditSelectable " +
   " , @IsOrganizationBasedEdit " +
   " , @IsOrganizationBasedEditSelectable " +
   " , @IsOrganizationBasedEditSub " +
   " , @IsOrganizationBasedEditParent " +
   " , @IsProjectBasedEdit " +
   " , @IsProjectBasedEditSelectable " +
   " , @IsProjectBasedEditSub " +
   " , @IsProjectBasedEditParent " +
   " , @IsFreeEdit " +
   " , @IsFreeEditSelectable " +
   " , @IsRelationBasedRead " +
   " , @IsRelationBasedReadSelectable " +
   " , @IsOrganizationBasedRead " +
   " , @IsOrganizationBasedReadSelectable " +
   " , @IsOrganizationBasedReadSub " +
   " , @IsOrganizationBasedReadParent " +
   " , @IsProjectBasedRead " +
   " , @IsProjectBasedReadSelectable " +
   " , @IsProjectBasedReadSub " +
   " , @IsProjectBasedReadParent " +
   " , @IsFreeRead " +
   " , @IsFreeReadSelectable, @Color, @IconId, @ContentTypeClassificationTable";
            //_sqlDataAccess.SaveData<ContentTypeUpdateGet>(usp, ContentType);
            //return true;



            System.Data.DataTable ClassificationTable = ContentTypeClassificationValueDataTable.CreateTable();
            var xy = new List<ContentTypeClassification>();

            foreach (var x in ContentType.ContentTypeClassifications)
            {
                //if (x. != null && x.ClassificationValueId != 0)
                //{
                ClassificationTable.Rows.Add(

                x.ClassificationId
                        , x.ObjectTypeClassificationStatusId);
                //}
            }
            //   string usp = "usp_ContentTypeCreatePost @ContentTypeGroupId, @ProcessTypeId , @SecurityLevelId, @Name , @Description, @MenuName , @MouseOver, @CreatorID, @MouseOver, @IconID, @ContentTypeClassificationTable ";
            _sqlDataAccess.SaveData<dynamic>(usp, new
            {
                ContentTypeId = ContentType.ContentTypeId
                ,
                ContentTypeGroupId = ContentType.ContentTypeGroupId
                ,
                ProcessTypeId = ContentType.@ProcessTypeId
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
                UserId = ContentType.UserId
                ,
                IsRelationBasedOwnership = ContentType.IsRelationBasedOwnership
                ,
                IsProjectBasedOwnership = ContentType.IsProjectBasedOwnership
                ,
                IsOrganizationBasedOwnership = ContentType.IsOrganizationBasedOwnership
                ,
                IsFreeOwnership = ContentType.IsFreeOwnership
                ,
                IsRelationBasedEdit = ContentType.IsRelationBasedEdit
                ,
                IsRelationBasedEditSelectable = ContentType.IsRelationBasedEditSelectable
                ,
                IsOrganizationBasedEdit = ContentType.IsOrganizationBasedEdit
                ,
                IsOrganizationBasedEditSelectable = ContentType.IsOrganizationBasedEditSelectable
                ,
                IsOrganizationBasedEditSub = ContentType.IsOrganizationBasedEditSub
                ,
                IsOrganizationBasedEditParent = ContentType.IsOrganizationBasedEditParent
                ,
                IsProjectBasedEdit = ContentType.IsProjectBasedEdit
                ,
                IsProjectBasedEditSelectable = ContentType.IsProjectBasedEditSelectable
                ,
                IsProjectBasedEditSub = ContentType.IsProjectBasedEditSub
                ,
                IsProjectBasedEditParent = ContentType.IsProjectBasedEditParent
                ,
                IsFreeEdit = ContentType.IsFreeEdit
                ,
                IsFreeEditSelectable = ContentType.IsFreeEditSelectable
                ,
                IsRelationBasedRead = ContentType.IsRelationBasedRead
                ,
                IsRelationBasedReadSelectable = ContentType.IsRelationBasedReadSelectable
                ,
                IsOrganizationBasedRead = ContentType.IsOrganizationBasedRead
                ,
                IsOrganizationBasedReadSelectable = ContentType.IsOrganizationBasedReadSelectable
                ,
                IsOrganizationBasedReadSub = ContentType.IsOrganizationBasedReadSub
                ,
                IsOrganizationBasedReadParent = ContentType.IsOrganizationBasedReadParent
                ,
                IsProjectBasedRead = ContentType.IsProjectBasedRead
                ,
                IsProjectBasedReadSelectable = ContentType.IsProjectBasedReadSelectable
                ,
                IsProjectBasedReadSub = ContentType.IsProjectBasedReadSub
                ,
                IsProjectBasedReadParent = ContentType.IsProjectBasedReadParent
                ,
                IsFreeRead = ContentType.IsFreeRead
                ,
                IsFreeReadSelectable = ContentType.IsFreeReadSelectable
                ,
                Color = ContentType.Color
                ,
                IconId = ContentType.IconId
                ,
                ContentTypeClassificationTable = ClassificationTable.AsTableValuedParameter("udt_ContentTypeClassificationNew")
            });
            return true;
        }

        public Task<ContentTypeDeleteGet> DeleteGet(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeDeleteGet @UserId, @ContentTypeID";
            return _sqlDataAccess.LoadSingleRecord<ContentTypeDeleteGet, dynamic>(usp, new { UserId, ContentTypeId });

        }

        public bool DeletePost(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeDeletePost @UserId, @ContentTypeID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ContentTypeId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeDeletePostCheck @UserId, @ContentTypeID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ContentTypeId });
            return ErrorMessages;
        }

        public Task<string> ReturnName(string UserId, int ContentTypeId)
        {
            string usp = "usp_ContentTypeReturnName @UserId, @ContentTypeID";
            return _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { UserId = UserId, ContentTypeId = ContentTypeId });

        }

        public Task<List<ContentTypeList>> List(string UserId)
        {
            string usp = "usp_ContentTypeList @UserID";
            return _sqlDataAccess.LoadData<ContentTypeList, dynamic>(usp, new { UserId = UserId });

        }

    }
}
