using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonCreatePost : IPersonCreatePost
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
        public int GenderID { get; set; }
        public DateTime Birthdate { get; set; }
        public DateTime DeceasedDate { get; set; }
        public int DefaultOrganizationID { get; set; }
        public string UserId { get; set; }
        public string ModifierCreator { get; set; }

    }
}
