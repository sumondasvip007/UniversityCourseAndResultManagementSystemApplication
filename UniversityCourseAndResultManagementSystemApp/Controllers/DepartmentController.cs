using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystemApp.Manager;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Controllers
{
    public class DepartmentController : Controller
    {
        DepartmentManager departmentManager = new DepartmentManager();
        //
        // GET: /Department/
        public ActionResult Save()
        {
            return View();
        }

        [HttpPost]

        public ActionResult Save(Department department)
        {
            ViewBag.message = departmentManager.SaveDepartment(department);
            ModelState.Clear();
            return View();
        }

        public ActionResult ViewAllDepartment()
        {
            ViewBag.DepartmentList = departmentManager.GetAllDepartments();
            return View();
        }
	}
}