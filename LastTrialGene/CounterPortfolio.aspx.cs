using DevExpress.Web;
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
    public partial class CounterPortfolio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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

        protected void GridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
              e.NewValues["Kind"] = 1;
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

            if (HttpContext.Current.Session["message"] != null) {

                lblerror.Text = HttpContext.Current.Session["message"].ToString();
            }



        }
    }
}