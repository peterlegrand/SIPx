using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class UserUpdateGet
    {
        [Key]
        public int PersonId { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string UserPhoneNumber { get; set; }
        public bool PhoneNumberConfirmed { get; set; }
        public bool TwoFactorEnabled { get; set; }
        public DateTime LockOutEnd { get; set; }
        public string OldPassword { get; set; }
        public string NewPassword { get; set; }
        public string ConfirmPassword { get; set; }
        public bool LockOutEnabled { get; set; }
        public int AccessFailedCount { get; set; }
        public int SecurityLevelId { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }

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
        public DateTime BirthDate { get; set; }
        public int DefaultOrganizationId { get; set; }
        public List<GenderList> Genders { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserModifierId { get; set; }
        //public UserUpdateGetUser User { get; set; }
        //    public UserUpdateGetPerson Person { get; set; }
    }
}
