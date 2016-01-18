<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="Enrollnto.aspx.cs" Inherits="FLWebServicesC.Enrollnto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ClientsMainContent" runat="server">
     
    <style>
     .Div1{
    width:400px;
    margin-left:auto;
    margin-right:auto;
}
 </style>
    <div  class="Div1" >
           <h3> <p> الدورات المفتوحة . هل ترغب بالأنضمام لها</p> </h3> 
 
        <table class="nav-justified"  >
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td >
                <asp:GridView ID="GridView1" runat="server" EmptyDataText="لاتوجد دورات جديدة انت غير مسجل بها" BackColor="White" BorderColor="#CCCCCC" Font-Size="Large" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="TutorialID" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="اسم الدورة" SortExpression="TutorialName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TutorialName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("TutorialName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاريح البدء" SortExpression="DateStart">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DateStart") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("DateStart") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="الفترة" SortExpression="Time">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Time") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText= "تسجيل"  >
                            <ItemTemplate>
                                <asp:Button  ID="AddButton" runat="server"  
      CommandName="AddToCart"  Text="تسجيل" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT TutorialID, TutorialName, DateStart, Time FROM Tutorials WHERE (TutorialLink IS NULL) AND (TutorialID NOT IN (SELECT TutorialID FROM StudentTutorial WHERE (StudentID = @PersonID)))" 
                    InsertCommand="  insert into StudentTutorial (TutorialID,StudentID) values(@TutorialID,@StudentID)">
                    <InsertParameters>
                        <asp:Parameter Name="TutorialID" />
                        <asp:SessionParameter Name="StudentID" SessionField="adminID" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="PersonID" SessionField="adminID" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
  
     
         </div>
</asp:Content>
