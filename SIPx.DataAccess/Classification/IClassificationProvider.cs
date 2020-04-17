using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationProvider
    {
        Task<AdminClassificationDetails> GetClassificationById(int Id, int LanguageId);
        Task<List<AdminClassificationDetails>> GetClassifications(int LanguageId);
        bool PostClassification(AdminClassificationCreate Classification);
        bool PutClassification(AdminClassificationUpdate Classification);
    }
}