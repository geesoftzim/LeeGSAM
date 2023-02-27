using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LastTrialGene
{
    public partial class Search : System.Web.UI.Page
    {
        string returnPage;

        protected void Page_Load(object sender, EventArgs e)
        {
            returnPage = Request["ReturnURL"];
            if (!Page.IsPostBack)
            {
                // Create your ControlParameter
                ControlParameter searchString = new ControlParameter();
                searchString.ControlID = txtSearch.UniqueID;
                searchString.PropertyName = "Text";
                searchString.Name = "searchString";
                searchString.Type = TypeCode.String;
                // Add it to your SelectParameters collection
                dsSearch.SelectParameters.Add(searchString);

            }
            else
            {
                string parameter = Request["__EVENTARGUMENT"];
                if (parameter == "RowSelected")
                {
                    SelectRow();
                }
            }
        }

        protected void grdSearch_FillContextMenuItems(object sender, DevExpress.Web.ASPxGridViewContextMenuEventArgs e)
        {
            if (e.MenuType == GridViewContextMenuType.Rows)
            {
                GridViewContextMenuItem mnu = new GridViewContextMenuItem("Select", "mnuSelectRow");
                mnu.Image.IconID = "find_find_16x16";
                e.Items.Insert(0, mnu);
            }
        }

        protected void grdSearch_ContextMenuItemClick(object sender, ASPxGridViewContextMenuItemClickEventArgs e)
        {
            if (e.Item.Name == "mnuSelectRow")
            {
                SelectRow();
            }
        }

        protected void txtSearch_ButtonClick(object source, ButtonEditClickEventArgs e)
        {
            DoSearch();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            DoSearch();
        }

        public void DoSearch()
        {
            grdSearch.DataBind();
        }

        public void SelectRow()
        {

            Session["SelectedClientID"] = grdSearch.GetSelectedFieldValues("ID")[0];
            Session["SelectedClientName"] = grdSearch.GetSelectedFieldValues("Name")[0];
            Session["SelectedCounterType"] = grdSearch.GetSelectedFieldValues("CounterpartyType")[0];
            int countertype = int.Parse(Session["SelectedCounterType"].ToString());
            Response.Redirect("~/index.aspx");
            /** if (countertype == 1)
             {
                 Response.Redirect("~/ClientsCreation2.aspx");
             }
             else if(countertype == 0) {
                 Response.Redirect("~/ClientsCreation.aspx");
             }*/

        }
    }
}