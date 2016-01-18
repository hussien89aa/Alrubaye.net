<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="MyHomeWorksdetails.aspx.cs" Inherits="FLWebServicesC.MyHomeWorksdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ClientsMainContent" runat="server">
   <script type="text/javascript">
       // stop typing word after max number
       function isokmaxlength(e, val, maxlengt) {
           var charCode = (typeof e.which == "number") ? e.which : e.keyCode
           //  alert('hi');
           if (!(charCode == 44 || charCode == 46 || charCode == 0 || charCode == 8 || (val.value.length < maxlengt))) {
               return false;
           }
       }

</script>
       <div class="container"   >   
    <table class="TabelStyles" style="width: 100%" dir="ltr">
            <br />
            
            
            
            
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: right;" dir="rtl" colspan="2">
                    <p> 
                    <strong>
                    قم بكتابة مختصر عن الواجب الذي تريد رفعه&nbsp; وبعدها ختر الملف الذي تريد رفعه<br />
 وبعدها اضغط حفظ حتى يتم تسجيل الواجب الخاص بك 
                        </strong> </p>

                </td>
                
                 <td style="width: 10%">
                     &nbsp;</td>
            </tr>
            <tr>
<td></td>
                <td dir="rtl" style="width: 882px">
                          <div class="alert alert-info" dir="rtl" style="Width:400px">
                      <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource1,homeworkinfo %>" Font-Bold="True" Font-Size="12pt"   ></asp:Label>
<br />
                        <asp:Label ID="Latutroalinfo" runat="server" Text="dteilas" ></asp:Label>
                              <hr />
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" DataKeyNames="AttachID,AttachLink,AttachDate" 
                                        DataSourceID="SqlDataSource67" ForeColor="#333333" GridLines="None" 
                                        >
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource1,Attachments%>">
                                <ItemTemplate>
                                    <img src ="Images/StylesImage/globe_down.png"/>
                                    <asp:HyperLink ID="HyperLink2" runat="server" 
                                NavigateUrl='<%# Eval("AttachLink") %>' Text ="<%$ Resources:Resource1,Upload%>" > </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="AttachDate" HeaderText="<%$ Resources:Resource1,DateDo%>" ReadOnly="True" 
                                                SortExpression="AttachDate" />
                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource67" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:FLCS %>" 
                                        
                                         
                                        SelectCommand="SELECT AttachmentID AS AttachID, AttachmentPath AS AttachLink, AttachmentDateIN AS AttachDate FROM Attachments WHERE (AttachmentID = @AttachID) AND (AttachmentTypeID = 1)">
                        <SelectParameters>
                            <asp:Parameter Name="AttachID" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                              <br />

