using Azure;
using DevExpress.Web;
using DevExpress.Web.Data;
using DevExpress.XtraExport.Helpers;
using LastTrialGene.Model;
using LastTrialGene.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static LastTrialGene.Models.ParamsClientForm;
using static LastTrialGene.Models.Sample;
using System.Net.NetworkInformation;

namespace LastTrialGene
{
    public partial class CounterPartyContacts : System.Web.UI.Page
    {
        int clientGroup;
        static SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
           /** Dbconnection.dbconnection();
            DataTable dt = new DataTable();
            con = new SqlConnection(Dbconnection.dbconnection());
            SqlDataAdapter adapt = new SqlDataAdapter("select * from tblCounterparty where id=" +HttpContext.Current.Session["SelectedClientID"].ToString(), con);
            con.Open();
            adapt.Fill(dt);
            con.Close();
            grid.DataSource = dt;
            grid.DataBind();*/
          //  aSPxGridViewTemplateReplacement.Visible=false;
          //  ShowData();

           /** if (HttpContext.Current.Session["CustodialGroup"]!=null) {
                int v = int.Parse(HttpContext.Current.Session["CustodialGroup"].ToString());
               
            }*/

        }

        public  void ShowData()
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


        protected void Page_Load2(object sender, EventArgs e)
        {
            //GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);

        /*    if (!IsPostBack)
            {
                grid.StartEdit(2);
            }
            grid.SettingsEditing.Mode = chkPopup.Checked
                ? GridViewEditingMode.PopupEditForm
                : GridViewEditingMode.EditFormAndDisplayRow;*/

           // chkPopup.Theme = DemoHelper.Instance.Theme;
        }

        protected void GridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
         //   e.NewValues["Kind"] = 1;
            /** e.NewValues["Priority"] = 2;
             e.NewValues["Status"] = 1;
             e.NewValues["IsDraft"] = true;
             e.NewValues["IsArchived"] = false;*/
            //WriteLogFile(e.NewValues["AccountName"].ToString());
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

        protected void grid_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {

     


      


        }
        protected void GridView_RowUpdated(object sender, ASPxDataUpdatedEventArgs e)
        {
            //

            if (e.Exception == null)
            {
                ((ASPxGridView)sender).JSProperties["cpUpdatedMessage"] = HttpContext.Current.Session["UpdateMessage"];// "Your update has been saved successfully";
            }
        }

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

            
            if (e.NewValues["Name"] == null)
                AddError(e.Errors, GridView.Columns["Name"], "Name Can Not be Null");
            if (e.NewValues["IdentificationNo"] == null)
                AddError(e.Errors, GridView.Columns["IdentificationNo"], "IdentificationNo Can Not be Null");
            if (e.NewValues["PhoneNo"] == null)
                AddError(e.Errors, GridView.Columns["PhoneNo"], "PhoneNo Can Not be Null");
            if (e.NewValues["PhysicalAddress"] == null)
                AddError(e.Errors, GridView.Columns["PhysicalAddress"], "PhysicalAddress Can Not be Null");
            if (e.NewValues["OwnershipPercent"] == null)
                AddError(e.Errors, GridView.Columns["OwnershipPercent"], "OwnershipPercent Can Not be Null");



        }

        void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
        {
            if (errors.ContainsKey(column)) return;
            errors[column] = errorText;
        }
        protected void grid_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
           


        }

        protected void ASPxGridView1_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                ((ASPxGridView)sender).JSProperties["cpInsertNote"] = HttpContext.Current.Session["UpdateMessage"];//"The row is inserted successfully";
            }
        }
        protected string GetMemoText()
        {
            ASPxPageControl pageControl = GridView.FindEditFormTemplateControl("pageControl") as ASPxPageControl;
            ASPxMemo memo = pageControl.FindControl("txtPhoneNo") as ASPxMemo;
            return memo.Text;
        }


        protected void cboCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            ///cboCity.DataSource = Array.FindAll(cp.data.City, ct => ct.CountryID == (int)cboCountry.Value).ToArray();
            //cboCity.DataBind();
            //cboCity.SelectedIndex = 0;
        }

        protected void cboPostCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
           // cboPostCity.DataSource = Array.FindAll(cp.data.City, ct => ct.CountryID == (int)cboPostCountry.Value).ToArray();
           // cboPostCity.DataBind();
           // cboPostCity.SelectedIndex = 0;
        }

        protected void cboCustodialGroup_SelectedIndexChanged(object sender, EventArgs e) {
           // cboCustodialGroup.SelectedIndex = 0;
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

        protected void grid_CellEditorInitialize(object sender, DevExpress.Web.ASPxGridViewEditorEventArgs e)
        {
            ASPxGridView gridView = sender as ASPxGridView;
            if (e.Column.FieldName == "FireDate")
            {
                ASPxDateEdit fireDateEditor = e.Editor as ASPxDateEdit;
                fireDateEditor.ClientEnabled = !GridView.IsNewRowEditing;
                fireDateEditor.ClearButton.DisplayMode = ClearButtonDisplayMode.OnHover;
                fireDateEditor.ClientSideEvents.ValueChanged = "onDismissalDateChanged";
            }



        }

    }
}