using DevExpress.Web;
using LastTrialGene.Model;
using System;
using System.Collections.Generic;
using System.Linq;
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

        protected void GridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            /*  e.NewValues["Kind"] = 1;
              e.NewValues["Priority"] = 2;
              e.NewValues["Status"] = 1;
              e.NewValues["IsDraft"] = true;
              e.NewValues["IsArchived"] = false;*/
       
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