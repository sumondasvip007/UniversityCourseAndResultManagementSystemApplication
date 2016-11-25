﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystemApp.Manager;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Controllers
{
    public class StudentResultSaveController : Controller
    {
        StudentManager studentManager = new StudentManager();
        CourseEnrollManager courseEnrollManager=new CourseEnrollManager();
        StudentResultSaveManager studentResultSaveManager=new StudentResultSaveManager();
        //
        // GET: /StudentResultSave/
        public ActionResult SaveResult()
        {
            ViewBag.listOfStudentRegNo = studentManager.GetAllStudents.ToList();
            ViewBag.listOfGrade = getAllGradeList();
            return View();
        }

        [HttpPost]
        public ActionResult SaveResult(StudentResultSaveModel studentResultSaveModel)
        {
            ViewBag.listOfStudentRegNo = studentManager.GetAllStudents.ToList();
            ViewBag.listOfGrade = getAllGradeList();
            ViewBag.message = studentResultSaveManager.SaveStudentResult(studentResultSaveModel);
            ModelState.Clear();
            return View();
        }

        public JsonResult GetNameEmailDepartmentByStudentId(int studentId)
        {
            var aStudent = courseEnrollManager.GetAllStudentDetails(studentId);
            var studentList = aStudent.Where(student => student.Id == studentId).ToList();
            return Json(studentList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetEnrollCourseByStudentId(int studentId)
        {
            var aStudent = studentResultSaveManager.GetAllEnrollCourseFromStudentId(studentId);
            var courseList = aStudent.Where(student => student.StudentId== studentId).ToList();
            return Json(courseList, JsonRequestBehavior.AllowGet);
        }
      




        private List<SelectListItem> getAllGradeList()
        {
            List<SelectListItem> grade = new List<SelectListItem>
            {
                new SelectListItem {Value = "", Text = "---Select---"},
                new SelectListItem {Value = "A+", Text = "A+"},
                new SelectListItem {Value = "A", Text = "A"},
                new SelectListItem {Value = "A-", Text = "A-"},
                new SelectListItem {Value = "B+", Text = "B+"},
                new SelectListItem {Value = "B", Text = "B"},
                new SelectListItem {Value = "B-", Text = "B-"},
                new SelectListItem {Value = "C+", Text = "C+"},
                 new SelectListItem {Value = "C", Text = "C"},
                new SelectListItem {Value = "C-", Text = "C-"},
                new SelectListItem {Value = "D+", Text = "D+"},
                new SelectListItem {Value = "D", Text = "D"},
                new SelectListItem {Value = "D-", Text = "D-"},
                new SelectListItem {Value = "F", Text = "F"},
               
               
            };
            return grade;
        }

      
	}
}