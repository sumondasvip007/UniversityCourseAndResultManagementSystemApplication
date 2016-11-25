using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystemApp.Models;

namespace UniversityCourseAndResultManagementSystemApp.Gateway
{
    public class ClassRoomGateway:Gateway
    {
        public int SaveAllocateClassRoom(AllocateClassRoom allocate)
        {
            Query = "INSERT INTO AllocateClassRoom(DepartmentId,CourseId,RoomNo,DayN,StrartFrom,EndTo) VALUES (" + allocate.DepartmentId + "," + allocate.CourseId + ",'" + allocate.RoomNo + "','" + allocate.Day + "','" + allocate.From + "','" + allocate.To + "')";
            Command.CommandText = Query;
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public List<ClassSheduleIntoModel> GetAllClassSheduleIntoList()
        {
            List<ClassSheduleIntoModel> sheduleIntoList = new List<ClassSheduleIntoModel>();
            Query = "SELECT * FROM ScheduleInfoView";
            Command.CommandText = Query;
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                ClassSheduleIntoModel classSheduleIntoModel = new ClassSheduleIntoModel();
                classSheduleIntoModel.DepartmentId = Convert.ToInt32(Reader["DepartmentId"]);
                classSheduleIntoModel.CourseId = Convert.ToInt32(Reader["Id"]);
                classSheduleIntoModel.CourseCode = Reader["Code"].ToString();
                classSheduleIntoModel.CourseName = Reader["Name"].ToString();
                classSheduleIntoModel.SheduleInfo = Reader["ScheduleInfo"].ToString();
                sheduleIntoList.Add(classSheduleIntoModel);
            }
            Reader.Close();
            Connection.Close();
            return sheduleIntoList;
        }
    }
}