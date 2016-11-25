using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityCourseAndResultManagementSystemApp.Gateway
{
    public class CourseAssignGateway:Gateway
    {
        public int Save(int d, int t, int c)
        {
            Query = "INSERT INTO CourseAssign VALUES('" + d + "','" + t + "'," + c + ")";
            Command.CommandText = Query;
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public bool OverlapCourse(int tid, int cid)
        {
            Query = "SELECT * FROM CourseAssign WHERE TeacherId=" + tid + " AND CourseId=" + cid + "";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                return true;
            }

            Reader.Close();
            Connection.Close();
            return false;
        }
        public bool AssignCourse(int cid)
        {
            Query = "SELECT * FROM CourseAssign WHERE CourseId =" + cid + "";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                return true;
            }

            Reader.Close();
            Connection.Close();
            return false;
        }

    }
}