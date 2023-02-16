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
    public partial class Clients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grid_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {

               

            if (e.NewValues["EmployerName"] == null)
                AddError(e.Errors, GridView.Columns["EmployerName"], "Name Can Not be Null");

            if (e.NewValues["PhoneNo"] == null)
                AddError(e.Errors, GridView.Columns["PhoneNo"], "Phone Can Not be Null");


            if (e.NewValues["EmailAddress"] == null)
                AddError(e.Errors, GridView.Columns["EmailAddress"], "EmailAddress Can Not be Null");



        }

        void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
        {
            if (errors.ContainsKey(column)) return;
            errors[column] = errorText;
        }

        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "City")
            {
                var combo = (ASPxComboBox)e.Editor;
                combo.Callback += new CallbackEventHandlerBase(combo_Callback);

                var grid = e.Column.Grid;
                if (!combo.IsCallback)
                {
                    var countryID = -1;
                    if (!grid.IsNewRowEditing)
                        countryID = (int)grid.GetRowValues(e.VisibleIndex, "Country");
                    FillCitiesComboBox(combo, countryID);
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

        private void combo_Callback(object sender, CallbackEventArgsBase e)
        {
            var countryID = -1;
            Int32.TryParse(e.Parameter, out countryID);
            FillCitiesComboBox(sender as ASPxComboBox, countryID);

        }

        protected void FillCitiesComboBox(ASPxComboBox combo, int countryID)
        {
            combo.DataSourceID = "CitySource";
            CitySource.SelectParameters["country"].DefaultValue = countryID.ToString();
            combo.DataBindItems();
            combo.Items.Insert(0, new ListEditItem("", null)); // Null Item
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