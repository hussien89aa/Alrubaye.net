<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Education.aspx.cs" Inherits="FLWebServicesC.Education" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <div class="container" dir="rtl" >
  
  <div class="panel-group">
    

    <div class=" panel-primary class">
      <div class="panel-heading" style="text-align:center ">    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="30" 
                       Text="<%$ Resources:Resource1,freeandstillfree %>"></asp:Label> </div>
      <div class="container"> 
          <br />
          <div class="row"  >
          <div  class="col-sm-9" style="max-width:1000px"> 
 <div>
    
    
    
        <asp:Literal ID="LiMassage" runat="server"></asp:Literal>
                             
  </div>
    
     

    
 <br />
                  <asp:Label ID="Label2w" runat="server" Font-Bold="True" Font-Size="14" 
                       Text="<%$ Resources:Resource1,formregiestaion %>"> </asp:Label>
              <br />
                    <asp:Label ID="Label1info" runat="server" Text=" " ForeColor="Red" Font-Size="12pt"></asp:Label>
                
                  <br />
                    <asp:Label ID="LaAccounts" runat="server"   Text="<%$ Resources:Resource1,tutorialName %>" meta:resourcekey="LaStudentNameResource1" Font-Bold="True" Font-Size="12pt"></asp:Label>
                
                <br />
                 
                    <asp:DropDownList ID="DDLAccounts" runat="server" class="form-control" data-toggle="dropdown" Width="100%"  DataSourceID="SDSAccounts" DataTextField="TutorialName" DataValueField="TutorialID" AutoPostBack="True" OnSelectedIndexChanged="DDLAccounts_SelectedIndexChanged" OnDataBound="DDLAccounts_DataBound"    >
                    </asp:DropDownList>
                         
               <br />
                    <asp:SqlDataSource ID="SDSAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT * FROM [Tutorials] order by DateIn DESC">
                    </asp:SqlDataSource>
            <br />
                         <div class="alert alert-info">
                      <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource1,tutorialinfo %>" Font-Bold="True" Font-Size="12pt"   ></asp:Label>
<br />
                        <asp:Label ID="Latutroalinfo" runat="server" Text="dteilas" ></asp:Label>
</div>
             <br />
                    <asp:Label ID="LaStudentName" runat="server" Text="<%$ Resources:Resource1,firstname %>" Font-Bold="True" Font-Size="12pt"></asp:Label>
          <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server"
                       ControlToValidate="txtFirstName" ErrorMessage="<%$ Resources:Resource1,olychar %>"
                       ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"  ></asp:RegularExpressionValidator>
                   
                    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="25" class="form-control" Width="100%" onkeypress="return isokmaxlength(event,this,25);" placeholder="<%$ Resources:Resource1,required %>" ></asp:TextBox>
               <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First name is required field" ForeColor="#FF0066" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
             <br />
                    <asp:Label ID="LaStudentName15" runat="server"  Text="<%$ Resources:Resource1,lastName %>" Font-Bold="True" Font-Size="12pt"></asp:Label>
           <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server"
                       ControlToValidate="txtMiddleName" ErrorMessage="<%$ Resources:Resource1,olychar %>"
                       ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"  ></asp:RegularExpressionValidator>
                   
                    <asp:TextBox ID="txtMiddleName" runat="server" MaxLength="25" onkeypress="return isokmaxlength(event,this,25);" placeholder="<%$ Resources:Resource1,required %>" 
                      class="form-control" Width="100%" ></asp:TextBox>
               <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtMiddleName" ErrorMessage="last name is required field" ForeColor="#FF0066" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
            <br />
                    <asp:Label ID="LaStudentName9" runat="server"  Text="<%$ Resources:Resource1,emailAddress %>" Font-Bold="True" Font-Size="12pt"></asp:Label>
        <br />
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" MaxLength="50"  placeholder="<%$ Resources:Resource1,required %>" onkeypress="return isokmaxlength(event,this,50);"  meta:resourcekey="txtStudentNameResource1" Width="100%"></asp:TextBox>
             <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email isnot vaild" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEmail" ErrorMessage=" Email is required field" ForeColor="#FF0066" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
           <br />
                    <asp:Label ID="LaStudentName16" runat="server"   Text="<%$ Resources:Resource1,skypeID%>" Font-Bold="True" Font-Size="12pt"></asp:Label>
                <br />
                    <asp:TextBox ID="txtSkypeID" runat="server" class="form-control" MaxLength="50"  placeholder="<%$ Resources:Resource1,optional %>" onkeypress="return isokmaxlength(event,this,30);"  meta:resourcekey="txtStudentNameResource1" Width="100%"></asp:TextBox>
            <br />
                    &nbsp;&nbsp;     <asp:Label ID="LaStudentName10" runat="server"   Text="<%$ Resources:Resource1,notes %>" Font-Bold="True" Font-Size="12pt"></asp:Label>
          <br />
                   
                    <asp:TextBox ID="txtState" runat="server" MaxLength="25" class="form-control"  placeholder="<%$ Resources:Resource1,whatisyoursuggestion %>" onkeypress="return isokmaxlength(event,this,255);" Height="171px" TextMode="MultiLine"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                       ControlToValidate="txtState" ErrorMessage="<%$ Resources:Resource1,olychar %>"
                       ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"  > </asp:RegularExpressionValidator>
                   
              <br />
