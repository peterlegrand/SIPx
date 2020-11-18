
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
    public class PropertyProvider 
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

        public async Task<string> CreatePostCheck(PropertyCreatePost Property)
        {
            string usp = "usp_PropertyCreatePostCheck @StatusId  , @HasDropDown , @DropDownSequence , @LanguageId , @Name , @Description , @MenuName , @MouseOver , @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Property);
            return CheckString;
        }

        public bool CreatePost(PropertyCreatePost Property)
        {
            string usp = "usp_PropertyCreatePost @StatusId, @HasDropDown, @DropDownSequence, @LanguageId, @Name, @Description, @MenuName, @MouseOver,@IconId, @Color, @UserID";
            _sqlDataAccess.SaveData<PropertyCreatePost>(usp, Property);
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

        public async Task<string> UpdatePostCheck(PropertyUpdateGet Property)
        {
            string usp = "usp_PropertyUpdatePostCheck @PropertyLanguageId, @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver , @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Property);
            return CheckString;
        }

        public bool UpdatePost(PropertyUpdateGet Property)
        {
            string usp = "usp_PropertyUpdatePost @PropertyId, @StatusId , @DefaultPageId , @HasDropDown , @DropDownSequence , @Name , @Description , @MenuName , @MouseOver ,@Color, @IconId, @CreatorId ";
            _sqlDataAccess.SaveData<PropertyUpdateGet>(usp, Property);
            return true;
        } //PETER TODO In the stored procedure the check on hasdropdown is not yet ok.

        public Task<PropertyDeleteGet> DeleteGet(string UserId, int PropertyId)
        {
            string usp = "usp_PropertyDeleteGet @UserId, @PropertyID";
            return _sqlDataAccess.LoadSingleRecord<PropertyDeleteGet, dynamic>(usp, new { UserId, PropertyId });

        }
        public bool DeletePost(int PropertyId)
        {
            string usp = "usp_PropertyDeletePost @PropertyId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { PropertyId = PropertyId });
            return true;
        }

        public Task<List<LanguageList>> LangugageCreateGetLanguageList(string UserId, int PropertyId)
        {
            string usp = "[usp_PropertyLangugageCreateGetLanguageList] @UserID, @PropertyId";
            return _sqlDataAccess.LoadData<LanguageList, dynamic>(usp, new { UserId, PropertyId });
        }

        public async Task<List<PropertyLanguageIndexGet>> LanguageIndexGet(string UserId, int PropertyId)
        {
            string usp = "usp_PropertyLanguageIndexGet @UserId, @PropertyID";
            var x = await _sqlDataAccess.LoadData<PropertyLanguageIndexGet, dynamic>(usp, new { UserId, PropertyId });
            return x;
        }

        public Task<PropertyLanguageIndexGet> LanguageUpdateGet(string UserId, int PropertyLanguageId)
        {
            string usp = "usp_PropertyLanguageUpdateGet @UserId, @PropertyLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PropertyLanguageIndexGet, dynamic>(usp, new { UserId, PropertyLanguageId });

        }
        public async Task<List<PropertyList>> List(string UserId)
        {
            string usp = "usp_PropertyList @UserID";
            var x = await _sqlDataAccess.LoadData<PropertyList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<ContentAdvancedSearchPostProperty>> PropertiesWithValues(string UserId)
        {
            string usp = "usp_PropertiesWithValues @UserID";
            var x = await _sqlDataAccess.LoadData<ContentAdvancedSearchPostProperty, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
