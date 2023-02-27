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

namespace LastTrialGene
{
    public partial class ClientsCreation : System.Web.UI.Page
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

            if (HttpContext.Current.Session["CustodialGroup"]!=null) {
                int v = int.Parse(HttpContext.Current.Session["CustodialGroup"].ToString());
               
            }

            //  cboCustodialGroup.SelectedIndex = '<%# Eval("CustodialGroup")%>';
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

        protected void grid_RowUpdating(object sender, ASPxDataUpdatingEventArgs e)
        {

            /**
            //String b = e.NewValues["ID"].ToString();//= GetMemoText();
                                                    // String c = txtPhoneNo.Text;
           String d = e.NewValues["AccountNo"].ToString();
              String r = e.NewValues["AccountTypeName"].ToString();

            //  String r = e.NewValues["txtfirstName"].ToString();
             //String r2 = e.NewValues["PhoneNo2"].ToString();

           // e.NewValues["notesEditor"] = GetMemoText();
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("pageControl") as ASPxPageControl;

            
                 ASPxTextBox txtclientno = pageControl.FindControl("txtclientno") as ASPxTextBox;
            ASPxTextBox name = pageControl.FindControl("txtfirstName") as ASPxTextBox;
            ASPxTextBox name2 = pageControl.FindControl("txtMiddleName1") as ASPxTextBox;
            ASPxTextBox name3 = pageControl.FindControl("txtfirstName") as ASPxTextBox; 
            ASPxTextBox IdentificationNo = pageControl.FindControl("txtIdentificationNo") as ASPxTextBox;

            ASPxTextBox txtGovRegNo = pageControl.FindControl("txtGovRegNo") as ASPxTextBox;

            // ASPxTextBox email = pageControl.FindControl("txtIdentificationNo") as ASPxTextBox;
            ASPxTextBox phone = pageControl.FindControl("txtPhoneNo1") as ASPxTextBox;
            ASPxTextBox phone2 = pageControl.FindControl("txtPhoneNo2") as ASPxTextBox;
            ASPxTextBox email3 = pageControl.FindControl("txtEmailAddress") as ASPxTextBox;

            ASPxMemo physicalAddress = pageControl.FindControl("txtPhysicalAddressmemo") as ASPxMemo;
            ASPxMemo physicalAddress2 = pageControl.FindControl("txtPhysicalAddressmemo2") as ASPxMemo;

            ASPxMemo postaAddress = pageControl.FindControl("txtPostalAddressmemo") as ASPxMemo;
            ASPxMemo postaAddress2 = pageControl.FindControl("txtPostalAddressmemo2") as ASPxMemo;
            //  string email1 = email.Text;

            ASPxComboBox cboRiskRating = pageControl.FindControl("cboRiskRating") as ASPxComboBox;
            ASPxComboBox cust = pageControl.FindControl("cboCustodialGroup") as ASPxComboBox; 
            ASPxComboBox salutationtype = pageControl.FindControl("cboSalutation") as ASPxComboBox;
            ASPxComboBox sex = pageControl.FindControl("cboGender") as ASPxComboBox; 
            ASPxComboBox drpCountryOfResidence = pageControl.FindControl("drpCountryOfResidence") as ASPxComboBox;
            ASPxComboBox cboSourceOfIncome = pageControl.FindControl("cboSourceOfIncome") as ASPxComboBox; 
            ASPxComboBox cboBranch = pageControl.FindControl("cboBranch") as ASPxComboBox; 
            ASPxComboBox drpNationality = pageControl.FindControl("drpNationality") as ASPxComboBox; 
            ASPxComboBox cboCitizenship = pageControl.FindControl("cboCitizenship") as ASPxComboBox; 
            ASPxComboBox cboIncomeType = pageControl.FindControl("cboIncomeType") as ASPxComboBox; 
            ASPxComboBox cboSector = pageControl.FindControl("cboSector") as ASPxComboBox;

            ASPxTextBox txtZseAccountNumber = pageControl.FindControl("txtZseAccountNumber") as ASPxTextBox;
            ASPxTextBox txtVfxAccountNumber = pageControl.FindControl("txtVfxAccountNumber") as ASPxTextBox;

            int v = int.Parse(cboRiskRating.Value.ToString()); 
            int c = int.Parse(cust.Value.ToString());
            int c1 = int.Parse(salutationtype.Value.ToString());


            ClientMDL newClient = new ClientMDL();
            {
                newClient.Name = name.Text;
                newClient.Name2 = name2.Text;
                newClient.Name3 = name3.Text;
                newClient.ClientNo = txtclientno.Text;//HttpContext.Current.Session["SelectedClientID"].ToString();
                newClient.Corporate = false;
                newClient.SalutationType = int.Parse(salutationtype.Value.ToString()); 
                newClient.DateOfBirth = DateTime.Now.ToString("yyyy-MM-dd");
                newClient.IndustryType = 0;
                newClient.RegistrationOffice = "";
                newClient.VATRegistrationNo = "";
                newClient.BPNumber = "0";
                newClient.TaxStatus = true;
                newClient.WithholdingTaxStatus = true;
                newClient.ResidentShareholdersTaxStatus = true;
                newClient.IdentificationType = 0; //(@drpIdentificationType.Value == null ? 0 : (int)drpIdentificationType.Value);
                newClient.IdentificationNo = IdentificationNo.Text;
                newClient.AgentID = 0;
                newClient.CustodialID = 0;
                newClient.CounterpartyType = 0;///(@cboCounterpartyType.Value == null ? 0 : (int)cboCounterpartyType.Value);
                newClient.CustodialGroup = int.Parse(cust.Value.ToString());// (cboCustodialGroup.Value == null ? 0 : (int)cboCustodialGroup.Value);
                newClient.InceptionDate = DateTime.Now.ToString("yyyy-MM-dd");
                newClient.SpecialInstructions = physicalAddress.Text;
                newClient.BranchID = int.Parse(cboBranch.Value.ToString()); //(@cboBranch.Value == null ? 0 : (int)cboBranch.Value);
                newClient.PhysicalAddress = physicalAddress.Text;
                newClient.PhysicalAddress2 = physicalAddress2.Text; ;
                newClient.PhysicalAddress3 = "";
                newClient.PhysicalCity = 1;//(@cboCity.Value == null ? 0 : (int)cboCity.Value);
                newClient.PhysicalCountry = 1; //(cboCountry.Value == null ? 0 : (int)cboCountry.Value);
                newClient.PostalAddress = postaAddress.Text;
                newClient.PostalAddress2 = postaAddress2.Text;
                newClient.PostalAddress3 = "";
                newClient.PostalCity = 1;// (@cboPostCity.Value == null ? 0 : (int)cboPostCity.Value);
                newClient.PostalCountry = 1;// (cboPostCity.Value == null ? 0 : (int)cboPostCity.Value);
                newClient.PhoneNo = phone.Text;
                newClient.PhoneNo2 = phone2.Text;
                newClient.PhoneNo3 = phone2.Text;
                newClient.FaxNo = "";
                newClient.EmployerName = "";
                newClient.EmployerPhysicalAddress = "";
                newClient.EmployerPhysicalAddress2 = "";
                newClient.EmployerPhysicalAddress3 = "";
                newClient.EmployerPhysicalCity = 1;
                newClient.EmployerPhysicalCountry = 1;
                newClient.EmployerPostalAddress = "";
                newClient.EmployerPostalAddress2 = "";
                newClient.EmployerPostalAddress3 = "";
                newClient.EmployerPostalCity = 1;
                newClient.EmployerPostalCountry = 1;
                newClient.EmployerPhoneNo = "";
                newClient.EmployerPhoneNo2 = "";
                newClient.EmployerFaxNo = "";
                newClient.EmailAddress = email3.Text;
                newClient.EmailAddress2 = "";
                newClient.EmailStatement = true;
                newClient.HoldStatement = false;
                newClient.Dimension = "";
                newClient.Dimension2 = "";
                newClient.Dimension3 = "";
                newClient.Dimension4 = "";
                newClient.Dimension5 = "";
                newClient.CreditLimit = 0;
                newClient.DebitLimit = 0;
                newClient.SettlementLimit = 0;
                newClient.Active = true;// (bool)chkActive.Value;
                newClient.ClientID = HttpContext.Current.Session["SelectedClientID"].ToString(); 
                newClient.Update = 1;
                newClient.Delete = 0;
                newClient.UpfrontFee =  false;//(bool)chkUpfrontFee.Value;
                newClient.IncomeTaxNo = "";
                newClient.ManagedClient = false;// (bool)chkManaged.Value;
                newClient.LedgerFee = false;// (bool)chkLedgerFees.Value;
                newClient.FundAdmin = 0;
                newClient.ClientGroup = 1;// (@cboClientGroup.Value == null ? 0 : (int)cboClientGroup.Value);
                newClient.IsFundAdmin = true;
                newClient.IncomeType = int.Parse(cboIncomeType.Value.ToString()); //(@cboIncomeType.Value == null ? 0 : (int)cboIncomeType.Value);
                newClient.Nationality = int.Parse(drpNationality.Value.ToString()); //(@drpNationality.Value == null ? 0 : (int)drpNationality.Value);
                newClient.Citizenship = int.Parse(cboCitizenship.Value.ToString()); //(@cboCitizenship.Value == null ? 0 : (int)cboCitizenship.Value);
                newClient.Citizenship2 = int.Parse(cboCitizenship.Value.ToString()); //(cboSecondCitizenship.Value == null ? 0 : (int)cboSecondCitizenship.Value);
                newClient.HasUSGreenCard = false; //(bool)chkGreenCardHolder.Value;
                newClient.IsUSResident = false;// (bool)chkIsUSResident.Value;
                newClient.DividendWTax = 0;
                newClient.Sector = int.Parse(cboSector.Value.ToString());//(@cboSector.Value == null ? 0 : (int)cboSector.Value);
                newClient.IncomeSource = int.Parse(cboSourceOfIncome.Value.ToString());// (@cboSourceOfIncome.Value == null ? 0 : (int)cboSourceOfIncome.Value);
                newClient.ClientRisk = int.Parse(cboRiskRating.Value.ToString()); //(@cboRiskRating.Value == null ? 0 : (int)cboRiskRating.Value);
                newClient.EstimatedAnnualSales = 0;
                newClient.EstimatedTransPerMonth = 0;
                newClient.AnticipatedTransPerMonth = 0;
                newClient.AnticipatedTotalAmount = 0;
                newClient.ExpiryDate = DateTime.Now.ToString("yyyy-MM-dd");
                newClient.GovRegNo = txtGovRegNo.Text;
                newClient.RelationshipManager = 0;
                newClient.GovBody = "";
                newClient.UseGlobalPortfolioModel = "";
                newClient.CountryOfResidence = 1;// (@drpCountryOfResidence.Value == null ? 0 : (int)drpCountryOfResidence.Value);
                newClient.SendSMS = false;//(bool)chkSendSms.Value;
                newClient.VFXNumber = txtVfxAccountNumber.Text;
                newClient.ZSENumber = txtZseAccountNumber.Text;
                newClient.SexType = int.Parse(sex.Value.ToString()) ;// (cboGender.Value == null ? 0 : (int)cboGender.Value);
            }


            try
            {

                var webClient = new WebClient();
                {
                    //webClient.BaseAddress = "http:localhost:93/gsam";
                    var url = "http://localhost:93/gsam/api/client/create_update";

                    webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                    webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                    string data = JsonConvert.SerializeObject(newClient);
                    var response = webClient.UploadString(url, data);
                    var result = JsonConvert.DeserializeObject<Jresponse>(response);
                    System.Console.WriteLine(result);

                    //Session["SelectedClientID"] = result.data.ClientID;
                    //    Response.Redirect("aaac.aspx");

                  //  String cv = HttpContext.Current.Request.RawUrl;
                   // String message = "new Individual Account Successfully Saved";
                  //  Response.Redirect("webForm2.aspx?param1=" + EncryptionHelper.Encrypt(message) + "&param2=" + EncryptionHelper.Encrypt(cv));
                }
            }

            catch (Exception ex)
            {
                throw ex;
            }
            */


      


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

            if (e.NewValues["Name"] == null && e.NewValues["IdentificationNo"] ==null && e.NewValues["Name3"] == null)
            {
                AddError(e.Errors, grid.Columns["Name"], "Name Can Not be Null");
                AddError(e.Errors, grid.Columns["IdentificationNo"], "Name Can Not be Null");
                AddError(e.Errors, grid.Columns["Name3"], "Name Can Not be Null");
            }
          
        }

