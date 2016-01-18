<%@ Page Title="" Language="C#" enableEventValidation="true" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="MyDashoard.aspx.cs" Inherits="FLWebServicesC.MyDashoard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ClientsMainContent" runat="server">
    
     <style type="text/css">
        .style1
        {
            height: 21px;
        }
    </style>
 
 
    <div dir="rtl" class="ItemNewsBackgruound">  
    <p>

                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14" 
                        Text="<%$ Resources:Resource1,lastNews%>"></asp:Label>
                  </p>
     
                        
    <table   style="width: 100%">
        <tr>
            <td class="style1">
                </td>
            <td class="style1" 
                >
                </td>
        </tr>
        <tr>
            <td colspan="2">
               
                 

                <asp:DataList ID="DataList3" runat="server" DataKeyField="NewsID" 
                    DataSourceID="SqlDataSource3" Width="100%">
                    <ItemTemplate> 
                       
                            <div class="ItemNews img-rounded">
                                   
                                    
                                          <div class="ItemNewsConatin" > 
                    <asp:Panel ID="Panel1" runat="server" CssClass="pnl2">
                        
                    <div style="width: 100%">
                    <table class="style1" style="width: 100%">
                            <tr>
                                <td width="10px">
                                   <asp:Label ID="Label2" runat="server" 
                                        meta:resourcekey="LaStudentNameResource1" 
                                        Text="<%$ Resources:Resource1,Number %>" Font-Bold="True"></asp:Label>:
                                </td>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("NewsID") %>' 
                                        Font-Bold="True"></asp:Label>
                                </td>
                                <td dir="ltr">
                                    :<asp:Label ID="Label10" runat="server" 
                                        meta:resourcekey="LaStudentNameResource1" 
                                        Text="<%$ Resources:Resource1,Departmnt %>" Font-Bold="True"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("AccountTypeName") %>' 
                                        Font-Bold="True"></asp:Label>
                                </td>
                                <td dir="ltr">
                                   : 
                                    <asp:Label ID="Label12" runat="server" 
                                        meta:resourcekey="LaStudentNameResource1" 
                                        Text="<%$ Resources:Resource1,DateDo %>" Font-Bold="True"></asp:Label> 
                                </td>
                                <td  >
                                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("NewsDate") %>' 
                                        Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            </table>
                    </div>
                    </asp:Panel>

                        <table class="style1" style="width: 100%;">
                           
                            <tr>
                                <td    >
                                    <asp:Label ID="Label5" runat="server" Font-Size="18pt" 
                                        Text='<%# Eval("NewsTitle") %>' Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Font-Size="14pt" 
                                        Text='<%# Eval("NewsDetails") %>' Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                        CellPadding="4" DataKeyNames="AttachID,AttachLink,AttachDate" 
                                        DataSourceID="SqlDataSource67" ForeColor="#333333" GridLines="None" 
                                        >
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            
                                             
                                                <asp:TemplateField HeaderText="<%$ Resources:Resource1,Attachments%>">
                        <ItemTemplate>
                            <img src ="Images/StylesImage/globe_down.png"/>
                            <asp:HyperLink ID="HyperLink1" runat="server" 
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
                                        
                                         
                                        SelectCommand="SELECT AttachmentID AS AttachID, AttachmentPath AS AttachLink, AttachmentDateIN AS AttachDate FROM Attachments WHERE (AttachmentID = @AttachID) AND (AttachmentTypeID = 2)">
                                   
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Label8" Name="AttachID" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    __________________</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Image ID="Image2" runat="server" Height="50px" 
                                        ImageUrl='<%# Eval("AccountImage") %>' Width="50px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("FullName") %>' 
                                        Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                        </table>
 
                        <br />
                        </div>
                            </div>
                    </ItemTemplate>
                </asp:DataList>
               
                        </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="LastNews" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="adminID" SessionField="adminID" />
                        <asp:Parameter DefaultValue="1" Name="start" Type="Int32" />
                        <asp:Parameter DefaultValue="10" Name="end" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                 <ul class="pager">
                     
  <li><a  ><asp:Button ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" /></a></li>
  <li><a  ><asp:Button ID="Button2" runat="server" Text="Previous" OnClick="Button2_Click" Visible="False" /></a></li>
</ul>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:HiddenField ID="HFMax" runat="server" />
                <asp:HiddenField ID="HFIndex" runat="server" Value="10" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

         
   </div>
</asp:Content>