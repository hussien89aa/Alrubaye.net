<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RemianberPassword.aspx.cs" Inherits="FLWebServicesC.RemianberPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container"  >
 

  <div class="row">
       
    <div class="col-md-3">
  
                 
                     <div class="panel-success class" style="Width:499px">
      
      <div class="panel-body">
          <font size="4">enter your email  and click send to send you email that help you to getback your account </font>
                    <div id="LoginAdmin">
                        <table class="auto-style6">
                            <tr>
                                <td class="auto-style7">
                               
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7" colspan="2">
                                       <div class="alert alert-info" id="theDiv" visible="false"  runat="server">
                                       
   
                                              <asp:Literal ID="LiMessage" Text="<strong>Thanks! </strong>IF the email is correct you will get message in your mailbox" runat="server"></asp:Literal>
  </div>
                                  

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="LaStudentName0" runat="server" CssClass="bold" Font-Size="18pt" meta:resourcekey="LaStudentNameResource1" Text="Email"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Your Email"  class="form-control input-lg" MaxLength="50" meta:resourcekey="txtStudentNameResource1" Width="286px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="User name is required field" ForeColor="#FF0066" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" 
                        ErrorMessage="Email isnot vaild" ForeColor="Red" 
                        ValidationExpression="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right ">
                                    &nbsp;</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td  style="text-align:right ">
                                    <asp:Button ID="BuAddData" runat="server" class="btn btn-success"   Height="39px" ToolTip="Click to send"    OnClick="BuAddData_Click" Text="Ask for password" Width="191px" />
                                
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