        void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
        {
            if (errors.ContainsKey(column)) return;
            errors[column] = errorText;
        }
        protected void grid_RowInserting(object sender, ASPxDataInsertingEventArgs e)
        {
            //  e.NewValues["ID"] = GetMemoText();
            //String b = e.NewValues["ID"].ToString();//= GetMemoText();
            // String c = txtPhoneNo.Text;
            /*  String d = e.NewValues["AccountNo"].ToString();
              String r = e.NewValues["AccountTypeName"].ToString();*/

            //  String r = e.NewValues["txtfirstName"].ToString();
            //String r2 = e.NewValues["PhoneNo2"].ToString();

            // e.NewValues["notesEditor"] = GetMemoText();
            ASPxPageControl pageControl = grid.FindEditFormTemplateControl("pageControl") as ASPxPageControl;


            ASPxTextBox txtclientno = pageControl.FindControl("txtclientno") as ASPxTextBox;
            ASPxTextBox name = pageControl.FindControl("txtfirstName") as ASPxTextBox;
            ASPxTextBox name2 = pageControl.FindControl("txtMiddleName1") as ASPxTextBox;
            ASPxTextBox name3 = pageControl.FindControl("txtfirstName") as ASPxTextBox;
            ASPxTextBox IdentificationNo = pageControl.FindControl("txtIdentificationNo") as ASPxTextBox;

            ASPxTextBox txtGovRegNo = pageControl.FindControl("txtGovRegNo") as ASPxTextBox;

            // ASPxTextBox email = pageControl.FindControl("txtIdentificationNo") as ASPxTextBox;
            ASPxTextBox phone = pageControl.FindControl("txtPhoneNo1") as ASPxTextBox;
            ASPxTextBox phone2 = pageControl.FindControl("txtPhoneNo2") as ASPxTextBox;
            ASPxTextBox email3 = pageControl.FindControl("txtEmailAddress") as ASPxTextBox;

            ASPxMemo physicalAddress = pageControl.FindControl("txtPhysicalAddressmemo") as ASPxMemo;
            ASPxMemo physicalAddress2 = pageControl.FindControl("txtPhysicalAddressmemo2") as ASPxMemo;

            ASPxMemo postaAddress = pageControl.FindControl("txtPostalAddressmemo") as ASPxMemo;
            ASPxMemo postaAddress2 = pageControl.FindControl("txtPostalAddressmemo2") as ASPxMemo;
            //  string email1 = email.Text;

            ASPxComboBox cboRiskRating = pageControl.FindControl("cboRiskRating") as ASPxComboBox;
            ASPxComboBox cust = pageControl.FindControl("cboCustodialGroup") as ASPxComboBox;
            ASPxComboBox salutationtype = pageControl.FindControl("cboSalutation") as ASPxComboBox;
            ASPxComboBox sex = pageControl.FindControl("cboGender") as ASPxComboBox;
            ASPxComboBox drpCountryOfResidence = pageControl.FindControl("drpCountryOfResidence") as ASPxComboBox;
            ASPxComboBox cboSourceOfIncome = pageControl.FindControl("cboSourceOfIncome") as ASPxComboBox;
            ASPxComboBox cboBranch = pageControl.FindControl("cboBranch") as ASPxComboBox;
            ASPxComboBox drpNationality = pageControl.FindControl("drpNationality") as ASPxComboBox;
            ASPxComboBox cboCitizenship = pageControl.FindControl("cboCitizenship") as ASPxComboBox;
            ASPxComboBox cboIncomeType = pageControl.FindControl("cboIncomeType") as ASPxComboBox;
            ASPxComboBox cboSector = pageControl.FindControl("cboSector") as ASPxComboBox;

            ASPxTextBox txtZseAccountNumber = pageControl.FindControl("txtZseAccountNumber") as ASPxTextBox;
            ASPxTextBox txtVfxAccountNumber = pageControl.FindControl("txtVfxAccountNumber") as ASPxTextBox;

            int v = int.Parse(cboRiskRating.Value.ToString());
            int c = int.Parse(cust.Value.ToString());
            int c1 = int.Parse(salutationtype.Value.ToString());


            ClientMDL newClient = new ClientMDL();
            {
                newClient.Name = name.Text;
                newClient.Name2 = name2.Text;
                newClient.Name3 = name3.Text;
                //newClient.ClientNo = txtclientno.Text;//HttpContext.Current.Session["SelectedClientID"].ToString();
                newClient.Corporate = false;
                newClient.SalutationType = int.Parse(salutationtype.Value.ToString());
                newClient.DateOfBirth = DateTime.Now;//DateTime.Now.ToString("yyyy-MM-dd");
                newClient.IndustryType = 0;
                newClient.RegistrationOffice = "";
                newClient.VATRegistrationNo = "";
                newClient.BPNumber = "0";
                newClient.TaxStatus = true;
                newClient.WithholdingTaxStatus = true;
                newClient.ResidentShareholdersTaxStatus = true;
                newClient.IdentificationType = 0; //(@drpIdentificationType.Value == null ? 0 : (int)drpIdentificationType.Value);
                newClient.IdentificationNo = IdentificationNo.Text;
                newClient.AgentID = 0;
                newClient.CustodialID = 0;
                newClient.CounterpartyType = 0;///(@cboCounterpartyType.Value == null ? 0 : (int)cboCounterpartyType.Value);
                newClient.CustodialGroup = int.Parse(cust.Value.ToString());// (cboCustodialGroup.Value == null ? 0 : (int)cboCustodialGroup.Value);
                newClient.InceptionDate = DateTime.Now;// DateTime.Now.ToString("yyyy-MM-dd");
                newClient.SpecialInstructions = physicalAddress.Text;
                newClient.BranchID = cboBranch.Value.ToString(); //(@cboBranch.Value == null ? 0 : (int)cboBranch.Value);
                newClient.PhysicalAddress = physicalAddress.Text;
                newClient.PhysicalAddress2 = physicalAddress2.Text; ;
                newClient.PhysicalAddress3 = "";
                newClient.PhysicalCity = 1;//(@cboCity.Value == null ? 0 : (int)cboCity.Value);
                newClient.PhysicalCountry = 1; //(cboCountry.Value == null ? 0 : (int)cboCountry.Value);
                newClient.PostalAddress = postaAddress.Text;
                newClient.PostalAddress2 = postaAddress2.Text;
                newClient.PostalAddress3 = "";
                newClient.PostalCity = 1;// (@cboPostCity.Value == null ? 0 : (int)cboPostCity.Value);
                newClient.PostalCountry = 1;// (cboPostCity.Value == null ? 0 : (int)cboPostCity.Value);
                newClient.PhoneNo = phone.Text;
                newClient.PhoneNo2 = phone2.Text;
                newClient.PhoneNo3 = phone2.Text;
                newClient.FaxNo = "";
                newClient.EmployerName = "";
                newClient.EmployerPhysicalAddress = "";
                newClient.EmployerPhysicalAddress2 = "";
                newClient.EmployerPhysicalAddress3 = "";
                newClient.EmployerPhysicalCity = 1;
                newClient.EmployerPhysicalCountry = 1;
                newClient.EmployerPostalAddress = "";
                newClient.EmployerPostalAddress2 = "";
                newClient.EmployerPostalAddress3 = "";
                newClient.EmployerPostalCity = 1;
                newClient.EmployerPostalCountry = 1;
                newClient.EmployerPhoneNo = "";
                newClient.EmployerPhoneNo2 = "";
                newClient.EmployerFaxNo = "";
                newClient.EmailAddress = email3.Text;
                newClient.EmailAddress2 = "";
                newClient.EmailStatement = true;
                newClient.HoldStatement = false;
                newClient.Dimension = "";
                newClient.Dimension2 = "";
                newClient.Dimension3 = "";
                newClient.Dimension4 = "";
                newClient.Dimension5 = "";
                newClient.CreditLimit = 0;
                newClient.DebitLimit = 0;
                newClient.SettlementLimit = 0;
                newClient.Active = true;// (bool)chkActive.Value;
               // newClient.ClientID = HttpContext.Current.Session["SelectedClientID"].ToString(); ;
                newClient.Update = 0;
                newClient.Delete = 0;
                newClient.UpfrontFee = false;//(bool)chkUpfrontFee.Value;
                newClient.IncomeTaxNo = "";
                newClient.ManagedClient = false;// (bool)chkManaged.Value;
                newClient.LedgerFee = false;// (bool)chkLedgerFees.Value;
                newClient.FundAdmin = 0;
                newClient.ClientGroup = 1;// (@cboClientGroup.Value == null ? 0 : (int)cboClientGroup.Value);
                newClient.IsFundAdmin = true;
                newClient.IncomeType = int.Parse(cboIncomeType.Value.ToString()); //(@cboIncomeType.Value == null ? 0 : (int)cboIncomeType.Value);
                newClient.Nationality = int.Parse(drpNationality.Value.ToString()); //(@drpNationality.Value == null ? 0 : (int)drpNationality.Value);
                newClient.Citizenship = int.Parse(cboCitizenship.Value.ToString()); //(@cboCitizenship.Value == null ? 0 : (int)cboCitizenship.Value);
                newClient.Citizenship2 = int.Parse(cboCitizenship.Value.ToString()); //(cboSecondCitizenship.Value == null ? 0 : (int)cboSecondCitizenship.Value);
                newClient.HasUSGreenCard = false; //(bool)chkGreenCardHolder.Value;
                newClient.IsUSResident = false;// (bool)chkIsUSResident.Value;
                newClient.DividendWTax = 0;
                newClient.Sector = int.Parse(cboSector.Value.ToString());//(@cboSector.Value == null ? 0 : (int)cboSector.Value);
                newClient.IncomeSource = int.Parse(cboSourceOfIncome.Value.ToString());// (@cboSourceOfIncome.Value == null ? 0 : (int)cboSourceOfIncome.Value);
                newClient.ClientRisk = int.Parse(cboRiskRating.Value.ToString()); //(@cboRiskRating.Value == null ? 0 : (int)cboRiskRating.Value);
                newClient.EstimatedAnnualSales = 0;
                newClient.EstimatedTransPerMonth = 0;
                newClient.AnticipatedTransPerMonth = 0;
                newClient.AnticipatedTotalAmount = 0;
                newClient.ExpiryDate = DateTime.Now.ToString("yyyy-MM-dd");
                newClient.GovRegNo = txtGovRegNo.Text;
                newClient.RelationshipManager = 0;
                newClient.GovBody = "";
                newClient.UseGlobalPortfolioModel = "";
                newClient.CountryOfResidence = 1;// (@drpCountryOfResidence.Value == null ? 0 : (int)drpCountryOfResidence.Value);
                newClient.SendSMS = false;//(bool)chkSendSms.Value;
                newClient.VFXNumber = txtVfxAccountNumber.Text;
                newClient.ZSENumber = txtZseAccountNumber.Text;
                newClient.SexType = int.Parse(sex.Value.ToString());// (cboGender.Value == null ? 0 : (int)cboGender.Value);
            }


            try
            {

                var webClient = new WebClient();
                {
                    //webClient.BaseAddress = "http:localhost:93/gsam";
                    var url = "http://localhost:93/gsam/api/client/create_update";

                    webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
                    webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
                    string data = JsonConvert.SerializeObject(newClient);
                    var response = webClient.UploadString(url, data);
                    var result = JsonConvert.DeserializeObject<Jresponse>(response);
                    System.Console.WriteLine(result);

                    //Session["SelectedClientID"] = result.data.ClientID;
                    //    Response.Redirect("aaac.aspx");

                    //  String cv = HttpContext.Current.Request.RawUrl;
                    // String message = "new Individual Account Successfully Saved";
                    //  Response.Redirect("webForm2.aspx?param1=" + EncryptionHelper.Encrypt(message) + "&param2=" + EncryptionHelper.Encrypt(cv));
                }
            }

            catch (Exception ex)
            {
                throw ex;
            }


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
                fireDateEditor.ClientEnabled = !grid.IsNewRowEditing;
                fireDateEditor.ClearButton.DisplayMode = ClearButtonDisplayMode.OnHover;
                fireDateEditor.ClientSideEvents.ValueChanged = "onDismissalDateChanged";
            }
        }

    }
}