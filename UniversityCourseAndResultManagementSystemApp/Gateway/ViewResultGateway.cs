using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Gateway
{
    public class ViewResultGateway:Gateway
    {
        public List<ResultView> GetAllCourseCodeNameResultByStudentId(int studentId)
        {

            List<ResultView> codeNameGradeList = new List<ResultView>();
            Query = "SELECT * FROM viewCodeNameGradeFromStudentId WHERE StudentId=" + studentId + " ";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                ResultView resultView = new ResultView();
                resultView.StudentId = Convert.ToInt32(Reader["StudentId"]);
                resultView.CourseCode = Reader["CourseCode"].ToString();
                resultView.CourseName = Reader["CourseName"].ToString();
                resultView.Grade = Reader["Grade"].ToString();
                

                codeNameGradeList.Add(resultView);
            }
            Reader.Close();
            Connection.Close();
            return codeNameGradeList;
        }
    }
}