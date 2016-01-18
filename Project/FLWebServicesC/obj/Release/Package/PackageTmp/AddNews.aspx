<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="FLWebServicesC.AddNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ClientsMainContent" runat="server">
     <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <br />
    
    <table class="TabelStyles" style="width: 100%" dir="ltr">
           <tr>
                <td colspan="5" dir="rtl"  >
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: right;" colspan="3">
                    <asp:Label ID="Label1info" runat="server" Text=" " ForeColor="Red"></asp:Label>
                    &nbsp;</td>
                <td style="width: 10%">
                </td>
           </tr>
            
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: right;" colspan="3">
                    &nbsp;</td>
                <td dir="rtl" style="width: 10%">
                    <asp:Label ID="LaStudentName2" runat="server" 
                        meta:resourcekey="LaStudentNameResource1" 
                        Text="<%$ Resources:Resource1,SendTo%>"></asp:Label>
                </td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td style="text-align: right;" colspan="3">
                   &nbsp;</td>
               <td style="width: 10%">
                   <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                       onselectedindexchanged="DropDownList1_SelectedIndexChanged1" Width="100%">
                       <asp:ListItem Text="<%$ Resources:Resource1,All%>" Value="0"> </asp:ListItem>
                       <asp:ListItem Text="<%$ Resources:Resource1,Oneperson%>" Value="1"> </asp:ListItem>
                   </asp:DropDownList>
               </td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td dir="ltr"  >
                   <asp:Button ID="BuAddData" runat="server" CssClass="ButtonADD" ValidationGroup="SendMEssage"
                       meta:resourcekey="BuAddStudentResource1" onclick="BuAddData_Click" 
                       Text="<%$ Resources:Resource1,send%>" />
               </td>
               <td dir="rtl">
                   <asp:Button ID="BuSearch" runat="server" CssClass="ButtonSearch" Height="30px" 
                       meta:resourcekey="BuAddStudentResource1" onclick="BuSearch_Click" 
                       Text="<%$ Resources:Resource1,Search%>" Visible="False" />
               </td>
               <td dir="rtl" width="300">
                   <asp:TextBox ID="txtStudentName" runat="server" MaxLength="250" 
                       meta:resourcekey="txtStudentNameResource1" 
                       ontextchanged="txtStudentName_TextChanged" style="text-align:right" 
                       Visible="False" Width="350px"></asp:TextBox>
               </td>
               <td style="width: 10%">
                   <asp:Label ID="LaStudentName6" runat="server" 
                       meta:resourcekey="LaStudentNameResource1" 
                       Text="<%$ Resources:Resource1,StudentName %>" Visible="False"></asp:Label>
               </td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td dir="rtl" style="text-align: right;" colspan="3">
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                       CellPadding="4" DataKeyNames="StudentID" DataSourceID="SDSSDegress2013" 
                       EmptyDataText="<%$ Resources:Resource1,NoDataMath %>" ForeColor="#333333" 
                       GridLines="None" onrowcommand="GridView1_RowCommand" Visible="False">
                       <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                       <Columns>
                           <asp:TemplateField HeaderText="<%$ Resources:Resource1,StudentName%>">
                               <ItemTemplate>
                                   <asp:Label ID="Label3" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:TemplateField HeaderText="<%$ Resources:Resource1,emailAddress%>">
                               <ItemTemplate>
                                   <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                           <asp:ButtonField CommandName="MyCommand" 
                               HeaderText="<%$ Resources:Resource1,choseStudent%>" />
                           <asp:ButtonField ButtonType="Button" CommandName="Save" 
                               HeaderText="<%$ Resources:Resource1,choseStudent%>" 
                               Text="<%$ Resources:Resource1,send%>" ValidationGroup="SendMEssage" />
                       </Columns>
                       <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                       <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                       <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                       <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                       <AlternatingRowStyle BackColor="White" />
                   </asp:GridView>
                   <asp:SqlDataSource ID="SDSSDegress2013" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:FLCS %>" 
                       onselecting="SDSSDegress2013_Selecting" SelectCommand="   SELECT StudentID, StudentFirstName + ' ' + StudentLastName as    FullName,StudentEmail as  Email
  FROM  [MyStudents] where AccountTypeID=3 and  StudentFirstName + ' ' + StudentLastName like   '%' +@name + '%' ">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="txtStudentName" Name="name" 
                               PropertyName="Text" />
                       </SelectParameters>
                   </asp:SqlDataSource>
               </td>
               <td style="width: 10%">
                   &nbsp;</td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td style="text-align: right;" colspan="3">
                   ______________________________________________________________________________________________________</td>
               <td style="width: 10%">
                   &nbsp;</td>
           </tr>
            
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: right;" dir="rtl" colspan="3">
                    <asp:TextBox ID="txtMessageTitle" runat="server" MaxLength="150" 
                        meta:resourcekey="txtStudentNameResource1" style="text-align:right" 
                        Height="45px" Width="100%" TextMode="MultiLine"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regtxtNotes" runat="server" 
                        ControlToValidate="txtMessageTitle" Display="Dynamic" 
                        ErrorMessage="<%$ Resources:Resource1,MostThan250%>" ForeColor="Red" 
                        ValidationExpression="^.{0,150}"></asp:RegularExpressionValidator>
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
               <td dir="rtl" style="text-align: right;" colspan="3">
                   <asp:HiddenField ID="HiddenField1" runat="server" />
               </td>
               <td style="width: 10%">
                   <asp:Label ID="LaStudentName5" runat="server" 
                       meta:resourcekey="LaStudentNameResource1" 
                       Text="<%$ Resources:Resource1,MessageDetails%>"></asp:Label>
               </td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td dir="rtl" style="text-align: right;" colspan="3">
                   <asp:TextBox ID="txtMessageDetails" runat="server" MaxLength="2000" 
                       meta:resourcekey="txtStudentNameResource1" style="text-align:right" 
                       Height="500px" TextMode="MultiLine" Width="100%" Font-Size="16pt"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="SendMEssage"
                       ControlToValidate="txtMessageDetails" ErrorMessage="*" ForeColor="#FF0066" 
                       meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
               </td>
               <td style="width: 10%">
                   &nbsp;</td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td dir="rtl" style="text-align: right;" colspan="3">
                   &nbsp;</td>
               <td style="width: 10%">
                   &nbsp;</td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td dir="rtl" style="text-align: right;" colspan="3">
                   <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                       CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                       GridLines="None" DataKeyNames="AttachID,AttachLink,AttachDate">
                       <AlternatingRowStyle BackColor="White" />
                       <Columns>
                           
                           <asp:BoundField DataField="AttachID" HeaderText="AttachID" ReadOnly="True" 
                               SortExpression="AttachID" />
                           <asp:TemplateField HeaderText="Path">
                           <ItemTemplate>
                               <asp:HyperLink ID="HyperLink1" runat="server" 
                                   NavigateUrl='<%# Eval("AttachLink") %>' Text='<%# Eval("AttachLink") %>'></asp:HyperLink>
                           </ItemTemplate>
                           </asp:TemplateField>
                          
                         
                           <asp:BoundField DataField="AttachDate" HeaderText="AttachDate" 
                               SortExpression="AttachDate" />
                               <asp:CommandField ShowDeleteButton=true DeleteImageUrl="~/Images/cancel.png"  ButtonType="Image" />
                           
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
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT AttachmentID AS AttachID, AttachmentPath AS AttachLink, AttachmentDateIN AS AttachDate FROM Attachments WHERE (AttachmentID = @AttachID)" 
                       
                       DeleteCommand="DELETE FROM Attachmentss WHERE (AttachmentID = @AttachID) AND (AttachmentDateIN = @AttachDate) AND (AttachmentPath = @AttachLink)">
                       <DeleteParameters>
                           <asp:Parameter Name="AttachID" />
                           <asp:Parameter Name="AttachDate" />
                           <asp:Parameter Name="AttachLink" />
                       </DeleteParameters>
                       <SelectParameters>
                           <asp:ControlParameter ControlID="HiddenField1" Name="AttachID" 
                               PropertyName="Value" />
                       </SelectParameters>
                   </asp:SqlDataSource>
               </td>
               <td style="width: 10%">
                   &nbsp;</td>
           </tr>
           <tr>
               <td>
                   &nbsp;</td>
               <td dir="rtl" style="text-align: right;" colspan="3">
                   <asp:FileUpload ID="FileUpload1" runat="server" />
                   <asp:RegularExpressionValidator ID="regtxtNotes4" runat="server" 
                       ControlToValidate="FileUpload1" Display="Dynamic" 
                       ErrorMessage="<%$ Resources:Resource1,AlowsFile%>" ForeColor="Red" 
                       ValidationExpression="^.*\.(jpg|JPG|gif|GIF|bmp|BMP|png|PNG|jpeg|JPEG|pdf|PDF|docx|DOCX|PPTX|pptx|zip|ZIP)$"></asp:RegularExpressionValidator>
               </td>
               <td style="width: 10%">
                   <asp:Label ID="LaStudentName4" runat="server" 
                       meta:resourcekey="LaStudentNameResource1" 
                       Text="<%$ Resources:Resource1,Attachments%>"></asp:Label>
               </td>
           </tr>
            </table>
    </ContentTemplate>
     
    </asp:UpdatePanel>
    </div>
    <table class="style1">
        <tr>
            <td width="100">
                   &nbsp;</td>
            <td>
                   <asp:Button ID="BuSearch0" runat="server" CssClass="ButtonSearch" 
                       meta:resourcekey="BuAddStudentResource1" onclick="BuSearche_Click" 
                       Text="<%$ Resources:Resource1,Upload%>"   />
                   </td>
        </tr>
    </table>
    <br />
</asp:Content>
