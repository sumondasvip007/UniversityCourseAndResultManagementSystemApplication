﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Gateway;

namespace UniversityCourseAndResultManagementSystemApp.Manager
{
    public class CourseAssingManager
    {
        CourseAssignGateway courseAssignGateway = new CourseAssignGateway();

        public String Save(int did, int tid, int cid)
        {
            if (!courseAssignGateway.OverlapCourse(tid, cid))
            {
                if (!courseAssignGateway.AssignCourse(cid))
                {
                    if (courseAssignGateway.Save(did, tid, cid) > 0)
                    {
                        return "Save Successfully";
                    }
                    else
                    {
                        return "Sory! Save Fail";
                    }
                }
                return "Course Alrady Assing";
            }
            return "Overlape Course";

        }
    }
}