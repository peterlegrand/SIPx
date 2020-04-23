using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationProvider
    {
        Task<AdminClassificationDetails> GetClassificationById(int Id, int LanguageId);
        Task<List<AdminClassificationDetails>> GetClassifications(int LanguageId);
        List<AdminClassificationDetails> GetClassifications2(int LanguageId);
        bool PostClassification(ClassificationCreate Classification);
        bool PutClassification(ClassificationUpdate Classification);
    }
}