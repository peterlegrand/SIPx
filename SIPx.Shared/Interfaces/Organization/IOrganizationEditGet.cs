using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IOrganizationEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int OrganizationId { get; set; }
        int OrganizationLanguageId { get; set; }
        List<OrganizationList> Organizations { get; set; }
        int OrganizationTypeId { get; set; }
        List<OrganizationTypeList> OrganizationTypes { get; set; }
        int? ParentOrganizationId { get; set; }
        List<StatusList> Statuses { get; set; }
        int StatusId { get; set; }
    }
}