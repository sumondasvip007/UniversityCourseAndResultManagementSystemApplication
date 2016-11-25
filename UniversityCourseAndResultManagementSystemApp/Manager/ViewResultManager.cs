using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Gateway;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Manager
{
    public class ViewResultManager
    {
        ViewResultGateway resultGateway=new ViewResultGateway();

        public List<ResultView> GetAllCourseCodeNameResultByStudentId(int studentId)
        {
            return resultGateway.GetAllCourseCodeNameResultByStudentId(studentId);
        }
    }
}