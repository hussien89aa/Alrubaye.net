<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgetPassWord.aspx.cs" Inherits="FLWebServicesC.ForgetPassWord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
 
        
                     <div class="panel panel-default" style="Width:499px">
      <div class="panel-heading">Change Password</div>
      <div class="panel-body">
                    <div id="LoginAdmin">
                        <table class="auto-style6">
                            <tr>
                                <td class="auto-style7">
                               
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7" colspan="2">
                                       <div class="alert alert-danger" id="theDiv" visible="false"  runat="server">
                                       
   
                                              <asp:Literal ID="LiMessage" Text="<strong>Warning!</strong> Indicates a warning that might need attention." runat="server"></asp:Literal>
  </div>
                                  

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="LaStudentName0" runat="server" CssClass="bold" Font-Size="18pt" meta:resourcekey="LaStudentNameResource1" Text="Password"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtPassword" runat="server" class="form-control input-lg" placeholder="Enter New password"   MaxLength="50" meta:resourcekey="txtStudentNameResource1" TextMode="Password" Width="286px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"   ControlToValidate="txtPassword" ErrorMessage="password is required field" ForeColor="#FF0066" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    &nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:TextBox ID="txtPasswordR" runat="server" class="form-control input-lg" placeholder="Enter new password again"   MaxLength="50" meta:resourcekey="txtStudentNameResource1" TextMode="Password" Width="286px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"   ControlToValidate="txtPasswordR" ErrorMessage="password is required field" ForeColor="#FF0066" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtPassword" ControlToValidate="txtPasswordR" 
                         ForeColor="Red"
                         ErrorMessage="New Password dosenot match"  ></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right ">
                                    &nbsp;</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Button ID="BuAddData" runat="server" class="btn btn-success"   Height="39px" ToolTip="Click to save"    OnClick="BuAddData_Click" Text="Update" Width="111px" />
                                
                                </td>
                                <td>
 
                                 

                                </td>
                            </tr>
                        </table>
                    </div>
               </div>
    </div>
       
       
             </div>


      <!-- Message Lables-->

          <script type="text/javascript">
              function ShowModalSucces() {
        $('#ModalMessage').modal('show');
        window.setTimeout(HideModal, 1000);
       
    }

              function ShowModalError() {
                 
                  $("#DivMessagePanel").addClass('alert alert-danger');
                  $('#ModalMessage').modal('show');
    }

    function HideModal() {
        $('#ModalMessage').modal('hide');
    }
</script>                                   
<div id="ModalMessage" class="modal fade" role="dialog">
  <div class="modal-dialog">

     
          <div class="alert alert-success"   id="DivMessagePanel">

           <asp:Literal ID="Literal1" Text="<strong>Success!</strong> Data is added successfully." runat="server"></asp:Literal>
              <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
</div>
     

  </div>
</div>
</asp:Content>
