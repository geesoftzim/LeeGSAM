﻿using System;
using System.IO;

namespace LastTrialGene {
    public partial class Article : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            TextContent.InnerHtml = File.ReadAllText(Server.MapPath(@"~/App_Data/Article.html"));

            TableOfContentsTreeView.DataBind();
            TableOfContentsTreeView.ExpandAll();
        }
    }
}