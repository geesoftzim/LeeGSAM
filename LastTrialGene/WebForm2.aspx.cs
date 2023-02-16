using LastTrialGene.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LastTrialGene
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            String currurl = "http://localhost:54301/" + HttpContext.Current.Request.RawUrl;
            String currurl1 = HttpContext.Current.Request.RawUrl;
            Uri myUri = new Uri(currurl);
            string param1 = HttpUtility.ParseQueryString(myUri.Query).Get("param1");
            string param2 = HttpUtility.ParseQueryString(myUri.Query).Get("param2");
            //Response.Write("<script>alert('" + EncryptionHelper.Decrypt(param1) + "');window.location = 'CounterpartyCreate.aspx';</script>");
            Response.Write("<script>alert('" + EncryptionHelper.Decrypt(param1) + "');window.location = '" + EncryptionHelper.Decrypt(param2) + "';</script>");
        }
    }
}