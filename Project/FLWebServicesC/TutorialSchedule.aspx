<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="TutorialSchedule.aspx.cs" Inherits="FLWebServicesC.TutorialSchedule" %>
<%@ MasterType VirtualPath="~/Dashboard.master" %>  
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
           <h2> <p>  مواعيد الدروس الخاصة بلدورة</p> </h2> 
 
        <table class="nav-justified"   >
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td >
                <asp:GridView ID="GridView1" runat="server" EmptyDataText='<%$ Resources:Resource1,emptyt%>'  BackColor="White" BorderColor="#CCCCCC" Font-Size="Large" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="TutorialScheduleID">
                    <Columns>
                      
                        <asp:BoundField DataField="DateStart" HeaderText=  '<%$ Resources:Resource1,DateStart%>' SortExpression="DateStart" />
                         <asp:BoundField DataField="LectureTime" HeaderText=  '<%$ Resources:Resource1,Hours%>' SortExpression="LectureTime" />
                         <asp:BoundField DataField="TutorialTypeName" HeaderText=  '<%$ Resources:Resource1,Typeclass%>' SortExpression="TutorialTypeName" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT TutorialID, DateStart, TutorialScheduleID, LectureTime, TutorialTypeID, TutorialTypeName FROM TutorialScheduleView WHERE (TutorialID = @TutorialID) AND (DateStart &gt;= GETDATE()) ORDER BY DateStart">
                    <SelectParameters>
                        <asp:Parameter Name="TutorialID" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
  
     
         </div>
</asp:Content>