<div>
     <p class="MsoNormal" dir="RTL">
        <span lang="AR-IQ"><strong>شروط التسجيل</strong></span></p>
    <p class="MsoListParagraphCxSpMiddle" dir="RTL" style="text-indent:-.25in;
mso-list:l0 level1 lfo1">
        <![if !supportLists]><span>1-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><strong><![endif]></strong><span lang="AR-IQ"><strong>لا يحق للطالب نشر المحادثة المباشرة مع المشرف على اليوتيوب</strong></span><span dir="LTR"><o:p></o:p></span></p>
    <p class="MsoListParagraphCxSpMiddle" dir="RTL" style="text-indent:-.25in;
mso-list:l0 level1 lfo1">
        <strong>
        <![if !supportLists]></strong><span><strong>2-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong> </span><strong><![endif]>الدورة سوف تنشر كل درس بموعده على اليوتيوب وسيتم بعدها مناقشة الدرس مع الطلاب على سكايب</strong></p>
    <p class="MsoListParagraphCxSpMiddle" dir="RTL" style="text-indent:-.25in;
mso-list:l0 level1 lfo1">
        <strong>
        <![if !supportLists]></strong><span><strong>3-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong> </span><strong><![endif]></strong><span lang="AR-IQ"><strong>على الطالب التأكد من البريد الخاص به </strong> <span><strong>&nbsp;</strong></span><strong>بشكل يومي وهو مسؤول</strong><span><strong>&nbsp; </strong> </span><strong>عن اي تاخر في الاجابه على الأسئله ولايقبل اي واجب بعد مرور الوقت المحدد.</strong></span><span dir="LTR"><o:p></o:p></span></p>
    <p class="MsoListParagraphCxSpLast" dir="RTL">
        <strong>الضغط على سجل الان معناه موافقتك على شروط التسجيل</strong></p>
</div>


              <br />
                    <asp:Button ID="BuAddData" runat="server"  class="btn btn-success"    onclick="BuAddData_Click" Text="<%$ Resources:Resource1,Record%>" Height="37px" Width="98px" />
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" />
           <br />
              </div>
   
              <div  class="col-sm-3" >
                  <br />
                  <br />
                              <div class="col-sm-6" style="background-color:lavenderblush;width:200px;">

       <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource1,friendsComment %>" Font-Bold="True" Font-Size="14pt" ></asp:Label>
                       <br />
                       <asp:DataList ID="DataList1" runat="server" DataKeyField="StudentID" DataSourceID="SqlDataSource1" Width="100%">
                            <ItemTemplate>
                                <table class="nav-justified">
                                    <tr>
                                        <td>
                                            <asp:Label ID="StudentFirstNameLabel" runat="server" Text='<%# Eval("StudentFirstName") %>' CssClass="auto-style3" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="StudentCommentLabel" runat="server" Text='<%# Eval("StudentComment") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="DataRegisterLabel" runat="server" Text='<%# Eval("DataRegister") %>' CssClass="auto-style4" />
                                        </td>
                                    </tr>
                                </table>
                                 <br />
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FLCS %>" SelectCommand="SELECT  top 5 [StudentID]
      ,[StudentFirstName]
     
      ,[StudentComment]
      ,[DataRegister]
       
 
  FROM  [MyStudents]
  where [TutorialID]=@TutorialID and len(rtrim([StudentComment]))&gt;0
  order by [DataRegister] desc" OnSelecting="SqlDataSource1_Selecting">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DDLAccounts" Name="TutorialID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
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

           <asp:Literal ID="LiMessage" Text="<strong>Success!</strong> Data is added successfully." runat="server"></asp:Literal>
              <a href="#" class="close" data-dismiss="modal" aria-label="close">&times;</a>
</div>
     

  </div>
</div>

  
    </div>
 
     
   
</div>
        </div>
</asp:Content>
