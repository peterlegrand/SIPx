using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SIPx.Shared.Models.FrontProcess
{
    public class ProcessFieldDataTable
    {
            public static DataTable CreateTable()
            {
                DataTable ProcessFields = new DataTable();
                ProcessFields.Columns.Add("ProcessFieldID", typeof(Int32));
                ProcessFields.Columns.Add("ProcessID", typeof(Int32));
                ProcessFields.Columns.Add("StringValue", typeof(string));
                ProcessFields.Columns.Add("IntValue", typeof(Int32));
                ProcessFields.Columns.Add("DateTimeValue", typeof(DateTime));
                ProcessFields.Columns.Add("ModifierId", typeof(string));
                ProcessFields.Columns.Add("ModifiedDate", typeof(DateTime));
                return ProcessFields;

        }
    }
}
