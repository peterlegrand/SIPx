using System;

namespace SIPx.Shared
{
    public interface ISettingEditGet
    {
        int DateTimeValue { get; set; }
        string Description { get; set; }
        Guid GuidValue { get; set; }
        int IntValue { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int SettingId { get; set; }
        string StringValue { get; set; }
    }
}