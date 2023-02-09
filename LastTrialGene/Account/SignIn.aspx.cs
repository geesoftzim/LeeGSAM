using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using DevExpress.Web;
using LastTrialGene.Model;
using LastTrialGene.Models;
using Newtonsoft.Json;

namespace LastTrialGene {
    public partial class SignInModule : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }

        public class Login
        {

            public string LoginName { get; set; }
            public string Signature { get; set; }
        }
        public class SignInResponse
        {
            public string status { get; set; }
            public string message { get; set; }

            public string data { get; set; }
        }
        protected void SignInButton_Click(object sender, EventArgs e)
        {
            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(System.Configuration.ConfigurationManager.ConnectionStrings["GlobalConnectionString"].ConnectionString);

            builder.PersistSecurityInfo = false;
            builder.UserID = UserNameTextBox.Text;
            builder.Password = PasswordButtonEdit.Text;

            SqlConnection cn = new SqlConnection(builder.ConnectionString);
            try
            {
                cn.Open();

                Session["ConnectionString"] = builder.ConnectionString;
                Session["Username"] = UserNameTextBox.Text;
                Session["Password"] = PasswordButtonEdit.Text;

                string qry = "EXEC spSQLUserRoleList;";
                SqlCommand cmd = new SqlCommand(qry, cn);
                SqlDataReader dr = cmd.ExecuteReader();

                Dictionary<String, Boolean> perm = new Dictionary<String, Boolean>();

                while (dr.Read())
                {
                    perm[dr["groupName"].ToString()] = (Boolean)dr["IsMember"];
                }

                Session["Permissions"] = perm;
                dr.Close();

                qry = "SELECT * FROM tblMMSetup";
                cmd = new SqlCommand(qry, cn);
                dr = cmd.ExecuteReader();

                Dictionary<String, String> uo = new Dictionary<String, String>();

                var columns = Enumerable.Range(0, dr.FieldCount).Select(dr.GetName).ToList();

                if (dr.Read())
                {
                    foreach (string element in columns)
                    {
                        uo[element] = dr[element].ToString();
                    }
                }

                Session["Setup"] = uo;

                //if (Request.QueryString["ReturnURL"] != null)
                //{
                //    Response.Redirect("~/" + Request.QueryString["ReturnURL"]);
                //}
                //else
                //{
                //    Response.Redirect("~/aaac.aspx");
                //}
                //===============================================
                Login login = new Login();
                {

                    // createBankDetails.ClientID = clientID;
                    login.LoginName = UserNameTextBox.Text;

                    login.Signature = PasswordButtonEdit.Text;

                }

                try
                {
                    var webClient = new WebClient();
                    {
                        //webClient.BaseAddress = "http:localhost:93/gsam";
                        var url = "http://localhost:93/gsam/api/signup/login.php";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(login);
                        var response = webClient.UploadString(url, data);
                        // var result = JsonConvert.DeserializeObject<BankDetailsMDL>(response);
                        var result = JsonConvert.DeserializeObject<SignInResponse>(response);

                        if (result.data.Equals("0"))
                        {
                            String cv1 = HttpContext.Current.Request.RawUrl;
                            String message1 = result.message;
                            Response.Redirect("../webForm2.aspx?param1=" + EncryptionHelper.Encrypt(message1) + "&param2=" + EncryptionHelper.Encrypt(cv1));
                        }
                        else
                        {
                            HttpContext.Current.Session["logger"] = "loggedIn";
                            Response.Redirect("~/GridView.aspx");
                        }



                    }
                }

                catch (Exception ex)
                {
                    throw ex;
                }

                //========================================

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}