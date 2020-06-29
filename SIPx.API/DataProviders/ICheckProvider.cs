using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ICheckProvider
    {
        Task<bool> CheckClassification(int ClassificationID);
        Task<bool> CheckClassificationValue(int ClassificationValueID);
        Task<bool> CheckContent(int ContentID);
        Task<bool> CheckCountry(int CountryID);
        Task<int> CheckIfRecordExists(string TableName, string IDField, int ID);
        Task<bool> CheckLanguage(int LanguageID);
        Task<bool> CheckOrganization(int OrganizationID);
        Task<bool> CheckOrganizationRole(string RoleID);
        Task<bool> CheckProject(int ProjectID);
        Task<bool> CheckProjectRole(string RoleID);
        Task<bool> CheckRole(string RoleID);
        Task<bool> CheckSecurityLevel(int SecurityLevelID);
        Task<bool> CheckUser(string UserID);
        Task<bool> CheckUserRelation(int PersonRelationID);
        Task<List<int>> NewProcessGetInitialTemplateList();
    }
}