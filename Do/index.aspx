<%@ Page Title="" Language="C#" MasterPageFile="~/Do/MasterPage2.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>首页</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row-fluid">
     <div class="span8 grider">
         <div class="widget widget-simple">
           <div class="widget-header">
             <h4><i class="fontello-icon-user"></i> 正在值班：<small><%=DateTime.Now %></small></h4>
           </div>
           <div class="widget-content">
             <div class="widget-body">
                <div id="accounForm" class="form-horizontal" >
                  <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger  ControlID="DropDownList1"/>
                        </Triggers>
                        <ContentTemplate>
                            
                   <div class="row-fluid">
                      <div class="span12">
                         <div class="control-group no-margin-bootom">
                           <label class="control-label label-left"> <img src="assets/img/demo/demo-avatar9604.jpg" class="thumbnail" width="80" height="80"></label>
                              <div class="controls">
                                <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <address style="float:left; margin-right:10%">
                                    <h5>工号:<%#Eval("WID")%>&nbsp 姓名:<%#Eval("Name")%></h5>
                                      <strong>职位:<%#Eval("PowerName")%></strong><%--<abbr title="工资详细" style="float:right">账户:<span class=" fontello-icon-credit-card-2"></span></abbr>--%></strong><br>
                                     <strong>QQ:</strong><%#Eval("QQ")%><strong><%--<h5 style="float:right">*** </h5>--%><br>
                                     <strong>Tel:</strong><%#Eval("Tel")%></address>
                                         </ItemTemplate>
                                      </asp:Repeater>
                                      <%--控制员工以上级别才能显示--%>
                                      <span class="widget-tool" runat="server" id="gowork">
                                        
                                      <input id="accountEmail" class="span3" type="text" name="accountEmail" value=""  placeholder="换班接手金额">
                                      <input id="accountEmai5" class="span4" type="text" name="accountEmail" value=""  placeholder="上班工作是否完成/评价">
                                      <a class="btn btn-green btn-small btn-glyph" href="javascript:void(0);">签到</a>
                                      </span>
                                    
                                 &nbsp;&nbsp;</div>
                             </div>
                          </div> 
                     </div>  
                    
                  <%-- 正在值班才显示--%>
                   <div class="row-fluid"  runat="server" id="onwork">
                      <div class="span12">
                          <fieldset>
                             <ul class="form-list label-left list-bordered dotted">
                             <li class="control-group">
                              <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="Time" 
                                   DataValueField="TimeID"  class="selectpicker inp input-small"   AutoPostBack="true">
                                  </asp:DropDownList>
                                  <asp:TextBox ID="TextBox1" class="span2" runat="server"  placeholder="当班收入"></asp:TextBox>
                                  <asp:TextBox ID="TextBox2" class="span2" runat="server"  placeholder="当班支出"></asp:TextBox>
                                  <asp:TextBox ID="TextBox3" class="span2" runat="server"  placeholder="长短款"></asp:TextBox>
                                  <asp:TextBox ID="TextBox4" class="span2" runat="server"  placeholder="签退剩余金额"></asp:TextBox>
                                  <asp:TextBox ID="TextBox5" class="span2" runat="server"  placeholder="留言下一班"></asp:TextBox>
                                <asp:LinkButton ID="LinkButton6" runat="server" class=" btn btn-green btn-small btn-glyph" >签退</asp:LinkButton>
                              </li>
                           </ul>
                           </fieldset>
                       </div> 
                     </div>  
                    </ContentTemplate>
                   </asp:UpdatePanel>
                 </div>
              </div>   
           </div>
        </div>        
    </div>

        
              
     <div class="span4 grider">
       <div class="widget widget-simple widget-notes">
         <div class="widget-header">
            <h4><i class="fontello-icon-list-alt"></i>最新公告 </h4>
        </div>
         <div class="widget-content">
           <div class="widget-body">
            <ol class="widget-list list-dotted">
              <li class="media"> <span class="pull-left"><span class="item-icon fontello-icon-pin-1"></span></span>
               <div class="media-body"> <span class="date">10:30 AM</span> <span class="quick-menu-icon pull-right"> <a class="edit fontello-icon-edit"></a> <a class="state fontello-icon-archive"></a> <a class="state fontello-icon-trash-1"></a> </span>
               <p class="note">请所有人到个人资料去修改自己的个人信息。</p>
               </div>
             </li>
          </ol>
           </div>
        </div>
         <div class="widget-header">
           <div class="widget-tool"><a class="btn btn-green btn-small btn-glyph" href="javascript:void(0);">知道了</a></div>
        </div>
         <div class="widget-content">
           <div class="widget-body">
             <h4><i class="fontello-icon-edit"></i> 发布公告</h4>
              <div id="formNotes" class="form-dark">
                 <fieldset>
                    <label for="accountTaxVat" class="control-label"> 标题</label>
                    <input id="accountTaxVat" class="input-block-level" type="text">
                    <label for="accountNotes">内容:</label>
                    <textarea id="accountNotes" class="input-block-level" rows="4"></textarea>
                </fieldset>
                <button class="btn btn-yellow btn-block">发布</button>
              </div>
           </div>
         </div>
       </div>
     </div><%--公告--%>
  </div> 
            
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <%-- <script src="assets/js/demo/demo-dashboard1.js" type="text/javascript"></script>
    <script src="assets/js/demo/demo-form.js"></script> 
    <script src="assets/js/demo/demo-wisyhtml5.js"></script>--%><%--与search功能发生了冲突--%>

    <%--table 应聘展示筛选--%>
      <script src="assets/js/demo/demo-jquery.dataTables.js"></script>
    <script src="assets/plugins/pl-table/datatables/media/js/jquery.dataTables.js"></script> 
<script src="assets/plugins/pl-table/datatables/plugin/jquery.dataTables.plugins.js"></script> 
<script src="assets/plugins/pl-table/datatables/plugin/jquery.dataTables.columnFilter.js"></script> 
    <%--table 应聘展示筛选end--%>
</asp:Content>