</div>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: right;" dir="rtl" colspan="2">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                       ControlToValidate="txtMessageTitle" ErrorMessage="<%$ Resources:Resource1,olychar %>"
                       ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"  ></asp:RegularExpressionValidator>
                   
                    <asp:TextBox ID="txtMessageTitle" class="form-control input-lg" runat="server" MaxLength="255" onkeypress="return isokmaxlength(event,this,255);"
                        meta:resourcekey="txtStudentNameResource1"  style="text-align:right" 
                        Height="150px" Width="400" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="SendMEssage"
                        ControlToValidate="txtMessageTitle" ErrorMessage="*" ForeColor="#FF0066" 
                        meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                </td>
                <td style="width: 10%">
                    <asp:Label ID="LaStudentName" runat="server" Text='<%$ Resources:Resource1,MessageTitle%>'
                        meta:resourcekey="LaStudentNameResource1"></asp:Label>
                </td>
            </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td  style="text-align: right; width: 882px;" dir="rtl">
                   <asp:FileUpload ID="FileUpload1" runat="server" />
                   <asp:RegularExpressionValidator ID="regtxtNotes4" runat="server" 
                       ControlToValidate="FileUpload1" Display="Dynamic" 
                       ErrorMessage="<%$ Resources:Resource1,AlowsFile%>" ForeColor="Red" 
                       ValidationExpression="^.*\.(jpg|JPG|gif|GIF|bmp|BMP|png|PNG|jpeg|JPEG|pdf|PDF|docx|DOCX|PPTX|pptx|zip|ZIP)$"></asp:RegularExpressionValidator>
               </td>
               <td  style="text-align: right;" dir="rtl">
                   &nbsp;</td>
               <td style="width: 10%">
                   <asp:Label ID="LaStudentName4" runat="server" 
                       meta:resourcekey="LaStudentNameResource1" 
                       Text="<%$ Resources:Resource1,Attachments%>"></asp:Label>
               </td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td  style="text-align: right; width: 882px;" dir="rtl">
                   &nbsp;</td>
               <td  style="text-align: right;" dir="rtl">
                   &nbsp;</td>
               <td style="width: 10%">
                   &nbsp;</td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td  style="text-align: right;" colspan="2">
                    <asp:Button ID="BuAddData0" runat="server"  class="btn btn-success"  Width="100px" Height="38px" meta:resourcekey="BuAddStudentResource1" onclick="BuAddData_Click" Text='<%$ Resources:Resource1,save%>'   />
               </td>
               <td style="width: 10%">
                   &nbsp;</td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td  style="text-align: right;" colspan="2">
                    <asp:HiddenField ID="HFid" runat="server" />
               </td>
               <td style="width: 10%">
                   &nbsp;</td>
           </tr>
        <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: right;" dir="rtl" colspan="2">
                     <hr />
                    <p><mark>  ااذا كانت لديك ملفات سبق وقمت برفعها سيتم عرضها لك هنا بشكل قائمة </mark></p>
                    <div> 
                   <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"  
                       CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                       GridLines="None" DataKeyNames="SubmitHomeWorkID" EmptyDataText='<%$ Resources:Resource1,empty%>'>
                       <AlternatingRowStyle BackColor="White" />
                         
                       <Columns>
                            <asp:BoundField DataField="AttachmentDateIN" HeaderText='<%$ Resources:Resource1,dateupload%>' 
                               SortExpression="AttachmentDateIN" />
                             
                           <asp:TemplateField HeaderText='<%$ Resources:Resource1,view%>'  >
                           <ItemTemplate>
                               <asp:HyperLink ID="HyperLink1" runat="server"  Width="50px"
                                   NavigateUrl='<%# Eval("AttachmentPath") %>' Text='<%$ Resources:Resource1,download%>'></asp:HyperLink>
                           </ItemTemplate>
                           </asp:TemplateField>
                          
                         

                           
                       </Columns>
                       <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                       <PagerStyle BackColor="#FFCC66" ForeColor="#333333"   />
                       <RowStyle BackColor="#FFFBD6"  ForeColor="#333333" HorizontalAlign="Center" />
                       <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    
                       <SortedAscendingCellStyle BackColor="#FDF5AC" />
                       <SortedAscendingHeaderStyle BackColor="#4D0000" />
                       <SortedDescendingCellStyle BackColor="#FCF6C0" />
                       <SortedDescendingHeaderStyle BackColor="#820000" />
                   </asp:GridView>
                   </div>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT StudentHomeWorkSubmit.SubmitHomeWorkID, StudentHomeWorkSubmit.StudentNote, Attachments.AttachmentPath, Attachments.AttachmentDateIN FROM StudentHomeWorkSubmit INNER JOIN Attachments ON Attachments.AttachmentID = StudentHomeWorkSubmit.SubmitHomeWorkID AND Attachments.AttachmentTypeID = 3 WHERE (StudentHomeWorkSubmit.StudentID = @StudentID) AND (StudentHomeWorkSubmit.HomeWorkID = @HomeWorkI)" 
                       
                        >
                       <SelectParameters>
                           <asp:SessionParameter Name="StudentID" SessionField="adminID" />
                           <asp:Parameter Name="HomeWorkI" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                    <br />
                               <div class="alert alert-success" dir="rtl" style="Width:400px">
                                   <asp:Literal ID="LiComment" runat="server"></asp:Literal>
</div>
                </td>
                <td style="width: 10%">
                    &nbsp;</td>
            </tr>
            </table>
           </div>
    
   
  
    <br />

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
              <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;/a>
/div>
     

  </div>
</div>
    </div>
   
</asp:Content>
