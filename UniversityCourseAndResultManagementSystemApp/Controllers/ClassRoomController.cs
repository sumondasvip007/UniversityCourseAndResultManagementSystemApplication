﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystemApp.Manager;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Controllers
{
    public class ClassRoomController : Controller
    {
     
        private ClassRoomManager classRoomManager = new ClassRoomManager();


        //
        // GET: /ClassRoom/
        public ActionResult Allocate()
        {
            ViewBag.departmentList = classRoomManager.GetAllDepartmetns();
            ViewBag.roomNo = GetAllRoomNo();
            ViewBag.day = GetAllDay();
            return View();
        }

        [HttpPost]
        public ActionResult Allocate(AllocateClassRoom allocateClassRoom)
        {
            ViewBag.message = classRoomManager.SaveAllocateClassRoom(allocateClassRoom);
            ViewBag.departmentList = classRoomManager.GetAllDepartmetns();
            ViewBag.roomNo = GetAllRoomNo();
            ViewBag.day = GetAllDay();
            return View();
        }

        public JsonResult GetCourseCodeByDepartmentId(int deptId)
        {
            var courses = classRoomManager.GetAllCourses();
            var studentList = courses.Where(x => x.DepartmentId == deptId).ToList();
            return Json(studentList, JsonRequestBehavior.AllowGet);
        }


        private List<SelectListItem> GetAllRoomNo()
        {
            List<SelectListItem> RoomNo = new List<SelectListItem>
            {

                new SelectListItem {Value = "R.NO:A-101", Text = "A-101"},
                new SelectListItem {Value = "R.NO:A-102", Text = "A-102"},
                new SelectListItem {Value = "R.NO:A-103", Text = "A-103"},
                new SelectListItem {Value = "R.NO:A-104", Text = "A-104"},
                new SelectListItem {Value = "R.NO:A-201", Text = "A-201"},
                new SelectListItem {Value = "R.NO:A-202", Text = "A-202"},
                new SelectListItem {Value = "R.NO:A-203", Text = "A-203"},
                new SelectListItem {Value = "R.NO:A-204", Text = "A-204"}
            };

            return RoomNo;
        }

        private List<SelectListItem> GetAllDay()
        {
            List<SelectListItem> Day = new List<SelectListItem>
            {

                new SelectListItem {Value = "Sat", Text = "Saterday"},
                new SelectListItem {Value = "Sun", Text = "Sunday"},
                new SelectListItem {Value = "Mon", Text = "Monday"},
                new SelectListItem {Value = "Twe", Text = "Twesday"},
                new SelectListItem {Value = "Wed", Text = "Wednesday"},
                new SelectListItem {Value = "Thu", Text = "Thusday"},
                new SelectListItem {Value = "Fri", Text = "Friday"}

            };
            return Day;
        }

        public ActionResult ClassSchedul()
        {
            ViewBag.listOfDepartments = classRoomManager.GetAllDepartmetns();
            return View();
        }
        public JsonResult GetClassroomSheduleByDepartmentId(int deptId)
        {
            var sheduleList = classRoomManager.GetAllClassSheduleIntoList();
            var courseSheduleList = sheduleList.Where(x => x.DepartmentId == deptId).ToList();
            //foreach (ClassSheduleIntoModel classShedule in courseSheduleList)
            //{
            //    if (classShedule.SheduleInfo.Length < 0)
            //    {
            //        classShedule.SheduleInfo = "Not Scheduled Yet";
            //    }
            //}


            foreach (var classShedule in courseSheduleList)
            {
                if (classShedule.SheduleInfo.Length < 1)
                {
                    classShedule.SheduleInfo = "Not Scheduled Yet";
                }
            }



            return Json(courseSheduleList, JsonRequestBehavior.AllowGet);
        }
	}
}