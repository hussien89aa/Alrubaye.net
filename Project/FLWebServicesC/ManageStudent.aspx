<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeBehind="ManageStudent.aspx.cs" Inherits="FLWebServicesC.ManageStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ClientsMainContent" runat="server">
   
    <script>
     $(document).ready(function () {
         $(".nav-tabs a").click(function () {
             $(this).tab('show');
         });
     });
     // stop typing word after max number
     function isokmaxlength(e, val, maxlengt) {
         var charCode = (typeof e.which == "number") ? e.which : e.keyCode
         //  alert('hi');
         if (!(charCode == 44 || charCode == 46 || charCode == 0 || charCode == 8 || (val.value.length < maxlengt))) {
             return false;
         }
     }
</script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="container" dir="rtl">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <img src="Images/loading.gif" width="50" height="50" />
        </ProgressTemplate>
    </asp:UpdateProgress>
     <br />
  <ul class="nav nav-tabs">
    <li class="active"><a href="#home">Add HomeWork</a></li>
    <li><a href="#menu1">Activate accounts</a></li>
    <li><a href="#menu2">Attendance</a></li>
    <li><a href="#menu3">Home Works</a></li>
  </ul>
      <div class="tab-content" >
    <div id="home"   class="tab-pane fade in active"    >
       
    <div class="container"  >
  
  <div class="panel-group">
    

    <div class=" panel-primary class">
   

 <div>
    
    
    
        <asp:Literal ID="LiMassage" runat="server"></asp:Literal>
                             
  </div>
    
     

    
    <table class="TabelStyles" style="width: 100%; " dir="rtl">
           <tr>
                <td colspan="3" class="auto-style2"   >
              
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 116px;  ">
                    </td>
                <td style="width: 303px;"  >
                    <asp:Label ID="Label1info" runat="server" Text=" " ForeColor="Red" Font-Size="12pt"></asp:Label>
                
                    &nbsp;</td>
                <td class="auto-style1">
                </td>
           </tr>
            <tr>
                <td style="height: 40px;" class="text-left">
                    <asp:Label ID="LaAccounts" runat="server"   Text="<%$ Resources:Resource1,tutorialName %>" meta:resourcekey="LaStudentNameResource1" Font-Bold="True" Font-Size="12pt"></asp:Label>
                </td>
                <td style="width: 303px;"   class="text-right">
                    <asp:DropDownList ID="DDLAccounts" runat="server" class="form-control" data-toggle="dropdown" Width="306px"  DataSourceID="SDSAccounts" DataTextField="TutorialName" DataValueField="TutorialID" AutoPostBack="True" OnDataBound="DDLAccounts_DataBound" OnSelectedIndexChanged="DDLAccounts_SelectedIndexChanged"    >
                    </asp:DropDownList>
                </td>
                <td class="auto-style1" rowspan="8" style="vertical-align:top;width:410px">
                         <div class="row" >
    
   
  </div>
                  
                    &nbsp;<asp:SqlDataSource ID="SDSAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT * FROM [Tutorials]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="height: 40px;" class="text-left">
                    &nbsp;</td>
                <td style="width: 303px;"   class="text-right">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 40px;" class="text-left">
                      
                    &nbsp;</td>
                <td style="width: 303px;"   class="text-right">
                    
                         <div class="alert alert-info">
                      <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource1,tutorialinfo %>" Font-Bold="True" Font-Size="12pt"   ></asp:Label>
<br />
                        <asp:Label ID="Latutroalinfo" runat="server" Text="dteilas" ></asp:Label>
