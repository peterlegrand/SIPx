
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

        public async Task<List<AdminClassificationDetails>> GetClassifications(int LanguageId)
        {
            string usp = "usp_AdminClassficationList @LanguageID";
            var x = await _sqlDataAccess.LoadData<AdminClassificationDetails, dynamic>(usp, new { LanguageID = LanguageId });
            return x;
        }
        public  List<AdminClassificationDetails> GetClassifications2(int LanguageId)
        {
            var parameters = new List<SqlParameter> { new SqlParameter { ParameterName = "@LanguageID", SqlValue = LanguageId } };
            string usp = "usp_AdminClassficationList @LanguageID";
            var x = _sqlDataAccess.LoadData2<AdminClassificationDetails>(usp, parameters );
            return x;
        }

        public Task<AdminClassificationDetails> GetClassificationById(int Id, int LanguageId)
        {
            string usp = "usp_AdminClassficationDetails @classificationId,  @LanguageID";
            return _sqlDataAccess.LoadSingleRecord<AdminClassificationDetails, dynamic>(usp, new { ClassificationId = Id, LanguageID = LanguageId });

        }
        public bool PostClassification(ClassificationCreate Classification)
        {
            string usp = "usp_classificationCreate @LanguageID, @StatusID, @DefaultPageId, @HasDropDown, @DropDownSequence, @CreatorId, @Name, @Description, @MenuName, @MouseOver";
            _sqlDataAccess.SaveData<ClassificationCreate>(usp, Classification);
            return true;
        }
        public bool PutClassification(ClassificationUpdate Classification)
        {
            string usp = "usp_AdminClassificationUpdate @StatusID , @DefaultPageID , @HasDropDown , @DropDownSequence , @ModifierID , @ClassificationID , @Name , @Description , @MenuName , @MouseOver , @LanguageID";
            _sqlDataAccess.SaveData<ClassificationUpdate>(usp, Classification);
            return true;
        }
    }
}
