using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystemApp.Manager;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Controllers
{
    public class StudentController : Controller
    {
        private string message;
        StudentManager studentManager=new StudentManager();
        //
        // GET: /Student/

      
        public ActionResult Register()
        {
            ViewBag.listOfDepartments = studentManager.GetAllDepartments();
            return View();
        }
        [HttpPost]

        public ActionResult Register(Student student)
        {
            message = studentManager.SaveStudent(student);
            ViewBag.listOfDepartments = studentManager.GetAllDepartments();
            ViewBag.Message = message;
            ModelState.Clear();
            return View();
        }
	}
}