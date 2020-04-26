
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class ClassificationProvider : IClassificationProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ClassificationProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ClassificationViewGet>> GetClassifications(int LanguageId)
        {
            string usp = "usp_AdminClassficationList @LanguageID";
            var x = await _sqlDataAccess.LoadData<ClassificationViewGet, dynamic>(usp, new { LanguageID = LanguageId });
            return x;
        }
        public  List<ClassificationViewGet> GetClassifications2(int LanguageId)
        {
            var parameters = new List<SqlParameter> { new SqlParameter { ParameterName = "@LanguageID", SqlValue = LanguageId } };
            string usp = "usp_AdminClassficationList @LanguageID";
            var x = _sqlDataAccess.LoadData2<ClassificationViewGet>(usp, parameters );
            return x;
        }

        public Task<ClassificationViewGet> GetClassificationById(int Id, int LanguageId)
        {
            string usp = "usp_AdminClassficationDetails @classificationId,  @LanguageID";
            return _sqlDataAccess.LoadSingleRecord<ClassificationViewGet, dynamic>(usp, new { ClassificationId = Id, LanguageID = LanguageId });

        }
        public bool PostClassification(ClassificationCreatePost Classification)
        {
            string usp = "usp_classificationCreate @LanguageID, @StatusID, @DefaultPageId, @HasDropDown, @DropDownSequence, @CreatorId, @Name, @Description, @MenuName, @MouseOver";
            _sqlDataAccess.SaveData<ClassificationCreatePost>(usp, Classification);
            return true;
        }
        public bool PutClassification(ClassificationUpdatePut Classification)
        {
            string usp = "usp_AdminClassificationUpdate @StatusID , @DefaultPageID , @HasDropDown , @DropDownSequence , @ModifierID , @ClassificationID , @Name , @Description , @MenuName , @MouseOver , @LanguageID";
            _sqlDataAccess.SaveData<ClassificationUpdatePut>(usp, Classification);
            return true;
        }
    }
}
