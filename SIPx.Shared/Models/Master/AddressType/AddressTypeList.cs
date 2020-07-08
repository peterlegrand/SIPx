using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class AddressTypeList
    {
        [Key]
        public int AddressTypeId { get; set; }
        public string Name { get; set; }

    }
}
