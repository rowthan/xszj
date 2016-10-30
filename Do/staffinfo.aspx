<%@ Page Title="" Language="C#" MasterPageFile="~/Do/MasterPage2.master" AutoEventWireup="true" CodeFile="staffinfo.aspx.cs" Inherits="Do_staffinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <title>staffinfo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row-fluid page-head">
          <h2 class="page-title"><i class="aweso-icon-list-alt"></i> 信息查看<small>员工、会员</small></h2>                                         
          <p><code>注意</code> 请管理员及时更新员工最新数据，也请员工各自及时修改自己信息。 </p>
                <div class="page-bar">
                    <div class="btn-toolbar">
                        <ul class="nav nav-tabs pull-right">
                            <li > <a href="userinfo.aspx" >个人信息</a> </li>
                            <li class="active"> <a href="staffinfo.aspx">员工信息</a> </li>
                            <li> <a href="member.aspx">会员信息</a> </li>
                        </ul>
                    </div>
                </div>
            </div>
    <section>
        <div class="page-header">
        </div>
                    <div class="row-fluid">
                        <div class="span12">
                            <table id="exampleDT" class="table table-striped table-hover">
                                 <thead>
                                    <tr>
                                        <th scope="col">工号 <span class="column-sorter"></span></th>
                                        <th scope="col">姓名 <span class="column-sorter"></span></th>
                                         <th scope="col">性别 <span class="column-sorter"></span></th>
                                        <th scope="col">生日 <span class="column-sorter"></span></th>
                                        <th scope="col">学号 <span class="column-sorter"></span></th>     
                                        <th scope="col">电话 <span class="column-sorter"></span></th>
                                         <th scope="col">QQ <span class="column-sorter"></span></th>
                                         <th scope="col">专业<span class="column-sorter"></span></th>
                                        <th scope="col">住址<span class="column-sorter"></span></th>
                                        <th scope="col">职位<span class="column-sorter"></span></th>
                                        <th scope="col">工作状态<span class="column-sorter"></span></th>
                                        <th scope="col">上次登录<span class="column-sorter"></span></th>
                                    </tr>
                                </thead>
                                  <tbody>
                                <asp:Repeater ID="Repeater" runat="server" >
                                      <HeaderTemplate>                      
                                     </HeaderTemplate>                  
                           <FooterTemplate>
                           </FooterTemplate>
                               <ItemTemplate>                                              
                                    <tr>
                                        <td><%#Eval("WID") %></td>
                                        <td><a href="javascript:;" onClick="edit_staff('100%', '100%', '编辑用户', 'login1.aspx')">
                                            <%#Eval("Name") %></a>
                                        </td>
                                        <td><%#Eval("Gender") %></td>
                                          <td><%#Eval("Birth") %></td>
                                       <% if (Convert.ToInt32(Session["power"])==4){%>
                                        <td><%#Eval("SID") %></td>
                                        <%}else { %>  
                                           <td>*</td>
                                        <%} %>                           
                                         <td><%#Eval("Tel") %></td>
                                           <td><%#Eval("QQ") %></td>
                                        <td><%#Eval("Major") %></td>
                                         <td><%#Eval("Address") %></td>
                                          <td><%#Eval("PowerName") %></td>
                                          <td><%#Eval("StateName") %></td>
                                        <td><%#Eval("LastLogin") %></td>
                                    </tr>                                                                 
                             </ItemTemplate>          
                                  </asp:Repeater>
                                       </tbody>  
                            </table>
                        </div>
                    </div>
                    <!-- // Example row --> 
                       
                </section>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script src="assets/js/demo/demo-jquery.dataTables.js"></script>
    <script src="assets/plugins/pl-table/datatables/media/js/jquery.dataTables.js"></script> 
<script src="assets/plugins/pl-table/datatables/plugin/jquery.dataTables.plugins.js"></script> 
<script src="assets/plugins/pl-table/datatables/plugin/jquery.dataTables.columnFilter.js"></script> 

<script src="assets/plugins/layer/layer.js"></script> 
<script src="assets/js/admin.js"></script> 
</asp:Content>

