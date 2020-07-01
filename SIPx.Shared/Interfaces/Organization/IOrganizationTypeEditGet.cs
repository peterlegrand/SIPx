using System;

namespace SIPx.Shared
{
    public interface IOrganizationTypeEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        bool Internal { get; set; }
        bool LegalEntity { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int OrganizationTypeId { get; set; }
        int OrganizationTypeLanguageId { get; set; }
    }
}