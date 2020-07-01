using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IPersonTelecomEditGet
    {
        string AreaCode { get; set; }
        string AskForName { get; set; }
        string CountryCode { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string ExtensionCode { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        int PersonId { get; set; }
        int PersonTelecomId { get; set; }
        int TelecomTypeId { get; set; }
        List<TelecomTypeList> TelecomTypes { get; set; }
        string TelecomValue { get; set; }
    }
}