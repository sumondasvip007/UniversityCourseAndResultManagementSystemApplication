using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Gateway;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Manager
{
    public class AssingCourseViewManager
    {
        AssingCourseViewGateway assingCourseViewGateway = new AssingCourseViewGateway();
        public decimal GetTakenCredit(int dId, int tId)
        {
            return assingCourseViewGateway.GetTakenCredit(dId, tId);
        }

        public List<CourseAssingModel> CourseInformation(int departmentId)
        {
            return assingCourseViewGateway.CourseInformation(departmentId);
        }
    }
}