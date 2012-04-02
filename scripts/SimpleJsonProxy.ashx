<%@ WebHandler Language="C#" Class="SimpleJsonProxy"  %>

using System;
using System.Web;

public class SimpleJsonProxy : IHttpHandler
{
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/json";

        context.Response.Cache.SetExpires(DateTime.Now.AddSeconds(5000));
        context.Response.Cache.SetCacheability(HttpCacheability.Public);
        context.Response.Cache.SetValidUntilExpires(true);
        context.Response.Cache.VaryByParams["u"] = true;
        
        string uri = context.Request["u"].ToString();

        uri = HttpUtility.HtmlDecode(uri);
        
        if (Uri.IsWellFormedUriString(uri, UriKind.Absolute)) {
            
            System.Net.WebClient client = new System.Net.WebClient();
            string json = client.DownloadString(new Uri(uri));

            context.Response.Write(json);
        }
        context.Response.Flush();
        context.Response.Close();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}