</div>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="height: 40px;" class="text-left">
                   <font color="red">*</font> <asp:Label ID="LaStudentName" runat="server" Text="<%$ Resources:Resource1,homeworktitile %>" Font-Bold="True" Font-Size="12pt"></asp:Label>
                </td>
                <td   style="width: 303px;" class="text-right">
                    <asp:TextBox ID="txtHomeWorkTitle" runat="server" MaxLength="50" class="form-control" Width="200px" onkeypress="return isokmaxlength(event,this,25);" placeholder="<%$ Resources:Resource1,required %>" ></asp:TextBox>
                </td>
           </tr>
           <tr>
               <td style="height: 40px;" class="text-left">
                    <asp:Label ID="LaStudentName10" runat="server"   Text="<%$ Resources:Resource1,homeworkdetails %>" Font-Bold="True" Font-Size="12pt"></asp:Label>
               </td>
               <td   style="width: 303px;" class="text-right">
                   <asp:TextBox ID="txtHomeWorkDetails" runat="server" MaxLength="25" class="form-control"  placeholder="<%$ Resources:Resource1,whatisyoursuggestion %>" onkeypress="return isokmaxlength(event,this,255);" Width="306px" Height="171px" TextMode="MultiLine"></asp:TextBox>
                </td>
           </tr>
           <tr>
               <td style="height: 40px;" class="text-left">
                    <asp:Label ID="LaStudentName12" runat="server"   Text="<%$ Resources:Resource1,DateDead %>" Font-Bold="True" Font-Size="12pt"></asp:Label>
               </td>
               <td   style="width: 303px;" class="text-right">
                    <asp:TextBox ID="txtDeadLineDate" runat="server" MaxLength="50" class="form-control" Width="200px" onkeypress="return isokmaxlength(event,this,25);" placeholder="<%$ Resources:Resource1,required %>" ></asp:TextBox>
                </td>
           </tr>
           <tr>
               <td style="height: 40px;" class="text-left">
                    <asp:Label ID="LaStudentName13" runat="server"   Text="<%$ Resources:Resource1,Grade %>" Font-Bold="True" Font-Size="12pt"></asp:Label>
               </td>
               <td   style="width: 303px;" class="text-right">
                    <asp:TextBox ID="txtGrade" runat="server" MaxLength="50" class="form-control" Width="200px" onkeypress="return isokmaxlength(event,this,25);" placeholder="<%$ Resources:Resource1,required %>" ></asp:TextBox>
                </td>
           </tr>
           <tr>
               <td style="height: 40px;" class="text-left">
                    <asp:Label ID="LaStudentName11" runat="server" Text="<%$ Resources:Resource1,selectFile %>" Font-Bold="True" Font-Size="12pt"></asp:Label>
               </td>
               <td   style="width: 303px;" class="text-right">
                   <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
           </tr>
           <tr>
                <td style="height: 40px;">&nbsp;</td>
               <td colspan="2">
                   &nbsp;</td>
           </tr>
           <tr>
               <td style="height: 40px;" class="text-right">
                   &nbsp;</td>
               <td   style="height: 40px;">
                    <asp:Button ID="BuAddData" runat="server"  class="btn btn-success"    onclick="BuAddData_Click" Text="<%$ Resources:Resource1,Record%>" Height="37px" Width="98px" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" />
                    </td>
               <td style="height: 40px;">&nbsp;</td>
           </tr>
            </table>
     
   
    <div>
     
        <table style="width: 100%">
            <tr>
                <td style="width: 115px">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                        &nbsp;</td>
            </tr>
        </table>
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

           <asp:Literal ID="LiMessage" Text="<strong>Success!</strong> Data is added successfully." runat="server"></asp:Literal>
              <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
</div>
     

  </div>
</div>



        </div>
      </div>
    </div>
 <div id="menu1"   class="tab-pane fade"      >
     <br />
     <br />
     <br />
     <table dir="rtl">
         <tr>
               
               
               <td  >
                   فعال</td>
               <td  width="300">
                   <asp:DropDownList ID="DDLIsActive" runat="server">
                       <asp:ListItem Value="1">نعم</asp:ListItem>
                       <asp:ListItem Value="0">لا</asp:ListItem>
                   </asp:DropDownList>
               </td>
               <td style="width: 10%">
                   &nbsp;</td>
           </tr>
         <tr>
               
               
               <td  >
                   <asp:Label ID="LaStudentName6" runat="server" 
                       meta:resourcekey="LaStudentNameResource1" 
                       Text="<%$ Resources:Resource1,StudentName %>"  ></asp:Label>
               </td>
               <td  width="300">
                   <asp:TextBox ID="txtStudentName" runat="server" MaxLength="250" 
                       meta:resourcekey="txtStudentNameResource1" 
                        style="text-align:right" 
                        Width="350px"></asp:TextBox>
               </td>
               <td style="width: 10%">
                   <asp:Button ID="BuSearch" runat="server" CssClass="ButtonSearch" Height="30px" 
                       meta:resourcekey="BuAddStudentResource1"   
                       Text="<%$ Resources:Resource1,Search%>"   />
               </td>
           </tr>
         <tr>
             <td colspan="3">
                  <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                     <ContentTemplate>

                    
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SDSSDegress2013" 
                        ForeColor="#333333" GridLines="None" Width="100%"  EmptyDataText=  "<%$ Resources:Resource1,NoDataMath %>" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand"  >
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            
                             <asp:TemplateField HeaderText="StudentID" SortExpression="ID">
                                 
                                 <ItemTemplate>
                                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="First Name" SortExpression="StudentFirstName">
                                 
                                 <ItemTemplate>
                                     <asp:Label ID="LaStudentFirstName" runat="server" Text='<%# Bind("StudentFirstName") %>'></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                          <%--  <asp:BoundField DataField="StudentLastName" HeaderText="Last Name" SortExpression="StudentLastName" />--%>
                             <asp:TemplateField HeaderText="Student Email" SortExpression="StudentEmail">
                               
                                 <ItemTemplate>
                                     <asp:Label ID="txtEmail" runat="server" Text='<%# Bind("StudentEmail") %>'></asp:Label>
                                 </ItemTemplate>
                             </asp:TemplateField>
                           <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" /> 
                         <%--   <asp:BoundField DataField="StudentComment" HeaderText="Student Comment" SortExpression="StudentComment" />--%>
                          
                             <asp:TemplateField HeaderText="Active">
                                <ItemTemplate>
                                    <asp:Label ID="Label2AcountType" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="OP">
                                <ItemTemplate>
                                    <asp:LinkButton ID="Button1OpeartionAcount" runat="server" 
                                        CommandName="ChangeStatus"
                                        Text="Active account">LinkButton</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
         </ContentTemplate>
                     <Triggers>
                         <asp:AsyncPostBackTrigger ControlID="BuSearch" EventName="Click" />
                     </Triggers>
                 </asp:UpdatePanel>
             </td>
         </tr>
     </table>
  <asp:SqlDataSource ID="SDSSDegress2013" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT StudentID,Password,StudentFirstName, StudentLastName, StudentEmail, DataRegister, StudentComment, IsActive FROM MyStudents 
