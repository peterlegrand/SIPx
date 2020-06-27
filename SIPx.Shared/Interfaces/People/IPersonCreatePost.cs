using System;

namespace SIPx.Shared
{
    public interface IPersonCreatePost
    {
        DateTime Birthdate { get; set; }
        DateTime DeceasedDate { get; set; }
        int DefaultOrganizationID { get; set; }
        string FirstName { get; set; }
        string FirstNameLocal { get; set; }
        int GenderID { get; set; }
        string LastName { get; set; }
        string LastNameLocal { get; set; }
        string MiddleName { get; set; }
        string MiddleNameLocal { get; set; }
        string ModifierCreator { get; set; }
        string NickName { get; set; }
        string PersonalTitle { get; set; }
        string Salutation { get; set; }
        string Suffix { get; set; }
        string UserId { get; set; }
    }
}