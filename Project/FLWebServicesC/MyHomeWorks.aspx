<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="MyHomeWorks.aspx.cs" Inherits="FLWebServicesC.MyHomeWorks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ClientsMainContent" runat="server">
    <br />
 <style>
     .Div1{
    width:400px;
    margin-left:auto;
    margin-right:auto;
}
 </style>
    <div  class="Div1" >
           <h3> <p> قائمة بالوجبات التي تخص الدرس</p> </h3> 
 
        <table class="nav-justified"  >
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td >
                <asp:GridView ID="GridView1" runat="server" EmptyDataText='<%$ Resources:Resource1,emptyh%>' BackColor="White" BorderColor="#CCCCCC" Font-Size="Large" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Row" HeaderText='<%$ Resources:Resource1,Row%>'   ReadOnly="True" SortExpression="Row" HeaderStyle-HorizontalAlign="Center" />
                        <asp:TemplateField  HeaderText='<%$ Resources:Resource1,Title%>'  HeaderStyle-HorizontalAlign="Center" SortExpression="HomeWorkTitle">
                            
                            <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1"  Width="250px" runat="server" PostBackUrl='<%# "MyHomeWorksdetails.aspx?id=" + Eval("HomeWorkUID") %>' Text='<%# Eval("HomeWorkTitle") %>'></asp:LinkButton>
                            </ItemTemplate>


                        </asp:TemplateField>
                        <asp:TemplateField HeaderText= '<%$ Resources:Resource1,DeadLine%>' HeaderStyle-HorizontalAlign="Center" SortExpression="DeadLineDate">
                           
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Width="180px" Text='<%# Bind("DeadLineDate","{0:MM/dd/yyyy hh:mm tt}") %>'></asp:Label>
                                <asp:Label ID="Label5" runat="server"  Text='<%#   Bind("statusu")     %>' ForeColor="#FF0066"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-HorizontalAlign="Center" HeaderText=  '<%$ Resources:Resource1,Grade1%>'  >
                             
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
    <asp:Label ID="Label3" runat="server"   Text='<%#   Bind("Grade")     %>'></asp:Label>
                                        </td>
                                         <td>
/
                                        </td>
                                         <td>
    <asp:Label ID="Label1" runat="server" Text='<%#    Bind("GradeGet")   %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText= '<%$ Resources:Resource1,Submits%>'  HeaderStyle-HorizontalAlign="Center" SortExpression="Submits">
                            
                             <ItemTemplate>
                                 <asp:Label ID="Label4" runat="server" Width="50" Text='<%# Bind("Submits") %>' Font-Bold="True" ForeColor="#FF0066"></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"   />
                    <PagerStyle BackColor="White" ForeColor="#000066" />
                    <RowStyle ForeColor="#000066" HorizontalAlign="Center"  />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>

            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="GetHomeWork" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="StudentID" SessionField="adminID" />
                        <asp:Parameter Name="TutorialID" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
  
     
         </div>
</asp:Content>
