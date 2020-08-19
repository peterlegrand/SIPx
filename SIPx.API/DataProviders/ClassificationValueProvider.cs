
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
    public class ClassificationValueProvider : IClassificationValueProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationValueProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePostCheck(ClassificationValueCreatePost ClassificationValue)
        {
            string usp = "usp_ClassificationValueCreatePostCheck @ClassificationId, @ParentId, @LanguageId , @Name, @CreatorID";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValue);
            return CheckString;
        }

        public async Task<string> CreatePost(ClassificationValueCreatePost ClassificationValue)
        {
            string usp = "usp_ClassificationValueCreatePost @ClassificationId, @ParentId, @DateFrom, @DateTo, @Location, @LanguageId, @Name, @Description, @DropDownName, @MenuName, @MouseOver, @PageName, @PageDescription, @HeaderName, @HeaderDescription, @TopicName, @CreatorId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValue);
            return String;
        }

        public Task<List<ClassificationValueUpdateGet>> IndexGet(string UserId, int ClassificationId)
        {
            string usp = "usp_ClassificationValueIndexGet @UserId, @ClassificationID";
            return _sqlDataAccess.LoadData<ClassificationValueUpdateGet, dynamic>(usp, new { UserId, ClassificationId });

        }

        public Task<ClassificationValueUpdateGet> UpdateGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueUpdateGet @UserId, @ClassificationValueID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueUpdateGet, dynamic>(usp, new { UserId, ClassificationValueId });

        }

        public bool UpdatePost(ClassificationValueUpdateGet ClassificationValue)
        {
            string usp = "usp_ClassificationValueUpdatePost @ClassificationValueId, @ParentValueId, @DateFrom, @DateTo, @Location, @LanguageId, @Name, @Description, @DropDownName, @MenuName, @MouseOver, @PageName, @PageDescription, @HeaderName, @HeaderDescription, @TopicName, @ModifierId";
            _sqlDataAccess.SaveData<ClassificationValueUpdateGet>(usp, ClassificationValue);
            return true;
        }

        public async Task<List<ClassificationValueLanguageIndexGet>> LanguageIndexGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValueLanguageIndex @UserId, @ClassificationValueID";
            var x = await _sqlDataAccess.LoadData<ClassificationValueLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationValueId });
            return x;
        }

        public Task<ClassificationValueLanguageIndexGet> LanguageUpdateGet(string UserId, int ClassificationValueLanguageId)
        {
            string usp = "usp_ClassificationValueLanguageUpdateGet @UserId, @ClassificationValueLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValueLanguageIndexGet, dynamic>(usp, new { UserId, ClassificationValueLanguageId });

        }
    
    public Task<ClassificationValueDeleteGet> DeleteGet(string UserId, int ClassificationValueId)
    {
        string usp = "usp_ClassificationValueDeleteGet @UserId, @ClassificationValueID";
        return _sqlDataAccess.LoadSingleRecord<ClassificationValueDeleteGet, dynamic>(usp, new { UserId, ClassificationValueId });

    }
    public bool DeletePost(int Id)
    {
        string usp = "usp_ClassificationValueDeletePost @ClassificationValueId";
        _sqlDataAccess.SaveData<int>(usp, Id);
        return true;
    }

}
}