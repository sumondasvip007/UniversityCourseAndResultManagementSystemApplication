﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Gateway;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Manager
{
    public class CourseEnrollManager
    {
        CourseEnrollGateway courseEnrollGateway=new CourseEnrollGateway();

        public List<ViewStudentDetails> GetAllStudentDetails(int studentId)
        {
            return courseEnrollGateway.GetAllStudentDetails(studentId);
        }

        public List<ViewCourseFromStudentDepartmentName> GetAllCourseFromStudentDepartmentNames(int studentDepartmentId)
        {
            return courseEnrollGateway.GetAllCourseFromStudentDepartmentNames(studentDepartmentId);
        }

         public string EnrollCourse(CourseEnroll courseEnroll)
        {
             if (courseEnrollGateway.FindSameCourseForAStudent(courseEnroll)==null)
             {

                 if (courseEnrollGateway.EnrollCourse(courseEnroll) > 0)
                 {
                     return "Course Enroll Successfully.";
                 }
                 else
                 {
                     return "Sory! Course Enroll Fail.";
                 }
                 
             }

             else
             {
                 return courseEnrollGateway.FindSameCourseForAStudent(courseEnroll);
             }
            }
    }
}