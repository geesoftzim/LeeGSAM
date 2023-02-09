using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LastTrialGene
{
    public partial class CounterClients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HideShowClientCreateFields();
        }

        private void HideShowClientCreateFields()
        {
            if ((string)rdoClientType.SelectedItem.Value == "NewIndividualClient")
            {
                HttpContext.Current.Session["ClientTypeSec"] = 0;
                ClientsCreation.Visible = true;
                ClientsCreation2.Visible = false;
            }

            else
            {
                HttpContext.Current.Session["ClientTypeSec"] = 1;
                ClientsCreation.Visible = false;
                ClientsCreation2.Visible = true;
            }
        }
    }
}