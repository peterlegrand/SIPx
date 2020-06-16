using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SIPx.Shared.Process
{
    public class NewProcessField
    {
        public static DataTable CreateTable()
        {
            DataTable ProcessFields = new DataTable();
            ProcessFields.Columns.Add("ProcessTemplateID", typeof(Int32));
            ProcessFields.Columns.Add("ProcessTemplateFieldID", typeof(Int32));
            ProcessFields.Columns.Add("StringValue", typeof(string));
            ProcessFields.Columns.Add("IntValue", typeof(Int32));
            ProcessFields.Columns.Add("DateTimeValue", typeof(DateTime));
            return ProcessFields;
        }

    }
}
