<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="ChangePssword.aspx.cs" Inherits="FLWebServicesC.ChangePssword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ClientsMainContent" runat="server">
    <div id="ddfD" >
        <font size="4">تغير كلمة المرور  </font> 
        <hr />
        <table class="style1" style="width: 100%">
            <tr>
                <td colspan="3">
                    <asp:Label ID="statusLabel" runat="server" ForeColor="Red"  Font-Size="12pt"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 146px;">
                    <font color="red">*</font> <asp:Label ID="userNameLabel" runat="server" Text='<%$ Resources:Resource1,OldPassword%>'></asp:Label>
                </td>
                <td style="width: 160px">
                    <asp:TextBox ID="txtOldPassword" class="form-control input-lg" runat="server" TextMode="Password" Width="300px" Font-Size="18pt" ></asp:TextBox>
                    <br />
                </td>
                <td>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtOldPassword" ErrorMessage="Old password is required field" ForeColor="#FF0066" 
                        meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regtxtNotes1" runat="server" 
                        ControlToValidate="txtOldPassword" Display="Dynamic" 
                        ErrorMessage="<%$ Resources:Resource1,MostThan250%>" ForeColor="Red" 
                        ValidationExpression="^.{0,25}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; width: 146px; height: 47px;">
                    <font color="red">*</font> <asp:Label ID="passwordLabel" runat="server" Text= '<%$ Resources:Resource1,AdminPassword%>' ></asp:Label>
                </td>
                <td style="width: 160px; ">
                    <asp:TextBox ID="txtAdminPassword" class="form-control input-lg" runat="server" TextMode="Password" Width="300px" Font-Size="18pt"></asp:TextBox>
                     <br />
                </td>
                <td style="height: 47px">
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="txtAdminPassword" ErrorMessage="new password is required field" ForeColor="#FF0066" 
                        meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" 
                        ControlToValidate="txtAdminPassword" Display="Dynamic" 
                        ErrorMessage="<%$ Resources:Resource1,MostThan250%>" ForeColor="Red" 
                        ValidationExpression="^.{0,50}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; height: 26px; width: 146px;">
                     <font color="red">*</font> <asp:Label ID="passwordLabel0" runat="server" 
                        Text='<%$ Resources:Resource1,PasswordEapeat%>'></asp:Label>
                </td>
                <td style="width: 160px;">
                    <asp:TextBox ID="txtAdminPasswordRepeat" class="form-control input-lg" runat="server" TextMode="Password" Width="300px" Font-Size="18pt"></asp:TextBox>
                     <br />
                </td>
                <td style="height: 26px">
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="txtAdminPasswordRepeat" ErrorMessage=" Repeat password is required field" ForeColor="#FF0066" 
                        meta:resourcekey="RequiredFieldValidator1Resource13"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtAdminPasswordRepeat" Display="Dynamic" 
                        ErrorMessage="<%$ Resources:Resource1,MostThan250%>" ForeColor="Red" 
                        ValidationExpression="^.{0,50}"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtAdminPassword" ControlToValidate="txtAdminPasswordRepeat" 
                         ForeColor="Red"
                         ErrorMessage="New Password dosenot match"  ></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4" style="width: 246px; text-align: right;">
                    &nbsp;</td>
                <td style="width: 160px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" style="width: 146px">
                    &nbsp;</td>
                <td style="width: 160px ;">
                    <asp:Button ID="BuAddData" runat="server"  class="btn btn-success"  Width="100px" Height="38px" meta:resourcekey="BuAddStudentResource1" onclick="BuAddData_Click" Text='<%$ Resources:Resource1,save%>'   />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" style="width: 146px">
                    &nbsp;</td>
                <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
        </table>
        
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

           <asp:Literal ID="LiMessage" Text="<strong>Success!</strong> Data is added successfully." runat="server"></asp:Literal>
              <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
</div>
     

  </div>
</div>
</asp:Content>
