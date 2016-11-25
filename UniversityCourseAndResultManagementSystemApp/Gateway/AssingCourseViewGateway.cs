using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Gateway
{
    public class AssingCourseViewGateway : Gateway
    {
        public decimal GetTakenCredit(int dId, int tId)
        {
            decimal takenCredit = 0;
            Query = "SELECT * FROM CourseAssigneView WHERE DepartmentId=" + dId + " AND TeacherId=" + tId + "";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                takenCredit += Convert.ToDecimal(Reader["CourseCerdit"]);
            }
            Connection.Close();
            Reader.Close();
            return takenCredit;
        }
        public List<CourseAssingModel> CourseInformation(int departmentId)
        {
           
            List<CourseAssingModel> remainingCredits = new List<CourseAssingModel>();
            Query = "SELECT * FROM CourseAssigneView WHERE CourseDepartment=" + departmentId + "";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                CourseAssingModel courseAssingModel = new CourseAssingModel();
                courseAssingModel.CourseCode = Reader["CourseCode"].ToString();
                courseAssingModel.CourseName = Reader["CourseName"].ToString();
                courseAssingModel.CourseSemester = Reader["CourseSemester"].ToString();
                courseAssingModel.TeacherName = Reader["TeacherName"].ToString();

                remainingCredits.Add(courseAssingModel);
            }
            Reader.Close();
            Connection.Close();
            return remainingCredits;
        }
    }
}