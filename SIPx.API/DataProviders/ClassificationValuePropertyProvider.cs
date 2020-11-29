
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
    public class ClassificationValuePropertyProvider : IClassificationValuePropertyProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationValuePropertyProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<PropertyList>> CreateGetProperties(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValuePropertyCreateGetProperties @UserId, @ClassificationValueID ";
            var CheckString = await _sqlDataAccess.LoadData<PropertyList, dynamic>(usp, new { UserId, ClassificationValueId });
            return CheckString;
        }
        public async Task<ClassificationValuePropertyCreateGet> CreateGetPropertyType(string UserId, int PropertyId)
        {
            string usp = "usp_ClassificationValuePropertyCreateGetPropertyType @UserId, @PropertyID";
            var PropertyType = await _sqlDataAccess.LoadSingleRecord<ClassificationValuePropertyCreateGetPropertyType, dynamic>(usp, new { UserId, PropertyId });
            ClassificationValuePropertyCreateGet ClassificationValueProperty = new ClassificationValuePropertyCreateGet();
            ClassificationValueProperty.PropertyTypeId = PropertyType.PropertyTypeId;
            ClassificationValueProperty.PropertyTypeName = PropertyType.PropertyTypeName;
            ClassificationValueProperty.PropertyId = PropertyId;
            return ClassificationValueProperty;
        }
        public async Task<List<PropertyValueList>> CreateGetPropertyValueList(string UserId, int PropertyId)
        {
            string usp = "usp_ClassificationValuePropertyCreateGetPropertyValueList @UserId, @PropertyID ";
            var CheckString = await _sqlDataAccess.LoadData<PropertyValueList, dynamic>(usp, new { UserId, PropertyId });
            return CheckString;
        }

        //public async Task<string> CreatePostCheck(ClassificationValuePropertyCreateGet ClassificationValueProperty)
        //{
        //    string usp = "usp_ClassificationValuePropertyCreatePostCheck @ClassificationValueId, @PropertyId, @PropertyInt, @PropertyBool, @PropertyDate, @PropertyString, @PropertyValueId, @UserId ";
        //     _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ClassificationValueProperty);
        //    return true;
        //}

        public bool CreatePost(ClassificationValuePropertyCreateGet ClassificationValueProperty)
        {
            string usp = "usp_ClassificationValuePropertyUpdatePost @ClassificationValueId, @PropertyId, @PropertyInt, @PropertyBool, @PropertyDate, @PropertyString, @PropertyValueId, @UserId";
            _sqlDataAccess.SaveData<ClassificationValuePropertyCreateGet>(usp, ClassificationValueProperty);
            return true;
        }


        public Task<List<ClassificationValuePropertyIndexGet>> IndexGet(string UserId, int ClassificationValueId)
        {
            string usp = "usp_ClassificationValuePropertyIndexGet @UserId, @ClassificationValueID";
            return _sqlDataAccess.LoadData<ClassificationValuePropertyIndexGet, dynamic>(usp, new { UserId, ClassificationValueId });
        }

        public Task<ClassificationValuePropertyUpdateGet> UpdateGet(string UserId, int ClassificationValuePropertyId)
        {
            string usp = "usp_ClassificationValuePropertyUpdateGet @UserId, @ClassificationValuePropertyID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValuePropertyUpdateGet, dynamic>(usp, new { UserId, ClassificationValuePropertyId });
        }

        //public Task<ClassificationValuePropertyCreateGetClassificationName> ClassificationValuePropertyCreateGetClassificationName(string UserId, int ClassificationValueId)
        //{
        //    string usp = "usp_ClassificationValuePropertyCreateGetClassificationName @UserId, @ClassificationValueID";
        //    return _sqlDataAccess.LoadSingleRecord<ClassificationValuePropertyCreateGetClassificationName, dynamic>(usp, new { UserId, ClassificationValueId });
        //}

        public bool UpdatePost(ClassificationValuePropertyUpdateGet ClassificationValueProperty)
        {
            string usp = "usp_ClassificationValuePropertyUpdatePost @ClassificationValuePropertyId, @PropertyInt, @PropertyBool, @PropertyDate, @PropertyString, @PropertyValueId, @UserId";
            _sqlDataAccess.SaveData<ClassificationValuePropertyUpdateGet>(usp, ClassificationValueProperty);
            return true;
        }

        public Task<ClassificationValuePropertyDeleteGet> DeleteGet(string UserId, int ClassificationValuePropertyId)
        {
            string usp = "usp_ClassificationValuePropertyDeleteGet @UserId, @ClassificationValuePropertyID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationValuePropertyDeleteGet, dynamic>(usp, new { UserId, ClassificationValuePropertyId });

        }

        public bool DeletePost(int ClassificationValuePropertyId)
        {
            string usp = "usp_ClassificationValuePropertyDeletePost @ClassificationValuePropertyId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ClassificationValuePropertyId = ClassificationValuePropertyId });
            return true;
        }

    }
}
