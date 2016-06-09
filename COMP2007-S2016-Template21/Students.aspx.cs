using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// using statements that are required to connect to EF DB
using COMP2007_S2016_Template21.Models;
using System.Web.ModelBinding;

namespace COMP2007_S2016_Template21
{
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if loading the page for the first time, populate the student grid
            if (!IsPostBack)
            {
                // Get the student data
                this.GetStudents();
            }
        }

        /**
         * <summary>
         * This method gets the student data from the DB
         * </summary>
         * 
         * @method GetStudents
         * @returns {void}
         */
        protected void GetStudents()
        {
            // connect to EF
            using (DefaultConnection db = new DefaultConnection())
            {
                // query the Students Table using EF and LINQ
                var Students = (from allStudents in db.Students
                                select allStudents);

                // bind the result to the GridView
                StudentsGridView.DataSource = Students.ToList();
                StudentsGridView.DataBind();
            }
        }
        /// <summary>
        /// This method is used to delete student records from the database using EF
        /// </summary>
        /// @method StudentsGridView_RowDeleting
        /// <param name="sender">Object</param>
        /// <param name="e">GridViewDeleteEventArgs</param>

        protected void StudentsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //store which row was selected for deletion
            int selectedRow = e.RowIndex;

            //get the selected student id using the grid's Datakey collection
            int StudentID = Convert.ToInt32(StudentsGridView.DataKeys[selectedRow].Values["StudentID"]);

            //use EF to find selected student from the DB and remove it
            using (DefaultConnection db = new DefaultConnection())
            {
                Student deletedStudent = (from studentRecords 
                                          in db.Students
                                          where studentRecords.StudentID == StudentID
                                          select studentRecords).FirstOrDefault();

                //Remove student record from DB and save changes

                db.Students.Remove(deletedStudent);
                db.SaveChanges();

                //refresh the grid
                GetStudents();


            }
        }
    }
}