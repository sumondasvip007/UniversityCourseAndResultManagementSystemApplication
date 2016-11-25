using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Gateway
{
    public class CourseGateway:Gateway
    {
        public int SaveCourse(Course course)
        {
            Query = "INSERT INTO Course VALUES('" + course.Code + "','" + course.Name + "'," + course.Credit + ",'" +
                    course.Description + "'," + course.DepartmentId + ",'" + course.Semester + "')";
            Command.CommandText = Query;
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }
        //public string FindDuplicateCodeAndName(Course course)
        //{
        //    Query = "SELECT * FROM Course WHERE Code='" + course.Code + "' OR Name='" + course.Name + "'";
        //    Command.CommandText = Query;
        //    string message = null;
        //    Connection.Open();
        //    Reader = Command.ExecuteReader();
        //    if (Reader.HasRows)
        //    {
        //        message = "Code or Name Alrady Exist.";
        //    }
        //    Reader.Close();
        //    Connection.Close();
        //    return message;
        //}



        public string FindDuplicateCode(Course course)
        {
            Query = "SELECT * FROM Course WHERE Code='" + course.Code + "'";
            Command.CommandText = Query;
            string message = null;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                message = "Course Code Already Exist.";
            }
            Reader.Close();
            Connection.Close();
            return message;
        }


        public string FindDuplicateName(Course course)
        {
            Query = "SELECT * FROM Course WHERE Name='" + course.Name + "'";
            Command.CommandText = Query;
            string message = null;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                message = "Course Name Already Exist.";
            }
            Reader.Close();
            Connection.Close();
            return message;
        }



        public List<Course> GetAllCourses()
        {
            List<Course> courses = new List<Course>();
            Query = "SELECT * FROM Course";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                Course course = new Course();
                course.Id = Convert.ToInt32(Reader["Id"]);
                course.Code = Reader["Code"].ToString();
                course.Name = Reader["Name"].ToString();
                course.Credit = Convert.ToDecimal(Reader["Credit"]);
                course.DepartmentId = Convert.ToInt32(Reader["DepartmentId"]);

                courses.Add(course);
            }

            Reader.Close();
            Connection.Close();
            return courses;
        }
    }
}