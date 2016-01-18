<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="StudentAttendance.aspx.cs" Inherits="FLWebServicesC.StudentAttendance" %>
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
           <h2> <p> قائمة الحضور الخاص بهذه الدورة</p></h2> 
 
        <table class="nav-justified"   >
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td >
                <asp:GridView ID="GridView1" runat="server" EmptyDataText=  '<%$ Resources:Resource1,emptya%>' BackColor="White" BorderColor="#CCCCCC" Font-Size="Large" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="DateStart" HeaderText= '<%$ Resources:Resource1,DateClass%>' SortExpression="DateStart"  />
                        <asp:BoundField DataField="StatusaAttendance" HeaderText='<%$ Resources:Resource1,Attendance%>' ReadOnly="True" SortExpression="StatusaAttendance" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Center" />
                    <RowStyle ForeColor="#000066" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="StudentAttendnce" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="TutorialID" />
                        <asp:SessionParameter DefaultValue="" Name="StudentID" SessionField="adminID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
  
     
         </div>
</asp:Content>
