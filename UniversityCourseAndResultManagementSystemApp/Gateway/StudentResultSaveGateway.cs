using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Gateway
{
    public class StudentResultSaveGateway:Gateway
    {

        public List<ViewEnrollCourseByAStudentId> GetAllEnrollCourseFromStudentId(int studentId)
        {
            List<ViewEnrollCourseByAStudentId> viewEnrollCourseByAStudentIds = new List<ViewEnrollCourseByAStudentId>();
            Query = "SELECT * FROM viewEnrollCourseByStudentId where StudentId='" + studentId + "'";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                ViewEnrollCourseByAStudentId aViewEnrollCourseByAStudentId = new ViewEnrollCourseByAStudentId();
                aViewEnrollCourseByAStudentId.CourseId = Convert.ToInt32(Reader["CourseId"]);
                aViewEnrollCourseByAStudentId.CourseName = Reader["CourseName"].ToString();
                aViewEnrollCourseByAStudentId.EnrollStudentId = Convert.ToInt32(Reader["EnrollStudentId"]);
                aViewEnrollCourseByAStudentId.EnrollCourseId = Convert.ToInt32(Reader["EnrollCourseId"]);
                aViewEnrollCourseByAStudentId.StudentId = Convert.ToInt32(Reader["StudentId"]);
                viewEnrollCourseByAStudentIds.Add(aViewEnrollCourseByAStudentId);
            }

            Reader.Close();
            Connection.Close();
            return viewEnrollCourseByAStudentIds;
        }


        public int SaveStudentResult(StudentResultSaveModel studentResultSaveModel)
        {
            Query = "INSERT INTO StudentResult VALUES('" + studentResultSaveModel.StudentId + "','" + studentResultSaveModel.CourseId + "','" + studentResultSaveModel.Grade + "')";
            Command.CommandText = Query;
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }


        public string FindSameCourseForAStudentWhichAssignAGrade(StudentResultSaveModel studentResultSaveModel)
        {
            Query = "SELECT * FROM StudentResult WHERE StudentId='" + studentResultSaveModel.StudentId + "' AND CourseId='" + studentResultSaveModel.CourseId + "'";
            Command.CommandText = Query;
            string message = null;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                message = "Grade Already assign for this Course by this Student";
            }
            Reader.Close();
            Connection.Close();
            return message;
        }

    }
}