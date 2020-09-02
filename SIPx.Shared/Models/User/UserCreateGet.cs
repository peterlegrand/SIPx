using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserCreateGet
    {
        [Key]
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
        public string Email { get; set; }
        public string UserPhoneNumber { get; set; }
        public bool PhoneNumberConfirmed { get; set; }
        public bool TwoFactorEnabled { get; set; }
        public DateTime LockOutEnd { get; set; }
        public bool LockOutEnabled { get; set; }
        public int AccessFailedCount { get; set; }
        public string SecurityLevelName { get; set; }
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
        public int GenderId { get; set; }
        public int DefaultLanguageId { get; set; }
        public DateTime BirthDate { get; set; }
        public int DefaultOrganizationId { get; set; }
        public int SecurityLevelId { get; set; }
        public string ModifierCreator { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<GenderList> Genders { get; set; }
        public List<LanguageList> Languages { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
    }
}
