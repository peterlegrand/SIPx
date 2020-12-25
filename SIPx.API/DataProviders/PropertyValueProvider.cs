
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
    public class PropertyValueProvider : IPropertyValueProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PropertyValueProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<SequenceList>> CreateGetSequence(string UserId, int PropertyId)
        {
            string usp = "usp_PropertyvALUECreateGetSequence @UserID, @PropertyId";
            var x = await _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId, PropertyId });
            return x;
        }
        public async Task<int> CreateGetType(string UserId, int PropertyId)
        {
            string usp = "usp_PropertyValueCreateGetType @UserID, @PropertyId";
            var x = await _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { UserId, PropertyId });
            return x;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(PropertyValueCreateGet PropertyValue)
        {
            string usp = "usp_PropertyCreatePostCheck @PropertyTypeId, @Name , @Description , @MenuName , @MouseOver , @CreatorId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PropertyValue);
            return ErrorMessages;
        }

        public bool CreatePost(PropertyValueCreateGet PropertyValue)
        {
            string usp = "usp_PropertyValueCreatePost @PropertyId, @Sequence, @PropertyValueInt, @PropertyValueString, @PropertyValueBool, @PropertyValueDate, @Name , @Description , @MenuName , @MouseOver , @UserID";
            _sqlDataAccess.SaveData<PropertyValueCreateGet>(usp, PropertyValue);
            return true;
        }

        public async Task<List<PropertyValueIndexGet>> IndexGet(string UserId, int PropertyId)
        {
            string usp = "usp_PropertyValueIndexGet @UserID, @PropertyId";
            var x = await _sqlDataAccess.LoadData<PropertyValueIndexGet, dynamic>(usp, new { UserId, PropertyId });
            return x;
        }

        public Task<PropertyValueUpdateGet> UpdateGet(string UserId, int PropertyValueId)
        {
            string usp = "usp_PropertyValueUpdateGet @UserId, @PropertyValueID";
            return _sqlDataAccess.LoadSingleRecord<PropertyValueUpdateGet, dynamic>(usp, new { UserId, PropertyValueId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(PropertyValueUpdateGet PropertyValue)
        {
            string usp = "usp_PropertyValueUpdatePostCheck @PropertyValueId, @Sequence, @PropertyValueInt,@PropertyValueString,@PropertyValueBool,@PropertyValueDate, @Name , @Description , @MenuName , @MouseOver , @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PropertyValue);
            return ErrorMessages;
        }

        public bool UpdatePost(PropertyValueUpdateGet PropertyValue)
        {
            string usp = "usp_PropertyValueUpdatePost @PropertyValueId, @Sequence, @PropertyValueInt,@PropertyValueString,@PropertyValueBool,@PropertyValueDate, @Name , @Description , @MenuName , @MouseOver , @UserId ";
            _sqlDataAccess.SaveData<PropertyValueUpdateGet>(usp, PropertyValue);
            return true;
        }
        public Task<PropertyValueDeleteGet> DeleteGet(string UserId, int PropertyValueId)
        {
            string usp = "usp_PropertyValueDeleteGet @UserId, @PropertyID";
            return _sqlDataAccess.LoadSingleRecord<PropertyValueDeleteGet, dynamic>(usp, new { UserId, PropertyValueId });

        }
        public bool DeletePost(string UserId, int PropertyValueId)
        {
            string usp = "usp_PropertyValueDeletePost @UserId, @PropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PropertyValueId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PropertyValueId)
        {
            string usp = "usp_PropertyValueDeletePostCheck @UserId, @PropertyID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PropertyValueId });
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
