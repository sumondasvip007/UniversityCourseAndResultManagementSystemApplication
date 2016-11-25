using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Gateway;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Manager
{
    public class TeacherManager
    {
        DepartmentManager departmentManager = new DepartmentManager();
        TeacherGateway teacherGateway = new TeacherGateway();
        CourseManager CourseManager = new CourseManager();
        AssingCourseViewManager assingCourseViewManager = new AssingCourseViewManager();

        public List<Department> GetAllDepartments()
        {
            return departmentManager.GetAllDepartments();
        }

        public string SaveTeacher(Teacher teacher)
        {
            if (teacherGateway.FindDuplicatEmail(teacher.Email) == null)
            {
                if (teacherGateway.SaveTeacher(teacher) > 0)
                {
                    return "Save Successfully.";
                }
                else
                {
                    return "Sory! Save Fail.";
                }
            }
            else
            {
                return teacherGateway.FindDuplicatEmail(teacher.Email);
            }

        }

        public List<Teacher> GetAllTeachers()
        {
            return teacherGateway.GetAllTeacher();
        }

        public List<Course> GetAllCourses()
        {
            return CourseManager.GetAllCourses();
        }

        public decimal GetTakenCredit(int dId, int tId)
        {
            return assingCourseViewManager.GetTakenCredit(dId, tId);
        }
    }
}