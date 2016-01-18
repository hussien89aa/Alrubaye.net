<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BlogSpot.aspx.cs" Inherits="FLWebServicesC.BlogSpot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 488px;
            height: 640px;
        }
        .auto-style2 {
            width: 533px;
            height: 636px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3> <a href="http://hussienahmmed.blogspot.com/">My Blog </a></h3>
    <p> This blog have all the books that i have written and all text tutorial that iposton different websites</p>
    <h4> List of my books</h4>
    <div class="panel panel-info">
      <div class="panel-heading">كتاب خطوة بخطوة نحو قاعدة بيانات ترضي العميل (vb.net,ADO.net,Access)</div>
      <div class="panel-body"> 

          
          <img alt="database" longdesc="textt" src="Images/bookcover.jpg" /></div>
        <h3><a href="http://hussienahmmed.blogspot.com/p/vbnetadonetaccess_30.html">Download</a></h3>
    </div>
     <div class="panel panel-info">
      <div class="panel-heading">كتاب بروتوكولات الشبكات TCP,UDP,IP وبناء التطبيقات بالبروتوكول الملائم </div>
      <div class="panel-body"> 
           <img alt="tet" class="auto-style1" longdesc="keke" src="Images/networkbookcover.jpg" /></div>
        <h3><a href="http://hussienahmmed.blogspot.com/p/tcpudpip-vbnet.html">Download</a></h3>
     
    </div>
     <div class="panel panel-info">
      <div class="panel-heading">كتاب خطوة بخطوة لتعلم ( c++,c ) ومرفقاته </div>
       <div class="panel-body"> 
           <img alt="cplus" class="auto-style2" longdesc="covers" src="Images/cpluscover.jpg" /></div>
        <h3><a href="http://hussienahmmed.blogspot.com/p/cc.html">Download</a></h3>
      </div>
  
     <div class="panel panel-info">
      <div class="panel-heading">كتاب التحكم عبر الحاسوب بالأجهزة الخارجية بلغة VB.NET </div>
      <div class="panel-body"> 
          <img src="Images/portalbookcover.jpg" />  </div>
        <h3><a href="http://hussienahmmed.blogspot.com/2013/04/vbnet_6.html">Download</a></h3>
      </div>
    
</asp:Content>
