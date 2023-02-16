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
                    //FillCitiesComboBoxPost(combo, countryID);
                    FillCitiesComboBoxPost(combo, countryID);
                }
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


        private void combo_Callback(object sender, CallbackEventArgsBase e)
        {
            var countryID = -1;
            Int32.TryParse(e.Parameter, out countryID);
            FillCitiesComboBox(sender as ASPxComboBox, countryID);
            // FillCitiesComboBoxEmp(sender as ASPxComboBox, countryID);
            //FillCitiesComboBoxPost(sender as ASPxComboBox, countryID);
        }

        private void combo_CallbackPost(object sender, CallbackEventArgsBase e)
        {
            var countryID = -1;
            Int32.TryParse(e.Parameter, out countryID);
            FillCitiesComboBoxPost(sender as ASPxComboBox, countryID);
        }

        protected void FillCitiesComboBox(ASPxComboBox combo, int countryID)
        {
            combo.DataSourceID = "CitySource";
            CitySource.SelectParameters["PhysicalCountry"].DefaultValue = countryID.ToString();
            combo.DataBindItems();
            combo.Items.Insert(0, new ListEditItem("", null)); // Null Item
        }
        protected void FillCitiesComboBoxPost(ASPxComboBox combo, int countryID)
        {
            combo.DataSourceID = "CitySourcePost";
            CitySourcePost.SelectParameters["PostalCountry"].DefaultValue = countryID.ToString();
            combo.DataBindItems();

            combo.Items.Insert(0, new ListEditItem("", null)); // Null Item
        }

        protected void Grid_Init(object sender, EventArgs e)
        {
            GridViewDataComboBoxColumn RelationShipManager = new GridViewDataComboBoxColumn();
            RelationShipManager.FieldName = "RelationShipManager";
            RelationShipManager.UnboundType = DevExpress.Data.UnboundColumnType.String;
            RelationShipManager.VisibleIndex = GridView.VisibleColumns.Count;
            RelationShipManager.Visible = false;
            RelationShipManager.PropertiesComboBox.Items.Add("Masaiti");
            RelationShipManager.PropertiesComboBox.Items.Add("Tatenda");
            GridView.Columns.Add(RelationShipManager);

            GridViewDataComboBoxColumn EntityType = new GridViewDataComboBoxColumn();
            EntityType.FieldName = "EntityType";
            EntityType.UnboundType = DevExpress.Data.UnboundColumnType.String;
            EntityType.VisibleIndex = GridView.VisibleColumns.Count;
            EntityType.Visible = false;
            EntityType.PropertiesComboBox.Items.Add("Private Ltd");
            EntityType.PropertiesComboBox.Items.Add("Public Ltd");
            EntityType.PropertiesComboBox.Items.Add("Trust");
            GridView.Columns.Add(EntityType);

            GridViewDataCheckColumn AutoGene = new GridViewDataCheckColumn();
            AutoGene.FieldName = "AutoGene";
            AutoGene.UnboundType = DevExpress.Data.UnboundColumnType.Integer;
            AutoGene.VisibleIndex = GridView.VisibleColumns.Count;
            AutoGene.PropertiesCheckEdit.EnableClientSideAPI = true;
            AutoGene.PropertiesCheckEdit.ValueChecked = 1;
            AutoGene.PropertiesCheckEdit.ValueUnchecked = 0;
            AutoGene.Visible = false;
            AutoGene.PropertiesCheckEdit.ClientSideEvents.CheckedChanged = "function (s,e) {if( s.GetCheckState()=='Checked'){gridView.GetMainElement().getElementsByClassName('flContainer')[0].style.visibility ='hidden';}if( s.GetCheckState()=='Unchecked'){gridView.GetMainElement().getElementsByClassName('flContainer')[0].style.visibility ='visible';} }";

            GridView.Columns.Add(AutoGene);

            GridViewDataCheckColumn VAT = new GridViewDataCheckColumn();
            VAT.FieldName = "VAT";
            VAT.UnboundType = DevExpress.Data.UnboundColumnType.Integer;
            VAT.VisibleIndex = GridView.VisibleColumns.Count;
            VAT.PropertiesCheckEdit.EnableClientSideAPI = true;
            VAT.PropertiesCheckEdit.ValueChecked = 1;
            VAT.PropertiesCheckEdit.ValueUnchecked = 0;
            VAT.Visible = false;
            GridView.Columns.Add(VAT);

            GridViewDataTextColumn contactEmail2 = new GridViewDataTextColumn();
            contactEmail2.FieldName = "contactEmail2";
            contactEmail2.UnboundType = DevExpress.Data.UnboundColumnType.String;
            contactEmail2.VisibleIndex = GridView.VisibleColumns.Count;
            contactEmail2.Visible = false;
            GridView.Columns.Add(contactEmail2);

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