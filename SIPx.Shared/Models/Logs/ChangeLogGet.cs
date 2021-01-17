using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ChangeLogGet
    {
        [Key]
        public int ReadLogId { get; set; }
        public int ColumnId { get; set; }
        public string ColumnName { get; set; }
        public int ChangeTypeId { get; set; }
        public string ChangeTypeName { get; set; }
         public string OldValue { get; set; }
        public string NewValue { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public int PersonId { get; set; }
        public DateTime ChangeLogDate { get; set; }
    }
}
