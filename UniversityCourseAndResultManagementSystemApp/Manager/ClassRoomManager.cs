using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Gateway;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Manager
{
    public class ClassRoomManager
    {
        ClassRoomGateway classRoomGateway = new ClassRoomGateway();
        DepartmentManager departmentManager = new DepartmentManager();
        CourseManager courseManager = new CourseManager();

        public List<Department> GetAllDepartmetns()
        {
            return departmentManager.GetAllDepartments();
        }

        public List<Course> GetAllCourses()
        {
            return courseManager.GetAllCourses();
        }

        public string SaveAllocateClassRoom(AllocateClassRoom allocateClassRoom)
        {
            if (classRoomGateway.SaveAllocateClassRoom(allocateClassRoom) > 0)
            {
                return "Save Successfull.";
            }
            return "Sory! Save fail.";
        }

        public List<ClassSheduleIntoModel> GetAllClassSheduleIntoList()
        {
            return classRoomGateway.GetAllClassSheduleIntoList();
        }

    }
}