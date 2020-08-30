using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonCreateGet
    {
        [Key]
        public string Salutation { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string PersonalTitle { get; set; }
        public string Suffix { get; set; }
        public string NickName { get; set; }
        public string FirstNameLocal { get; set; }
        public string MiddleNameLocal { get; set; }
        public string LastNameLocal { get; set; }
        public string UserId { get; set; }
        public int GenderId { get; set; }
        public DateTime BirthDate { get; set; }
        public DateTime DeceasedDate { get; set; }
        public int DefaultOrganizationId { get; set; }
        public string CreatorId { get; set; }
        public List<GenderList> Genders { get; set; }
        public List<UserList> Users { get; set; }
        public List<OrganizationList> Organizations { get; set; }

    }
}
