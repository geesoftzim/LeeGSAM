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
using LastTrialGene.Code;

namespace LastTrialGene.Controls
{
    public partial class ClientsCreation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          /*  if (!IsPostBack)
                GridView.StartEdit(0);
            */

            if (HttpContext.Current.Session["UpdateMessage"] != null)
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
        //1
        protected void GridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["Kind"] = 1;
          //  e.NewValues["PhysicalCountry"] = 1;
            
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
        //3

        string lastValidCountry = "";
        protected void grid_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            /** foreach (GridViewColumn column in grid.Columns)
              {
                  GridViewDataColumn dataColumn = column as GridViewDataColumn;
                  if (dataColumn == null) continue;
                  if (e.NewValues[dataColumn.FieldName] == null)
                  {
                      e.Errors[dataColumn] = "Value can't be null.";
                  }
              }*/
              lastValidCountry = e.NewValues["PhysicalCountry"].ToString();

            if (e.NewValues["Name2"] == null)
                AddError(e.Errors, GridView.Columns["Name2"], "Name Can Not be Null");

            if (e.NewValues["PhoneNo"] == null)
                AddError(e.Errors, GridView.Columns["PhoneNo"], "PhoneNo Can Not be Null");
            if (e.NewValues["EmailAddress"] == null)
                AddError(e.Errors, GridView.Columns["EmailAddress"], "EmailAddress Can Not be Null");
            if (e.NewValues["IdentificationNo"] == null)
                AddError(e.Errors, GridView.Columns["IdentificationNo"], "IdentificationNo Can Not be Null");
            if (e.NewValues["PhysicalAddress"] == null)
                AddError(e.Errors, GridView.Columns["PhysicalAddress"], "Physical Address Can Not be Null");


            if (e.NewValues["Name"] == null && e.NewValues["IdentificationNo"] == null && e.NewValues["Name3"] == null)
            {
                AddError(e.Errors, GridView.Columns["Name"], "Name Can Not be Null");
                AddError(e.Errors, GridView.Columns["IdentificationNo"], "Name Can Not be Null");
                AddError(e.Errors, GridView.Columns["Name3"], "Name Can Not be Null");
            }

        }

        void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
        {
            if (errors.ContainsKey(column)) return;
            errors[column] = errorText;
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

        protected void ASPxCheckBox1_Init(object sender, EventArgs e)
        {
            ASPxCheckBox cb = sender as ASPxCheckBox;
            GridViewDataItemTemplateContainer container = cb.NamingContainer as GridViewDataItemTemplateContainer;
            cb.ClientSideEvents.CheckedChanged = string.Format("function(s, e){{ gridView.StartEditRow({0});}}", container.VisibleIndex);
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
        bool hasValidationErrors = false;




        //////////////Selected index change trials begin here///////////////////////////////////
        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "PhysicalCity")
            {
                var combo = (ASPxComboBox)e.Editor;
                combo.Callback += new CallbackEventHandlerBase(combo_Callback);

                var grid = e.Column.Grid;
                if (!combo.IsCallback)
                {
                    var countryID = -1;
                    if (!grid.IsNewRowEditing)
                        countryID = (int)grid.GetRowValues(e.VisibleIndex, "PhysicalCountry");
                    FillCitiesComboBox(combo, countryID);
                }
            }

            if (e.Column.FieldName == "PostalCity")
            {
                var combo = (ASPxComboBox)e.Editor;
                combo.Callback += new CallbackEventHandlerBase(combo_Callback);

                var grid = e.Column.Grid;
                if (!combo.IsCallback)
                {
                    var countryID = -1;
                    if (!grid.IsNewRowEditing)
                        countryID = (int)grid.GetRowValues(e.VisibleIndex, "PostalCountry");
                    FillCitiesComboBox(combo, countryID);
                }
            }


            if (e.Column.FieldName == "EmployerPhysicalCity")
            {
                var combo = (ASPxComboBox)e.Editor;
                combo.Callback += new CallbackEventHandlerBase(combo_Callback);

                var grid = e.Column.Grid;
                if (!combo.IsCallback)
                {
                    var countryID = -1;
                    if (!grid.IsNewRowEditing)
                        countryID = (int)grid.GetRowValues(e.VisibleIndex, "EmployerPhysicalCountry");
                    FillCitiesComboBox(combo, countryID);
                }
            }





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
            CitySource.SelectParameters["PhysicalCountry"].DefaultValue = countryID.ToString();
            combo.DataBindItems();

            combo.Items.Insert(0, new ListEditItem("", null)); // Null Item
        }
        //////////////////////////Selected index change trials End here///////////////////////////
        ///

        protected void Grid_Init(object sender, EventArgs e)
        {
            // Creates a column, customizes its settings, and appends it to the Columns collection.
            GridViewDataTextColumn colTotal = new GridViewDataTextColumn();
            colTotal.FieldName = "Total";
            colTotal.UnboundType = DevExpress.Data.UnboundColumnType.Decimal;
            colTotal.VisibleIndex = GridView.VisibleColumns.Count;
            colTotal.PropertiesTextEdit.DisplayFormatString = "c2";
            GridView.Columns.Add(colTotal);

            /**/////////////////FOR dates Begins/////////////////////////////////////////*/
            GridViewDataDateColumn InceptionDate1 = new GridViewDataDateColumn();
            InceptionDate1.FieldName = "InceptionDate1";
            InceptionDate1.UnboundType = DevExpress.Data.UnboundColumnType.DateTime;
            InceptionDate1.VisibleIndex = GridView.VisibleColumns.Count;
           // InceptionDate1.PropertiesTextEdit.DisplayFormatString = "c2";
            GridView.Columns.Add(InceptionDate1);



            GridViewDataDateColumn DateOfBirth1 = new GridViewDataDateColumn();
            DateOfBirth1.FieldName = "DateOfBirth1";
            DateOfBirth1.UnboundType = DevExpress.Data.UnboundColumnType.DateTime;
            DateOfBirth1.VisibleIndex = GridView.VisibleColumns.Count;
           // DateOfBirth.PropertiesTextEdit.DisplayFormatString = "c2";
            GridView.Columns.Add(DateOfBirth1);

            /*/////////////////////////FOR dates Ends//////////////////////////////*/


        }
        // Populates the unbound column.
        protected void Grid_CustomUnboundColumnData(object sender,
            ASPxGridViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "Total")
            {
                // decimal unitPrice = Convert.ToDecimal(e.GetListSourceFieldValue("UnitPrice"));
                // int quantity = Convert.ToInt32(e.GetListSourceFieldValue("Quantity"));
                // decimal discount = Convert.ToDecimal(e.GetListSourceFieldValue("Discount"));
                e.Value = 44;// unitPrice * quantity * (1 - discount);
            }
        }



    }
}