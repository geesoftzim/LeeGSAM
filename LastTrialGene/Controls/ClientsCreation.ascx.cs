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
using System.Configuration;
using DevExpress.Utils;
using Newtonsoft.Json.Linq;
using System.IdentityModel.Metadata;

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
            
          /*  e.NewValues["PhysicalCountry"] = 1;
            e.NewValues["PostalCountry"] = 1;
            e.NewValues["EmployerPhysicalCountry"] = 1;

            e.NewValues["PhysicalCity"] = 30;
            e.NewValues["PostalCity"] = int.Parse("30");
            e.NewValues["EmployerPhysicalCity"] = 30;*/

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


        protected void edit_CalendarCustomDisabledDate(object sender, CalendarCustomDisabledDateEventArgs e)
        {
            string curDate = e.Date.ToShortDateString();
            string today = DateTime.Now.ToShortDateString();
            string yesterday = DateTime.Now.AddDays(-1).ToShortDateString();

            string future = "";//DateTime.Now.AddDays(-1).ToShortDateString();
                               // if (curDate != today && curDate != yesterday)
                               //     e.IsDisabled = true;
            if (DateTime.Now<= e.Date)
                e.IsDisabled = true;



            
        }

        //////////////Selected index change trials begin here///////////////////////////////////
        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            if (e.Column.FieldName == "InceptionDate")
            {
                ASPxDateEdit edit = e.Editor as ASPxDateEdit;
                edit.CalendarCustomDisabledDate += edit_CalendarCustomDisabledDate;
            }

            if (e.Column.FieldName == "DateOfBirth")
            {
                ASPxDateEdit edit = e.Editor as ASPxDateEdit;
                edit.CalendarCustomDisabledDate += edit_CalendarCustomDisabledDate;
            }

            if (e.Column.FieldName == "HasUSGreenCard")
            {
               // e.Editor.Visible = false;
            }


            var grid1 = e.Column.Grid;

           // var x =   (int)grid1.GetRowValues(e.VisibleIndex, "DualCit");

            var chk = new ASPxCheckBox();

            if (e.Column.FieldName == "DualCit")
            {
                e.Editor.ClientEnabled = true;
            }


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
                    FillCitiesComboBoxEmp(combo, countryID);

                }
            }


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

        private void combo_CallbackEmp(object sender, CallbackEventArgsBase e)
        {
            var countryID = -1;
            Int32.TryParse(e.Parameter, out countryID);
            FillCitiesComboBoxEmp(sender as ASPxComboBox, countryID);

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

        protected void FillCitiesComboBoxEmp(ASPxComboBox combo, int countryID)
        {
            combo.DataSourceID = "CitySourceEmp";
            CitySourceEmp.SelectParameters["EmployerPhysicalCountry"].DefaultValue = countryID.ToString();
            combo.DataBindItems();

            combo.Items.Insert(0, new ListEditItem("", null)); // Null Item
        }

   
        //////////////////////////Selected index change trials End here///////////////////////////
        ///
        static GridViewDataCheckColumn DualCit;
        static int chek = 0;
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



            GridViewDataComboBoxColumn WithdrawFrequency = new GridViewDataComboBoxColumn(); 
            WithdrawFrequency.FieldName = "WithdrawFrequency";
            WithdrawFrequency.UnboundType = DevExpress.Data.UnboundColumnType.String;
            WithdrawFrequency.VisibleIndex = GridView.VisibleColumns.Count;
            WithdrawFrequency.Visible = false;
            WithdrawFrequency.PropertiesComboBox.Items.Add("high");
            WithdrawFrequency.PropertiesComboBox.Items.Add("low");
            WithdrawFrequency.PropertiesComboBox.Items.Add("medium");
            GridView.Columns.Add(WithdrawFrequency);

            GridViewDataTextColumn contactEmail2 = new GridViewDataTextColumn();
            contactEmail2.FieldName = "contactEmail2";
            contactEmail2.UnboundType = DevExpress.Data.UnboundColumnType.String;
            contactEmail2.VisibleIndex = GridView.VisibleColumns.Count;
            contactEmail2.Visible = false;
            GridView.Columns.Add(contactEmail2);

           /* GridViewDataTextColumn contactEmail3 = new GridViewDataTextColumn();
            contactEmail3.FieldName = "contactEmail3";
            contactEmail3.UnboundType = DevExpress.Data.UnboundColumnType.String;
            contactEmail3.VisibleIndex = GridView.VisibleColumns.Count;
            contactEmail3.Visible = false;
            GridView.Columns.Add(contactEmail3);


            GridViewDataTextColumn contactEmail4 = new GridViewDataTextColumn();
            contactEmail4.FieldName = "contactEmail4";
            contactEmail4.UnboundType = DevExpress.Data.UnboundColumnType.String;
            contactEmail4.VisibleIndex = GridView.VisibleColumns.Count;
            contactEmail4.Visible = false;
            GridView.Columns.Add(contactEmail4);*/

            GridViewDataTextColumn TMONAcc = new GridViewDataTextColumn();
            TMONAcc.FieldName = "TMONAcc";
            TMONAcc.UnboundType = DevExpress.Data.UnboundColumnType.String;
            TMONAcc.VisibleIndex = GridView.VisibleColumns.Count;
            TMONAcc.Visible = false;
            GridView.Columns.Add(TMONAcc);
            ///////////////////////////////////////////////////////////////////////
            ///
            DualCit = new GridViewDataCheckColumn();
            DualCit.FieldName = "DualCit";
            DualCit.UnboundType = DevExpress.Data.UnboundColumnType.Integer;
            DualCit.VisibleIndex = GridView.VisibleColumns.Count;      
            DualCit.PropertiesCheckEdit.EnableClientSideAPI = true;
            DualCit.PropertiesCheckEdit.ValueChecked = 1;
            DualCit.PropertiesCheckEdit.ValueUnchecked = 0;
            DualCit.Visible = false;
           // DualCit.PropertiesCheckEdit.ClientSideEvents.CheckedChanged = "function (s,e) { alert('Checkbox is now ' + s.GetCheckState()); }";
            DualCit.PropertiesCheckEdit.ClientSideEvents.CheckedChanged = "function (s,e) {if( s.GetCheckState()=='Checked'){gridView.GetMainElement().getElementsByClassName('citizen2')[0].style.visibility ='visible';}if( s.GetCheckState()=='Unchecked'){gridView.GetMainElement().getElementsByClassName('citizen2')[0].style.visibility ='hidden';} }";
            GridView.Columns.Add(DualCit);




            GridViewDataCheckColumn VAT = new GridViewDataCheckColumn();
            VAT.FieldName = "VAT";
            VAT.UnboundType = DevExpress.Data.UnboundColumnType.Integer;
            VAT.VisibleIndex = GridView.VisibleColumns.Count;
            VAT.PropertiesCheckEdit.EnableClientSideAPI = true;
            VAT.PropertiesCheckEdit.ValueChecked = 1;
            VAT.PropertiesCheckEdit.ValueUnchecked = 0;
            VAT.Visible = false;
            GridView.Columns.Add(VAT);





            GridViewDataCheckColumn AutoGene = new GridViewDataCheckColumn();
            AutoGene.FieldName = "AutoGene";
            AutoGene.UnboundType = DevExpress.Data.UnboundColumnType.Integer;
            AutoGene.VisibleIndex = GridView.VisibleColumns.Count;
            AutoGene.PropertiesCheckEdit.EnableClientSideAPI = true;
            AutoGene.PropertiesCheckEdit.ValueChecked = 1;
            AutoGene.PropertiesCheckEdit.ValueUnchecked = 0;
            AutoGene.Visible = false;
            // DualCit.PropertiesCheckEdit.ClientSideEvents.CheckedChanged = "function (s,e) { alert('Checkbox is now ' + s.GetCheckState()); }";
            AutoGene.PropertiesCheckEdit.ClientSideEvents.CheckedChanged = "function (s,e) {if( s.GetCheckState()=='Checked'){gridView.GetMainElement().getElementsByClassName('flContainer')[0].style.visibility ='hidden';}if( s.GetCheckState()=='Unchecked'){gridView.GetMainElement().getElementsByClassName('flContainer')[0].style.visibility ='visible';} }";

            GridView.Columns.Add(AutoGene);

            //////////////////////////////////////////////////////////////////////////
            ///

            /**GridViewDataCheckColumn IsUSResident = new GridViewDataCheckColumn();
            IsUSResident.FieldName = "IsUSResident";
            IsUSResident.UnboundType = DevExpress.Data.UnboundColumnType.Integer;
            IsUSResident.VisibleIndex = GridView.VisibleColumns.Count;
            IsUSResident.PropertiesCheckEdit.EnableClientSideAPI = true;
            IsUSResident.PropertiesCheckEdit.ValueChecked = true;
            IsUSResident.PropertiesCheckEdit.ValueUnchecked = false;
            IsUSResident.Visible = false;
            // DualCit.PropertiesCheckEdit.ClientSideEvents.CheckedChanged = "function (s,e) { alert('Checkbox is now ' + s.GetCheckState()); }";
            IsUSResident.PropertiesCheckEdit.ClientSideEvents.CheckedChanged = "function (s,e) {if( s.GetCheckState()=='Checked'){console.log('unhide it fired');gridView.GetMainElement().getElementsByClassName('HasUSGreenCard')[0].style.visibility ='visible';}if( s.GetCheckState()=='Unchecked'){console.log('hide it fired');gridView.GetMainElement().getElementsByClassName('HasUSGreenCard')[0].style.visibility ='hidden';} }";
            GridView.Columns.Add(IsUSResident);*/






            /**/////////////////FOR dates Begins/////////////////////////////////////////*/
           /* GridViewDataDateColumn InceptionDate1 = new GridViewDataDateColumn();
            InceptionDate1.FieldName = "InceptionDate1";
            InceptionDate1.UnboundType = DevExpress.Data.UnboundColumnType.DateTime;
            InceptionDate1.VisibleIndex = GridView.VisibleColumns.Count;
            GridView.Columns.Add(InceptionDate1);



            GridViewDataDateColumn DateOfBirth1 = new GridViewDataDateColumn();
            DateOfBirth1.FieldName = "DateOfBirth1";
            DateOfBirth1.UnboundType = DevExpress.Data.UnboundColumnType.DateTime;
            DateOfBirth1.VisibleIndex = GridView.VisibleColumns.Count;
            GridView.Columns.Add(DateOfBirth1);*/

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


        /**protected void gv_BeforeGetCallbackResult(object sender, EventArgs e)
        {
            HideEditor(sender as ASPxGridView);
        }

        private void HideEditor(ASPxGridView gv)
        {
            int values = 0;
            if (gv.IsNewRowEditing)
                gv.DataColumns["HasUSGreenCard"].EditFormSettings.Visible = values == 0 ? DefaultBoolean.False : DefaultBoolean.True;
        }*/



    }
}