﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BAIT2113_WAD
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session.Timeout = 60;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            //Application.Lock();
            //Application["NoOfErrors"] = (int)Application["NoOfErrors"] + 1;
            //Application.UnLock();
            //Response.Write("Error");
            //Server.ClearError();

            // Code that runs when an unhandled error occurs
            //Exception Ex = Server.GetLastError();
            //Server.ClearError();
            //HttpContext.Current.RewritePath("/errors/Error.html");
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}