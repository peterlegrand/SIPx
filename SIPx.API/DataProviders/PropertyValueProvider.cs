
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
            string usp = "usp_PropertyUpdatePostCheck @PropertyLanguageId, @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver , @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PropertyValue);
            return ErrorMessages;
        }

        public bool UpdatePost(PropertyValueUpdateGet PropertyValue)
        {
            string usp = "usp_PropertyValueUpdatePost @PropertyValueId, @Sequence, @PropertyValueInt,@PropertyValueString,@PropertyValueBool,@PropertyValueDate, @Name , @Description , @MenuName , @MouseOver , @UserId ";
            _sqlDataAccess.SaveData<PropertyValueUpdateGet>(usp, PropertyValue);
            return true;
        } //PETER TODO In the stored procedure the check on hasdropdown is not yet ok.

        public Task<PropertyValueDeleteGet> DeleteGet(string UserId, int PropertyValueId)
        {
            string usp = "usp_PropertyValueDeleteGet @UserId, @PropertyID";
            return _sqlDataAccess.LoadSingleRecord<PropertyValueDeleteGet, dynamic>(usp, new { UserId, PropertyValueId });

        }
        public bool DeletePost(int PropertyValueId)
        {
            string usp = "usp_PropertyValueDeletePost @PropertyValueId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { PropertyValueId = PropertyValueId });
            return true;
        }

        //public Task<List<LanguageList>> LangugageCreateGetLanguageList(string UserId, int PropertyId)
        //{
        //    string usp = "[usp_PropertyLangugageCreateGetLanguageList] @UserID, @PropertyId";
        //    return _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId, PropertyId });
        //}

        //public async Task<List<PropertyLanguageIndexGet>> LanguageIndexGet(string UserId, int PropertyId)
        //{
        //    string usp = "usp_PropertyLanguageIndexGet @UserId, @PropertyID";
        //    var x = await _sqlDataAccess.LoadData<PropertyLanguageIndexGet, dynamic>(usp, new { UserId, PropertyId });
        //    return x;
        //}

        //public Task<PropertyLanguageIndexGet> LanguageUpdateGet(string UserId, int PropertyLanguageId)
        //{
        //    string usp = "usp_PropertyLanguageUpdateGet @UserId, @PropertyLanguageID";
        //    return _sqlDataAccess.LoadSingleRecord<PropertyLanguageIndexGet, dynamic>(usp, new { UserId, PropertyLanguageId });

        //}
        public async Task<List<PropertyList>> List(string UserId)
        {
            string usp = "usp_PropertyList @UserID";
            var x = await _sqlDataAccess.LoadData<PropertyList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        //public async Task<List<ContentAdvancedSearchPostProperty>> PropertiesWithValues(string UserId)
        //{
        //    string usp = "usp_PropertiesWithValues @UserID";
        //    var x = await _sqlDataAccess.LoadData<ContentAdvancedSearchPostProperty, dynamic>(usp, new { UserId = UserId });
        //    return x;
        //}
    }
}
