﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontIndexGetPanels
    {
        [Key]
        public int PageSectionId { get; set; }
        public string QueryBuilderRule { get; set; }
        public int PageSectionTypeId { get; set; }
        public int PageSectionDataTypeId { get; set; }
        public int SizeX { get; set; }
        public int SizeY { get; set; }
        public int DashboardRow { get; set; }
        public int DashboardColumn { get; set; }
        public string PanelId { get; set; }
        public string SubPanelId { get; set; }
        public string PageSectionTitleName { get; set; }
        public string PageSectionTitleDescription { get; set; }
        public bool ShowSectionTitleName { get; set; }
        public bool ShowSectionTitleDescription { get; set; }

        public List<AppointmentData> PersonalCalendars { get; set; }
        public List<AppointmentData> OrganizationCalendars { get; set; }
        public List<AppointmentData> ProjectCalendars { get; set; }
        public List<AppointmentData> EventCalendars { get; set; }
        public List<ToDoIndexGet> ToDos { get; set; }
        public List<ContentForPanel> Contents { get; set; }
        public List<ProcessForPanel> Processes { get; set; }
        public List<OrganizationForPanel> Organizations { get; set; }
        public List<PersonForPanel> Persons { get; set; }
        public List<ProjectForPanel> Projects { get; set; }
        public List<ClassificationValueForPanel> ClassificationValues { get; set; }
    }
}
