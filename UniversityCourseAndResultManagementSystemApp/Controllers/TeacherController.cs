using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystemApp.Manager;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Controllers
{
    public class TeacherController : Controller
    {

        TeacherManager teacherManager=new TeacherManager();
        //
        // GET: /Teacher/
        public ActionResult Save()
        {
            ViewBag.GetAllDesignation = GetAllDesignation();
            ViewBag.listOfDepartments = teacherManager.GetAllDepartments();
            return View();
        }

        [HttpPost]
        public ActionResult Save(Teacher teacher)
        {
            ViewBag.message = teacherManager.SaveTeacher(teacher);
            ViewBag.GetAllDesignation = GetAllDesignation();
            ViewBag.listOfDepartments = teacherManager.GetAllDepartments();
            ModelState.Clear();
            return View();
        }

        private List<SelectListItem> GetAllDesignation()
        {
            List<SelectListItem> designation = new List<SelectListItem>
            {
                new SelectListItem {Value = "", Text = "---Select---"},
                new SelectListItem {Value = "P", Text = "Professor"},
                new SelectListItem {Value = "AP", Text = "Assistent Professore"},
                new SelectListItem {Value = "SL", Text = "Senior Lecturer"},
                new SelectListItem {Value = "L", Text = "Lecturer"},
            };
            return designation;
        }
	}
}