using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Rotativa;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystemApp.Manager;

namespace UniversityCourseAndResultManagementSystemApp.Controllers
{
    public class ResultViewController : Controller
    {

        StudentManager studentManager = new StudentManager();
        CourseEnrollManager courseEnrollManager = new CourseEnrollManager();
        ViewResultManager viewResultManager=new ViewResultManager();
        //
        // GET: /ResultView/
        public ActionResult ViewResult()
        {
            ViewBag.listOfStudentRegNo = studentManager.GetAllStudents.ToList();
            return View();
        }



        public JsonResult GetNameEmailDepartmentByStudentId(int studentId)
        {
            var aStudent = courseEnrollManager.GetAllStudentDetails(studentId);
            var studentList = aStudent.Where(student => student.Id == studentId).ToList();
            return Json(studentList, JsonRequestBehavior.AllowGet);
        }



        public JsonResult GetResultByStudentId(int studentId)
        {

            var courseList = viewResultManager.GetAllCourseCodeNameResultByStudentId(studentId);
            foreach (var course in courseList)
            {
                if (course.Grade.Length < 1)
                {
                    course.Grade = "Not Graded Yet";
                }
            }
            return Json(courseList, JsonRequestBehavior.AllowGet);
        }



        public ActionResult MakePdf()
        {
            return new ActionAsPdf("ViewResult")
            {
                FileName = Server.MapPath("~/Content/studentResult.pdf   ")
            };
        }






    
	}
}