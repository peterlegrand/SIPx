
using System;
using System.Collections.Generic;
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

        public Task<List<AdminClassificationDetails>> GetClassifications(int LanguageId)
        {
            string usp = "usp_AdminClassficationList @LanguageID";
            return _sqlDataAccess.LoadData<AdminClassificationDetails, dynamic>(usp, new { LanguageID = LanguageId });
        }

        public Task<AdminClassificationDetails> GetClassificationById(int Id, int LanguageId)
        {
            string usp = "usp_AdminClassficationDetails @classificationId,  @LanguageID";
            return _sqlDataAccess.LoadSingleRecord<AdminClassificationDetails, dynamic>(usp, new { ClassificationId = Id, LanguageID = LanguageId });

        }
        public bool PostClassification(AdminClassificationCreate Classification)
        {
            string usp = "usp_classificationCreate @LanguageID, @StatusID, @DefaultPageId, @HasDropDown, @DropDownSequence, @CreatorId, @Name, @Description, @MenuName, @MouseOver";
            _sqlDataAccess.SaveData<AdminClassificationCreate>(usp, Classification);
            return true;
        }
        public bool PutClassification(AdminClassificationUpdate Classification)
        {
            string usp = "usp_AdminClassificationUpdate @StatusID , @DefaultPageID , @HasDropDown , @DropDownSequence , @ModifierID , @ClassificationID , @Name , @Description , @MenuName , @MouseOver , @LanguageID";
            _sqlDataAccess.SaveData<AdminClassificationUpdate>(usp, Classification);
            return true;
        }
    }
}