where StudentFirstName + ' ' + StudentLastName  like  @name + '%'
and IsActive=@IsActive
ORDER BY DataRegister" OnSelecting="SDSSDegress2013_Selecting" 
      >
      <SelectParameters>
          <asp:ControlParameter ControlID="txtStudentName" DefaultValue="@" Name="name" PropertyName="Text" />
          <asp:ControlParameter ControlID="DDLIsActive" DefaultValue="" Name="IsActive" PropertyName="SelectedValue" />
      </SelectParameters>
       
                    </asp:SqlDataSource>
                    
 
 </div>
<div id="menu2"  class="tab-pane fade" >
     
  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
<ContentTemplate>
   
     <table class="nav-justified">
         <tr>
             <td style="width: 70px">select tutorila</td>
             <td style="height: 19px">
                 <asp:DropDownList ID="DDLTutorialID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="TutorialName" DataValueField="TutorialID">
                 </asp:DropDownList>
             </td>
             <td style="height: 19px">
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT * FROM [Tutorials]"></asp:SqlDataSource>
             </td>
         </tr>
         <tr>
             <td style="width: 60px">slect time</td>
             <td>
                 <asp:DropDownList ID="DDLTimeID" runat="server" DataSourceID="SqlDataSource3" DataTextField="DateStart" DataValueField="TutorialScheduleID" AutoPostBack="True" OnDataBound="DDLTimeID_DataBound">
                 </asp:DropDownList>
             </td>
             <td>
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT TutorialID, DateStart, TutorialScheduleID, LectureTime, TutorialTypeID FROM TutorialSchedule WHERE (TutorialID = @TutorialID) AND (TutorialTypeID = 1)">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="DDLTutorialID" Name="TutorialID" PropertyName="SelectedValue" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </td>
         </tr>
         <tr>
             <td colspan="3">
                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID" DataSourceID="SqlDataSource4">
                     <Columns>
                                                  <asp:TemplateField HeaderText="StudentID" SortExpression="StudentID">
                                                     
                                                      <ItemTemplate>
                                                          <asp:Label ID="LaPersonID" runat="server" Text='<%# Bind("StudentID") %>'></asp:Label>
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                         <asp:BoundField DataField="StudentFirstName" HeaderText="First Name" SortExpression="StudentFirstName" />
                         <asp:BoundField DataField="StudentLastName" HeaderText="Last Name" SortExpression="StudentLastName" />
                         <asp:BoundField DataField="StudentEmail" HeaderText="Student Email" SortExpression="StudentEmail" />
                       
                          <asp:TemplateField HeaderText="OP"  >
                              <ItemTemplate>
                                  <asp:DropDownList ID="DDLStatusID" runat="server" selectedvalue='<%#Bind("IsAttend") %>'>
                                       <asp:ListItem Value="True">Absent</asp:ListItem>
                                      <asp:ListItem Value="False">Attended</asp:ListItem>
                                     
                                  </asp:DropDownList>
                                   </ItemTemplate>
                              </asp:TemplateField>
                     </Columns>
                 </asp:GridView>
             </td>
         </tr>
         <tr>
             <td colspan="3">
                      <asp:Button ID="Button1" runat="server"  class="btn btn-success"  Width="100px" Height="38px" meta:resourcekey="BuAddStudentResource1"   Text='<%$ Resources:Resource1,save%>' OnClick="Button1_Click"   />
               
                 &nbsp;</td>
         </tr>
         <tr>
             <td colspan="3">
                 <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT   [StudentFirstName]
      ,[StudentLastName]
      ,[StudentEmail]
      ,[StudentID]
      ,[IsAttend]
  FROM  [StudentAttendenceRegisteration]
  where TutorialID=@TutorialID and [TutorialScheduleID]=@TutorialScheduleID">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="DDLTutorialID" Name="TutorialID" PropertyName="SelectedValue" />
                         <asp:ControlParameter ControlID="DDLTimeID" Name="TutorialScheduleID" PropertyName="SelectedValue" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </td>
         </tr>
     </table>

     </ContentTemplate>
      </asp:UpdatePanel>

    </div>

    <div id="menu3"        class="tab-pane fade" >
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
   
         <table class="nav-justified">
         <tr>
             <td style="width: 70px">select tutorila</td>
             <td style="height: 19px">
                 <asp:DropDownList ID="DDLTutroialIHomeWork" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="TutorialName" DataValueField="TutorialID">
                 </asp:DropDownList>
             </td>
             <td style="height: 19px">
                 &nbsp;</td>
         </tr>
         <tr>
             <td style="width: 60px">slect time</td>
             <td>
                 <asp:DropDownList ID="DDLHomeWorkID" runat="server" DataSourceID="SqlDataSource5" DataTextField="HomeWorkTitle" DataValueField="HomeWorkID" AutoPostBack="True" OnDataBound="DDLHomeWorkID_DataBound">
                 </asp:DropDownList>
             </td>
             <td>
                 <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT HomeWorkTitle, HomeWorkID FROM HomeWorks WHERE (TutorialID = @TutorialID)">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="DDLTutroialIHomeWork" Name="TutorialID" PropertyName="SelectedValue" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </td>
         </tr>
         <tr>
             <td colspan="3">
              
                 <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentID,SubmitHomeWorkID" DataSourceID="SqlDataSource6" OnRowCommand="GridView3_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                     <Columns>
                         
                         <asp:BoundField DataField="StudentFirstName" HeaderText="First Name" SortExpression="StudentFirstName" />
                       
                            <asp:TemplateField HeaderText="Student Email"  >
                                                      
                                                      <ItemTemplate>
                                                          <asp:Label ID="LaStudentEmail" runat="server" Text='<%# Bind("StudentEmail") %>' ></asp:Label>
                                                          </ItemTemplate>
                                                          </asp:TemplateField>
                         
                                   <asp:BoundField DataField="StudentNote" HeaderText="StudentNote" SortExpression="StudentNote" />                
                                                  
                                                   
                                                  <asp:TemplateField HeaderText="Attachment " SortExpression="AttachmentPath">
                                                      
                                                      <ItemTemplate> 
                                                          <%--PostBackUrl='<%# Bind("AttachmentPath") %>' --%>
                                                          <asp:LinkButton ID="LinkButton1"  PostBackUrl='<%# Bind("AttachmentPath") %>'   runat="server" Text='<%# Bind("AttachmentDateIN") %>'> </asp:LinkButton>
                                                          <asp:HiddenField ID="HFStudentID" runat="server" Value='<%# Bind("StudentID") %>' />
                                                           <asp:HiddenField ID="HFAttachmentPath" runat="server" Value='<%# Bind("AttachmentPath") %>' />
                                                          <asp:HiddenField ID="HFSubmitHomeWorkID" runat="server" Value='<%# Bind("SubmitHomeWorkID") %>' />
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                          <asp:TemplateField HeaderText="Grade"  >
                                                      
                                                      <ItemTemplate>
                                                          <asp:TextBox ID="txtGrade" runat="server" Text='<%# Bind("Grade") %>'></asp:TextBox>
                                                             <asp:TextBox ID="txtAdminComment" Height="100px" runat="server" Text='<%# Bind("AdminComment") %>' TextMode="MultiLine"></asp:TextBox>
                                                          <asp:Button ID="Button3" runat="server" Text="grade it"  CommandName="GradeIt" />
                                                      </ItemTemplate>
                                                  </asp:TemplateField>
                                                  
                     </Columns>
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                 </asp:GridView>
             </td>
         </tr>
         <tr>
             <td colspan="3">
               
                 &nbsp;</td>
         </tr>
         <tr>
             <td colspan="3">
                 <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SubMitHomeWork" SelectCommandType="StoredProcedure">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="DDLHomeWorkID" Name="SubmitHomeWorkID" PropertyName="SelectedValue" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </td>
         </tr>
     </table>
 </ContentTemplate>

                 </asp:UpdatePanel>
    </div>
         </div>



     </div>
</asp:Content>
