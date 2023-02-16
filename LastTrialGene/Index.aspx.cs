using DevExpress.Web;
using LastTrialGene.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static LastTrialGene.Models.ClientDetailsMDL;

namespace LastTrialGene
{
    public partial class Index : System.Web.UI.Page
    {
        int clientID = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            /** if (Session["ConnectionString"] == null)
             {
                 Response.Redirect("~/Account/SignIn.aspx?ReturnURL=" + System.IO.Path.GetFileName(Request.Url.AbsolutePath));
             }*/
            if (HttpContext.Current.Session["SelectedClientID"] != null) {
                try
                {
                    string parameter = (Session["SelectedClientID"] ?? "-1").ToString();
                    if ((parameter ?? "") != "")
                        clientID = Int32.Parse(parameter);


                    ClientDetailsPost clientDetailsPost = new ClientDetailsPost();
                    {
                        clientDetailsPost.server = ".\\SQLEXPRESS";
                        clientDetailsPost.database = "GSAM_WEB";
                        clientDetailsPost.user = "sa";
                        clientDetailsPost.password = "Leroy1994";
                        clientDetailsPost.ID = clientID;
                    }

                    var webClient = new WebClient();
                    {
                        var url = "http://localhost:93/gsam/api/client/view";

                        webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                        webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                        string data = JsonConvert.SerializeObject(clientDetailsPost);
                        var response = webClient.UploadString(url, data);
                        var result = JsonConvert.DeserializeObject<ClientDetailsReturn>(response);

                        //return result.data;

                        if (result.data != null)
                        {
                            lblLongName.Text = result.data.LongName.ToString();
                            lblEmail.Text = result.data.EmailAddress.ToString();
                            lblPhoneNumber.Text = result.data.PhoneNo.ToString();
                            lblClientNo.Text = result.data.ClientNo.ToString();
                            lblIdentificationNo.Text = result.data.IdentificationNo.ToString();
                            lblPostalAddress.Text = (result.data.PostalAddress ?? "").ToString() + ", " + (result.data.PostalAddress2 ?? "").ToString() + ", " + (result.data.PostalCityName ?? "").ToString() + ", " + (result.data.PostalCountryName ?? "").ToString();
                            lblNationality.Text = (result.data.NationalityName ?? "").ToString();
                            lblDateOfBirth.Text = result.data.DateOfBirth.ToString();
                            if (result.data.Active == 1)
                            {
                                chkActiveDetails.Checked = true;
                            }
                            else
                            {
                                chkActiveDetails.Checked = false;
                            }

                            Session["LongName"] = result.data.LongName;

                        }
                        else
                        {
                            //string LongName = result.data.LongName.ToString();
                        }
                        //return result.data;
                    }
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }
           

            //TableOfContentsTreeView.DataBind();
            //TableOfContentsTreeView.ExpandAll();
        }

        protected void grdAccounts_ContextMenuInitialize(object sender, DevExpress.Web.ASPxGridViewContextMenuInitializeEventArgs e)
        {
            e.ContextMenu.Items.Clear();
            //e.ContextMenu.Items.FindByCommand(GridViewContextMenuCommand.EditRow).Visible = false;
            e.ContextMenu.Items.Add("Create Auto", "AutoCreateAccounts");
            e.ContextMenu.Items.Add("New Account", "NewAccount");
            e.ContextMenu.Items.Add("Edit Account", "EditAccount");
            e.ContextMenu.Items.Add("Activate Account", "ActivateAccount");
            e.ContextMenu.Items.Add("Deavtivate Account", "DeactivateAccount");
            e.ContextMenu.Items.Add("Block Account", "ActivateAccount");
            e.ContextMenu.Items.Add("Un-block Account", "UnblockAccount");
            e.ContextMenu.Items.Add("Delete Account", "DeleteAccount");
        }

        protected void grdAccounts_ContextMenuItemClick(object sender, ASPxGridViewContextMenuItemClickEventArgs e)
        {
            //switch (e.Item.Name)
            //{
            //    case "NewAccount":
            //        ShowAccountCreate();
            //        break;
            //    case "EditAccount":
            //        ShowEditCreate();
            //        break;
            //}
        }

        protected void btnToTradingAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("CounterpartyRiskAndAccounts.aspx");
        }
        protected void btnToAddBank_Click(object sender, EventArgs e)
        {
            Response.Redirect("CounterpartyBankDetailsCreate.aspx");
        }


        protected void btnToAddContacts_Click(object sender, EventArgs e)
        {
            Response.Redirect("CounterpartyContacts.aspx");
        }





        protected void grdContactsList_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["ClientID"] = clientID;//((ASPxGridView)sender).GetRowValuesByKeyValue(e.Keys[0], new string[] { "ClientID" });
        }

        protected void grdContactsList_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["ClientID"] = clientID;//((ASPxGridView)sender).GetRowValuesByKeyValue(e.Keys[0], new string[] { "ClientID" });
        }
    }
}