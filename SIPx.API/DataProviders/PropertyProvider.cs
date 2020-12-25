
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
    public class PropertyProvider : IPropertyProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PropertyProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<SequenceList>> CreateGetSequence(string UserId)
        {
            string usp = "usp_PropertyCreateGetSequence @UserID";
            var x = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
            return x;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(PropertyCreateGet Property)
        {
            string usp = "usp_PropertyCreatePostCheck @PropertyTypeId, @Name , @Description , @MenuName , @MouseOver , @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Property);
            return ErrorMessages;
        }

        public bool CreatePost(PropertyCreateGet Property)
        {
            string usp = "usp_PropertyCreatePost @PropertyTypeId, @Name , @Description , @MenuName , @MouseOver , @UserID";
            _sqlDataAccess.SaveData<PropertyCreateGet>(usp, Property);
            return true;
        }

        public async Task<List<PropertyIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_PropertyIndexGet @UserID";
            List<PropertyIndexGet> x = await _sqlDataAccess.LoadData<PropertyIndexGet, dynamic>(usp, new { UserId });
            return x;
        }

        public Task<PropertyUpdateGet> UpdateGet(string UserId, int PropertyId)
        {
            string usp = "usp_PropertyUpdateGet @UserId, @PropertyID";
            return _sqlDataAccess.LoadSingleRecord<PropertyUpdateGet, dynamic>(usp, new { UserId, PropertyId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(PropertyUpdateGet Property)
        {
            string usp = "usp_PropertyUpdatePostCheck @PropertyId, @PropertyTypeId, @Name , @Description , @MenuName , @MouseOver , @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Property);
            return ErrorMessages;
        }

        public bool UpdatePost(PropertyUpdateGet Property)
        {
            string usp = "usp_PropertyUpdatePost @PropertyId, @PropertyTypeId, @Name , @Description , @MenuName , @MouseOver , @UserId ";
            _sqlDataAccess.SaveData<PropertyUpdateGet>(usp, Property);
            return true;
        }
        public Task<PropertyDeleteGet> DeleteGet(string UserId, int PropertyId)
        {
            string usp = "usp_PropertyDeleteGet @UserId, @PropertyID";
            return _sqlDataAccess.LoadSingleRecord<PropertyDeleteGet, dynamic>(usp, new { UserId, PropertyId });

        }
        public bool DeletePost(string UserId, int PropertyId)
        {
            string usp = "usp_PropertyDeletePost @UserId, @PropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PropertyId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PropertyId)
        {
            string usp = "usp_PropertyDeletePostCheck @UserId, @PropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PropertyId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PropertyId });
            return ErrorMessages;
        }

        public async Task<List<PropertyList>> List(string UserId)
        {
            string usp = "usp_PropertyList @UserID";
            var x = await _sqlDataAccess.LoadData<PropertyList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
