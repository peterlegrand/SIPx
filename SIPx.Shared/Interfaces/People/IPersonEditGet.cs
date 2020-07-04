using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IPersonEditGet
    {
        DateTime BirthDate { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime DeceasedDate { get; set; }
        int DefaultOrganizationId { get; set; }
        string FirstName { get; set; }
        string FirstNameLocal { get; set; }
        int GenderId { get; set; }
        List<GenderList> Genders { get; set; }
        string LastName { get; set; }
        string LastNameLocal { get; set; }
        string MiddleName { get; set; }
        string MiddleNameLocal { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string NickName { get; set; }
        List<OrganizationList> Organizations { get; set; }
        string PersonalTitle { get; set; }
        int PersonId { get; set; }
        string Salutation { get; set; }
        string Suffix { get; set; }
        string UserId { get; set; }
        List<UserList> Users { get; set; }
    }
}