using DevExpress.Web;
using DevExpress.Web.Data;
using LastTrialGene.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LastTrialGene
{
    public partial class ClientsCreation2 : System.Web.UI.Page
    {
        int clientGroup;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["CustodialGroup"]!=null) {
                int v = int.Parse(HttpContext.Current.Session["CustodialGroup"].ToString());
               
            }
           
            //  cboCustodialGroup.SelectedIndex = '<%# Eval("CustodialGroup")%>';
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

        protected void grid_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {
            //String b = e.NewValues["ID"].ToString();//= GetMemoText();
                                                    // String c = txtPhoneNo.Text;
            /*  String d = e.NewValues["AccountNo"].ToString();
              String r = e.NewValues["AccountTypeName"].ToString();*/

            //   String r = e.NewValues["PhoneNo"].ToString();
            // String r2 = e.NewValues["PhoneNo2"].ToString();

           // e.NewValues["notesEditor"] = GetMemoText();
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("pageControl") as ASPxPageControl;
            ASPxTextBox phone = pageControl.FindControl("txtPhoneNo") as ASPxTextBox;
            ASPxTextBox phone2 = pageControl.FindControl("txtPhoneNo2") as ASPxTextBox;
            ASPxTextBox email = pageControl.FindControl("txtEmailAddress") as ASPxTextBox;
            string email1 = email.Text;

            ASPxComboBox risk = pageControl.FindControl("cboRiskRating") as ASPxComboBox;
            ASPxComboBox cust = pageControl.FindControl("cboCustodialGroup") as ASPxComboBox;
            int v = int.Parse(risk.Value.ToString());
            int c = int.Parse(cust.Value.ToString()); ;



        }
        protected void grid_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            e.NewValues["ID"] = GetMemoText();
        }
        protected string GetMemoText()
        {
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("pageControl") as ASPxPageControl;
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

    }
}