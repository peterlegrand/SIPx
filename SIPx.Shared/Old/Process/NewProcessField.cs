using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SIPx.Shared
{
    public class NewProcessField
    {
        public static DataTable CreateTable()
        {
            DataTable ProcessFields = new DataTable();
            ProcessFields.Columns.Add("ProcessTypeID", typeof(Int32));
            ProcessFields.Columns.Add("ProcessTypeFieldID", typeof(Int32));
            ProcessFields.Columns.Add("StringValue", typeof(string));
            ProcessFields.Columns.Add("IntValue", typeof(Int32));
            ProcessFields.Columns.Add("DateTimeValue", typeof(DateTime));
            return ProcessFields;
        }

    }
}
