using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Gateway
{
    public class StudentGateway:Gateway
    {
        public int SaveStudent(Student student)
        {
            Query = "INSERT INTO Student VALUES('" + student.Name + "','" + student.Email + "','" + student.ContactNo + "','" +
                   student.Date + "','" + student.Address + "'," + student.DepartmentId + ",'"+student.RegNo+"')";
            Command.CommandText = Query;
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }
        //public string FindDuplicatEmail(string email)
        //{
        //    Query = "SELECT * FROM Student WHERE Email='" + email + "' ";
        //    Command.CommandText = Query;
        //    string message = null;
        //    Connection.Open();
        //    Reader = Command.ExecuteReader();
        //    if (Reader.HasRows)
        //    {
        //        message = "Email Already Exist.";
        //    }
        //    Reader.Close();
        //    Connection.Close();
        //    return message;
        //}


        public IEnumerable<Student> GetAllStudents()
        {

            Query = "SELECT * FROM Student";
            Command.CommandText = Query;
            List<Student> students = new List<Student>();
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                Student aStudent = new Student();

                aStudent.Id = Convert.ToInt32(Reader["Id"].ToString());
                aStudent.RegNo = Reader["RegNo"].ToString();
                aStudent.Name = Reader["Name"].ToString();
                aStudent.Email = Reader["Email"].ToString();
                aStudent.Address = Reader["Address"].ToString();
                aStudent.ContactNo = Reader["ContactNo"].ToString();
                aStudent.Date = Convert.ToDateTime(Reader["Date"].ToString());
                aStudent.DepartmentId = Convert.ToInt32(Reader["DepartmentId"].ToString());

                students.Add(aStudent);
            }
            Reader.Close();
            Connection.Close();
            return students;
        }


        public string GetLastAddedStudentRegistration(string searchKey)
        {
            string query = "SELECT * FROM Student st WHERE RegNo LIKE '%" + searchKey + "%' and Id=(select Max(Id) FROM Student st WHERE RegNo LIKE '%" + searchKey + "%' )";
            Command.CommandText = query;
            Connection.Open();
            Student aStudent = null;
            string regNo = null;
            Reader = Command.ExecuteReader();
            if (Reader.Read())
            {
                aStudent = new Student
                {
                    Id = Convert.ToInt32(Reader["Id"].ToString()),
                    Name = Reader["Name"].ToString(),
                    RegNo = Reader["RegNo"].ToString(),
                    Email = Reader["Email"].ToString(),
                    ContactNo = Reader["ContactNo"].ToString(),

                };
                regNo = aStudent.RegNo;
            }

            Connection.Close();
            Command.Dispose();
            Reader.Close();
            return regNo;
        }
    }
}