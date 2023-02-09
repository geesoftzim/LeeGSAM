using System.Collections.Generic;
using LastTrialGene.Model;
using DevExpress.Web;
using System.Windows.Forms;
using System;
using System.Web;

namespace LastTrialGene {
    public partial class GridViewModule : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["logger"] != null)
            {
                Response.Redirect("~/Index.aspx");
            }
            else
            {
                Response.Redirect("~/Account/SignIn.aspx");
            }
        }
 
            
protected void GridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e) {
            e.NewValues["Kind"] = 1;
            e.NewValues["Priority"] = 2;
            e.NewValues["Status"] = 1;
            e.NewValues["IsDraft"] = true;
            e.NewValues["IsArchived"] = false;
        }

        protected void GridView_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e) {
            if (e.Parameters == "delete")
            {
                List<long> selectedIds = GridView.GetSelectedFieldValues("Id").ConvertAll(id => (long)id);
                DataProvider.DeleteIssues(selectedIds);
                GridView.DataBind();
            }
        }
    }
}