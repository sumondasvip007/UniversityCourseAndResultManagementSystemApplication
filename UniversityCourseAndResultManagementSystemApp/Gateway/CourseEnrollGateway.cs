using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Gateway
{
    public class CourseEnrollGateway:Gateway
    {

        public List<ViewStudentDetails> GetAllStudentDetails(int studentId)
        {
            List<ViewStudentDetails> viewStudentDetailses = new List<ViewStudentDetails>();
            Query = "SELECT * FROM ViewStudentDetails where StudentId='" + studentId + "'";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                ViewStudentDetails aViewStudentDetails = new ViewStudentDetails();
                aViewStudentDetails.Id = Convert.ToInt32(Reader["StudentId"]);
                aViewStudentDetails.Name = Reader["StudentName"].ToString();
                aViewStudentDetails.Email = Reader["StudentEmail"].ToString();
                aViewStudentDetails.RegNo = Reader["StudentRegNo"].ToString();
                aViewStudentDetails.DepartmentName = Reader["DepartmentName"].ToString();
                viewStudentDetailses.Add(aViewStudentDetails);
            }

            Reader.Close();
            Connection.Close();
            return viewStudentDetailses;
        }


        public List<ViewCourseFromStudentDepartmentName> GetAllCourseFromStudentDepartmentNames(int studentId)
        {
            List<ViewCourseFromStudentDepartmentName> viewCourseFromStudentDepartment = new List<ViewCourseFromStudentDepartmentName>();
            Query = "SELECT * FROM ViewCourseFromStudentDepartmentMenu where StudentId='" + studentId + "'";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                ViewCourseFromStudentDepartmentName aViewStudentDepartmentName = new ViewCourseFromStudentDepartmentName();
                aViewStudentDepartmentName.CourseId = Convert.ToInt32(Reader["CourseId"]);
                aViewStudentDepartmentName.CourseName = Reader["CourseName"].ToString();
                aViewStudentDepartmentName.DepartmentId = Convert.ToInt32(Reader["DepartmentId"]);
                aViewStudentDepartmentName.StudentId = Convert.ToInt32(Reader["StudentId"]);
                aViewStudentDepartmentName.StudentDepartmentId = Convert.ToInt32(Reader["StudentDepartmentId"]);
                viewCourseFromStudentDepartment.Add(aViewStudentDepartmentName);
            }

            Reader.Close();
            Connection.Close();
            return viewCourseFromStudentDepartment;
        }


        public int EnrollCourse(CourseEnroll courseEnroll)
        {
            Query = "INSERT INTO EnrollCourse VALUES('" + courseEnroll.StudentId + "','" + courseEnroll.CourseId + "','" + courseEnroll.EnrollDate + "')";
            Command.CommandText = Query;
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }


        public string FindSameCourseForAStudent(CourseEnroll courseEnroll)
        {
            Query = "SELECT * FROM EnrollCourse WHERE StudentId='" + courseEnroll.StudentId + "' AND CourseId='" + courseEnroll.CourseId + "'";
            Command.CommandText = Query;
            string message = null;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                message = "This Course Already Enroll by This Student";
            }
            Reader.Close();
            Connection.Close();
            return message;
        }

    }
}