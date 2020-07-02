using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IPersonRelationEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string FromOrganizationName { get; set; }
        string FromPersonFirstName { get; set; }
        string FromPersonLastName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        int PersonRelationId { get; set; }
        string PersonRelationTypeId { get; set; }
        List<PersonRelationTypeList> PersonRelationTypes { get; set; }
        List<PersonList> Persons { get; set; }
        int ToPersonId { get; set; }
        DateTime ValidFrom { get; set; }
        DateTime? ValidTill { get; set; }
    }
}