using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;

namespace UniversityCourseAndResultManagementSystemApp.Models
{
    public class Department
    {
       

        public Nullable<int> Id { set; get; }

        [Required(ErrorMessage = "Enter the Code number of Department")]
        [StringLength(7, MinimumLength = 2, ErrorMessage = " code must be 2 to 7 characters long.")]
        
        public string Code { set; get; }
        [Required(ErrorMessage = "Enter the Name of Department")]
       
        public string Name { set; get; }


        public Department(int? id, string code, string name)
        {
            Id = id;
            Code = code;
            Name = name;
        }

        public Department()
        {
            // TODO: Complete member initialization
        }
    }


}