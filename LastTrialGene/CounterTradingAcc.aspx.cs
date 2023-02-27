using DevExpress.Web;
using DevExpress.Web.Data;
using LastTrialGene.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LastTrialGene
{
    public partial class CounterTradingAcc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grid_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {

               





        }

        void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
        {
            if (errors.ContainsKey(column)) return;
            errors[column] = errorText;
        }

        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {

            if (e.Column.FieldName == "ClientName")
            {
                if (Session["SelectedClientName"] != null)
                {
                    e.Editor.Value = Session["SelectedClientName"].ToString();
                }

            }

            if (e.Column.FieldName == "ClientNO")
            {
                if (Session["SelectedClientID"] != null)
                {
                    e.Editor.Value = Session["SelectedClientID"].ToString();
                }

            }


        }

            protected void GridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {


        /*  e.NewValues["Kind"] = 1;
          e.NewValues["Priority"] = 2;
          e.NewValues["Status"] = 1;
          e.NewValues["IsDraft"] = true;
          e.NewValues["IsArchived"] = false;*/

    }





        protected void GridView_RowUpdated(object sender, ASPxDataUpdatedEventArgs e)
        {
            //


            if (e.Exception == null)
            {
                ((ASPxGridView)sender).JSProperties["cpUpdatedMessage"] = HttpContext.Current.Session["UpdateMessage"];// "Your update has been saved successfully";
            }
        }


        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                ((ASPxGridView)sender).JSProperties["cpInsertNote"] = HttpContext.Current.Session["UpdateMessage"];//"The row is inserted successfully";
            }
        }

        protected void GridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            if (e.Parameters == "delete")
            {
                List<long> selectedIds = GridView.GetSelectedFieldValues("Id").ConvertAll(id => (long)id);
                DataProvider.DeleteIssues(selectedIds);
                GridView.DataBind();
            }
        }
    }
}