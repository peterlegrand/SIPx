using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ICheckProvider
    {
        Task<bool> CheckClassification(int ClassificationId);
        Task<bool> CheckClassificationValue(int ClassificationValueId);
        Task<bool> CheckContent(int ContentId);
        Task<bool> CheckCountry(int CountryId);
        Task<int> CheckIfRecordExists(string TableName, string IDField, int Id);
        Task<bool> CheckLanguage(int LanguageId);
        Task<bool> CheckOrganization(int OrganizationId);
        Task<bool> CheckOrganizationRole(string RoleId);
        Task<bool> CheckProject(int ProjectId);
        Task<bool> CheckProjectRole(string RoleId);
        Task<bool> CheckRole(string RoleId);
        Task<bool> CheckSecurityLevel(int SecurityLevelId);
        Task<bool> CheckUser(string UserId);
        Task<bool> CheckUserRelation(int PersonRelationId);
        Task<List<int>> NewProcessGetInitialTemplateList();
        Task<int> CheckIfRecordExists(string TableName, string IDField, string Id);
        Task<List<ErrorMessage>> NoRightsMessage(string UserId);
    }
}