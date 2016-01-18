<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="FLWebServicesC.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style type="text/css">
        .auto-style7 {
        }

        </style>
 
 

    <script type="application/javascript" src="http://jsonip.appspot.com/?callback=getip"></script>
    <script type="text/javascript">

       <%-- function networkInfo() {

            try {

                var myHidden = document.getElementById('<%= HFMAC.ClientID %>');


                myHidden.value = myIP();
            }
            catch (err) {
                // alert(err)
            }--%>

        
        function myIP() {
            if (window.XMLHttpRequest) xmlhttp = new XMLHttpRequest();
            else xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");

            xmlhttp.open("GET", "http://api.hostip.info/get_html.php", false);
            xmlhttp.send();

            hostipInfo = xmlhttp.responseText.split("\n");

            for (i = 0; hostipInfo.length >= i; i++) {
                ipAddress = hostipInfo[i].split(":");
                if (ipAddress[0] == "IP") return ipAddress[1];
            }

            return false;
        }
        window.onload = networkInfo;
    </script>
   <div class="container">
 
       <br />
  <div class="row">
       <div class="col-md-3">
           <h1> </h1>      
    <p> </p>  
           </div>
    <div class="col-md-3">
  
                 
                     <div class="panel panel-default" style="Width:499px">
      <div class="panel-heading">Admin and Student Login</div>
      <div class="panel-body">
          <p>This Page is only for authorized who attend the tutorial they could see their grade and courses and homeworks.</p>  
                    <div id="LoginAdmin">
                        <table class="auto-style6">
                            <tr>
                                <td class="auto-style7">
                               
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7" colspan="2">
                                       <div class="alert alert-danger" id="theDiv" runat="server">
                                       
   
                                              <asp:Literal ID="LiMessage" Text="<strong>Warning!</strong> Indicates a warning that might need attention." runat="server"></asp:Literal>
  </div>
                                  
                             <div style="text-align:center ">
                                         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <asp:UpdateProgress ID="UpdateProgress1" runat="server">
          <ProgressTemplate>
               <img src="Images/StylesImage/LoadingTag.gif" style="width:150px;height:150px" alt="loading"/>
          </ProgressTemplate>

      </asp:UpdateProgress>
                             </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="LaStudentName0" runat="server" CssClass="bold" Font-Size="18pt" meta:resourcekey="LaStudentNameResource1" Text="User Email"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter Your Email"  class="form-control input-lg" MaxLength="50" meta:resourcekey="txtStudentNameResource1" Width="286px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName" ErrorMessage="User name is required field" ForeColor="#FF0066" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="LaStudentName1" runat="server" CssClass="bold" Font-Size="18pt" meta:resourcekey="LaStudentNameResource1" Text="Password"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtPassword" runat="server" class="form-control input-lg" placeholder="Enter your password"   MaxLength="50" meta:resourcekey="txtStudentNameResource1" TextMode="Password" Width="286px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"   ControlToValidate="txtPassword" ErrorMessage="password is required field" ForeColor="#FF0066" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right ">
    <a href="RemianberPassword.aspx"> Forget my password</a> 
<br />
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Button ID="BuAddData" runat="server" class="btn btn-success"     Height="39px" ToolTip="Click to login"     Text="<%$ Resources:Resource1,SignINadmin%>" Width="111px" OnClick="BuAddData_Click1" />
                                
                                </td>
                                <td>
 
                                 

                                </td>
                            </tr>
                        </table>
                    </div>
               </div>
    </div>
        <asp:HiddenField ID="HFMAC" runat="server" />
        </div>
           </div>
             </div>
</asp:Content>
