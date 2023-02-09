using DevExpress.Web.Data;
using DevExpress.Web;
using LastTrialGene.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static LastTrialGene.Models.Sample;
using LastTrialGene.Model;
using System.Net.NetworkInformation;
using System.Net.Mail;

namespace LastTrialGene.Controls
{
    public partial class ClientsCreation2 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (HttpContext.Current.Session["UpdateMessage"] !=null)
            {
                string x = HttpContext.Current.Session["UpdateMessage"].ToString();
            }
        }

        public void ShowData()
        {


        }

        public static void WriteLogFile(string message)
        {
            using (FileStream file = new FileStream(System.Web.HttpContext.Current.Server.MapPath("~/errorlog.txt"), FileMode.Append, FileAccess.Write))
            {
                StreamWriter streamWriter = new StreamWriter(file);
                streamWriter.WriteLine(System.DateTime.Now.ToString() + ":" + message + "\n---\n");
                streamWriter.Close();
            }
        }
        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                ((ASPxGridView)sender).JSProperties["cpInsertNote"] = HttpContext.Current.Session["InsertedMessage"];//"The row is inserted successfully";
            }
        }
        //1
        protected void GridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["Kind"] = 1;
            /** e.NewValues["Priority"] = 2;
             e.NewValues["Status"] = 1;
             e.NewValues["IsDraft"] = true;
             e.NewValues["IsArchived"] = false;*/
            //WriteLogFile(e.NewValues["AccountName"].ToString());
        }
        //2
        protected void GridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            if (e.Parameters == "delete")
            {
                List<long> selectedIds = GridView.GetSelectedFieldValues("Id").ConvertAll(id => (long)id);
                DataProvider.DeleteIssues(selectedIds);
                GridView.DataBind();
            }
        }

        protected void GridView_RowUpdated(object sender, ASPxDataUpdatedEventArgs e)
        {
            //

            if (e.Exception == null)
            {
                ((ASPxGridView)sender).JSProperties["cpUpdatedMessage"] = HttpContext.Current.Session["UpdateMessage"];// "Your update has been saved successfully";
            }
        }
        //3
        protected void grid_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            /*  foreach (GridViewColumn column in grid.Columns)
              {
                  GridViewDataColumn dataColumn = column as GridViewDataColumn;
                  if (dataColumn == null) continue;
                  if (e.NewValues[dataColumn.FieldName] == null)
                  {
                      e.Errors[dataColumn] = "Value can't be null.";
                  }
              }*/

            if (e.NewValues["Name"] == null && e.NewValues["IdentificationNo"] == null && e.NewValues["Name3"] == null)
            {
                AddError(e.Errors, GridView.Columns["Name"], "Name Can Not be Null");
                AddError(e.Errors, GridView.Columns["IdentificationNo"], "Name Can Not be Null");
                AddError(e.Errors, GridView.Columns["Name3"], "Name Can Not be Null");
            }
            if (e.NewValues["PhysicalAddress"]==null)
                AddError(e.Errors, GridView.Columns["PhysicalAddress"], "Physical Address Can Not be Null");

            if (e.NewValues["PhoneNo"] == null)
                AddError(e.Errors, GridView.Columns["PhoneNo"], "PhoneNo Can Not be Null");

            if (e.NewValues["EmailAddress"] == null)
                AddError(e.Errors, GridView.Columns["EmailAddress"], "EmailAddress Can Not be Null");
            







        }

        void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
        {
            if (errors.ContainsKey(column)) return;
            errors[column] = errorText;
        }

        protected void grid_EditFormLayoutCreated(object sender, DevExpress.Web.ASPxGridViewEditFormLayoutEventArgs e)
        {
            ASPxGridView gridView = sender as ASPxGridView;
            LayoutGroup layoutGroupDismissal = (LayoutGroup)e.FindLayoutItemOrGroup("DismissalInformation");

            if (layoutGroupDismissal == null) return;

            if (gridView.IsNewRowEditing)
            {
                layoutGroupDismissal.Visible = false;
                return;
            }
            var fireDate = gridView.GetRowValues(e.RowVisibleIndex, "FireDate");
            layoutGroupDismissal.ClientVisible = fireDate != null && (DateTime)fireDate != DateTime.MinValue;
        }

   //     protected void grid_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
     //   {
           /** ASPxGridView gridView = sender as ASPxGridView;
            if (e.Column.FieldName == "FireDate")
            {
                ASPxDateEdit fireDateEditor = e.Editor as ASPxDateEdit;
                fireDateEditor.ClientEnabled = !GridView.IsNewRowEditing;
                fireDateEditor.ClearButton.DisplayMode = ClearButtonDisplayMode.OnHover;
                fireDateEditor.ClientSideEvents.ValueChanged = "onDismissalDateChanged";
            }*/
       // }




    }
}