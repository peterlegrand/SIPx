using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ObjectTypePropertyCreateGetWithErrorMessages
    {
        [Key]
        public ObjectTypePropertyCreateGet ObjectTypeProperty { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
