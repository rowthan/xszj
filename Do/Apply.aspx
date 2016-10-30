<%@ Page Title="" Language="C#" MasterPageFile="~/Do/MasterPage2.master" AutoEventWireup="true" CodeFile="apply.aspx.cs" Inherits="Do_Apply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>应聘</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section>
        <div class="page-header">
          <%--  <p><code>.boo-table</code> along with styles bootstrap and use te the great DataTable </p>--%>
        </div>
        <div class="row-fluid">
                        <div class="span12">
                            <table id="exampleDT" class="table table-striped table-hover">
                                    <caption>
                               报名名单如下 <span>已截止报名</span>
                                </caption>
                                 <thead>
                                    <tr>
                                        <th scope="col">姓名 <span class="column-sorter"></span></th>
                                        <th scope="col">电话 <span class="column-sorter"></span></th>
                                         <th scope="col">专业 <span class="column-sorter"></span></th>
                                        <th scope="col">性别年龄 <span class="column-sorter"></span></th>
                                        <th scope="col">应聘职位 <span class="column-sorter"></span></th> 
                                        <th scope="col">获知途径 <span class="column-sorter"></span></th>
                                         <th scope="col">目的 <span class="column-sorter"></span></th>
                                         <th scope="col">带来<span class="column-sorter"></span></th>
                                        <th scope="col">期待薪水<span class="column-sorter"></span></th>
                                        <th scope="col">确定<span class="column-sorter"></span></th>
                                        <th scope="col">建议<span class="column-sorter"></span></th>
                                        <th scope="col">其他<span class="column-sorter"></span></th>
                                        <th scope="col">状态<span class="column-sorter"></span></th>
                                         <th scope="col">处理<span class="column-sorter"></span></th>
                                    </tr>
                                </thead>
                                  <tbody>
                                <asp:Repeater ID="Repeater2" runat="server"  OnItemCommand="Repeater2_ItemCommand">
                                      <HeaderTemplate>                      
                                     </HeaderTemplate>                  
                           <FooterTemplate>
                           </FooterTemplate>
                               <ItemTemplate> 
                                                                               
                                    <tr>
                                        <td><%#Eval("Name") %></td>
                                        <td><%#Eval("Tel") %></td>
                                        <td><%#Eval("Major") %></td>
                                          <td><%#Eval("GenderAge") %></td>             
                                        <td><%#Eval("Position") %></td>                          
                                           <td><%#Eval("Way") %></td>                                            
                                         <td><%#Eval("Forwhat") %></td>
                                           <td><%#Eval("Bring") %></td>
                                        <td><%#Eval("Salary") %></td>
                                         <td><%#Eval("Sure") %></td>
                                          <td><%#Eval("Advise") %></td>
                                          <td><%#Eval("ElseThing") %></td>
                                        <td><%#Eval("State") %></td>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>' Visible="false"></asp:Label>
                                       
                                        <td>
                                          <span class="btn-group">     
                                            <asp:Button ID="Button1"  runat="server" Text='面试他' class="btn btn-mini btn-success"
                                                    CommandName="apply" CommandArgument=<%#Eval("Name")%>  OnClick="Button1_Click1"/>
                                            </span>
                                       </td>
                                    </tr>                                                                 
                             </ItemTemplate>          
                                  </asp:Repeater>
                                    </tbody>  
                            </table>
                        </div>
                    </div>
    </section>   
    <section>
       <div class="row-fluid">
         <div class="span8 margin-00">
            <div class="well well-nice">
                                <h4 class="simple-header">面试他<small><span class="input-prepend"> <span class="add-on">@</span>
                                      
                                    <asp:TextBox ID="name" runat="server" class="span5" size="16" placeholder="Username" ReadOnly="true"></asp:TextBox>
                                </span></small>
                                    <span class="input-append">
                                   
                                    <asp:TextBox ID="score" runat="server" class="span5" size="16" placeholder="给他一个分数" ></asp:TextBox>
                                     <span class="add-on">.00</span> </span>
                                </h4>
                
                                <div class="control-group">
                                <%--    <textarea id="advise1" class="input-block-level" style="height: 160px" placeholder="面试记录"></textarea>--%>
                                    <asp:TextBox ID="advise" runat="server"  class="input-block-level" style="height: 160px" placeholder="面试记录"></asp:TextBox>
                                    <!-- // fieldset Input -->
                                    <div class="btn-toolbar">
                                        <asp:Button ID="Button2" class="btn btn-green pull-right" runat="server" Text="提交意见" OnClick="Button2_Click" />
                                   </div>  
                                </div>
           </div>               
          </div>    
           
           
                 
         <div class="span4"  style="overflow-x: auto; overflow-y: auto; height:300px;">                      
           <ul>
                <asp:Repeater ID="Repeater1" runat="server">    
               <ItemTemplate>   
            <li><%#Eval("Person") %>认为-<%#Eval("ApplyName") %>-<%#Eval("Advise") %>-给了他<%#Eval("Score") %>分</li>  
                </ItemTemplate>  
        </asp:Repeater>                           
          </ul>               
         </div>
       </div>                 
  </section>

     <section>
        <div class="page-header">
          <%--  <p><code>.boo-table</code> along with styles bootstrap and use te the great DataTable </p>--%>
        </div>
        <div class="row-fluid">
                        <div class="span12">
                            <table id="exampleDTA" class="table table-striped table-hover">
                                    <caption>
                               已经面试： <span>名单如下</span>
                                </caption>
                                 <thead>
                                    <tr>
                                        <th scope="col">姓名 <span class="column-sorter"></span></th>
                                        <th scope="col">意见 <span class="column-sorter"></span></th>
                                         <th scope="col">分数 <span class="column-sorter"></span></th>
                                        <th scope="col">评分人 <span class="column-sorter"></span></th>
                                        <th scope="col">时间 <span class="column-sorter"></span></th> 
                                   </tr>
                                </thead>
                                  <tbody>
                                <asp:Repeater ID="Repeater3" runat="server">
                                      <HeaderTemplate>                      
                                     </HeaderTemplate>                  
                           <FooterTemplate>
                           </FooterTemplate>
                               <ItemTemplate> 
                                                                               
                                    <tr>
                                        <td><%#Eval("ApplyName") %></td>
                                        <td><%#Eval("Advise") %></td>
                                        <td><%#Eval("Score") %></td>
                                          <td><%#Eval("Person") %></td>             
                                        <td><%#Eval("Time","{0:D}") %></td>                          
                                     
                                    </tr>                                                                 
                             </ItemTemplate>          
                                  </asp:Repeater>
                                    </tbody>  
                            </table>
                        </div>
                    </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <script src="assets/js/demo/demo-jquery.dataTables.js"></script><%--不能注释--%>
    <script src="assets/plugins/pl-table/datatables/media/js/jquery.dataTables.js"></script> <%--不能注释--%>

</asp:Content>

