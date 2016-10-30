<%@ Page Title="" Language="C#" MasterPageFile="~/Do/MasterPage2.master" AutoEventWireup="true" CodeFile="widget.aspx.cs" Inherits="Do_widget" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>账户</title>
     <style type="text/css"> 　　
     
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section>
       <div class="page-header">                  
         <a id="btnChangeWrapper1" class="btn _btn-large btn-green" href="javascript:void(0);"> <i class="fontello-icon-arrows-cw"></i> 个人工资情况</a>
         <a id="btnChangeWrapper3" class="btn _btn-large btn-green" href="http://202.203.40.251:8080/sfms/main.action" target="_blank"> 去云大财务在线查看</a>
      </div>
        <div class="row-fluid">
          <div class="span12">
          <table id="exampleDTA" class="table table-striped table-hover">
           <caption>
          你的工资发放如下
            </caption>
            <thead>
             <tr>
               <th scope="col">工资号 <span class="column-sorter"></span></th>
               <th scope="col">年份 <span class="column-sorter"></span></th>
           <th scope="col">月份 <span class="column-sorter"></span></th>
           <th scope="col">类别 <span class="column-sorter"></span></th>
           <th scope="col">金额 <span class="column-sorter"></span></th>
           <th scope="col">发放状态 <span class="column-sorter"></span></th>
           <th scope="col">发放途径 <span class="column-sorter"></span></th>
           <th scope="col">最新处理 <span class="column-sorter"></span></th>
           <th scope="col">确收时间 <span class="column-sorter"></span></th>
           <th scope="col">备注 <span class="column-sorter"></span></th> 
           <th scope="col">处理 <span class="column-sorter"></span></th>

           </tr>
            </thead>
              <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                 <ContentTemplate>
            <tbody>
             <asp:Repeater ID="Repeater2" runat="server" onitemcommand="Repeater2_ItemCommand" >
               <HeaderTemplate>                      
               </HeaderTemplate>                  
               <FooterTemplate>
               </FooterTemplate>
                <ItemTemplate> 
               <tr>
                 <td><%#Eval("SalaID") %></td>
                 <td><%#Eval("Year") %></td>
                 <td><%#Eval("Month") %></td>
                 <td><%#Eval("SalaryTypeName") %></td>  
                 <td><%#Eval("Money") %></td>
                 <td><%#Eval("StateName") %></td> 
                 <td><%#Eval("SendWay") %></td>             
                 <td><%#Eval("SendTime","{0:D}") %></td>                          
                 <td><%#Eval("GetTime","{0:D}") %></td>
                 <td><%#Eval("Remark") %></td>
                <td>
                  
                     
                  <div class="quick-menu">
                     <div class="btn-group">
                        <asp:Button ID="Button4"  runat="server" Text='确认收到' class="btn btn-mini btn-success" CommandName="get" CommandArgument=<%#Eval("SalaID")%> />
                           <a data-toggle="dropdown" class="btn btn-mini dropdown-toggle"> or&nbsp; <span class="caret"></span></a>
                           <ul class="dropdown-menu pull-right">
                             <li ><a href="javascript:void(0);"><i class="icon-pencil"></i><span class="divider-text"></span> 没有收到/申请发放</a></li>
                             <li onclick="show('errorMoney','<%#Eval("SalaID")%>')"><a href="javascript:void(0);"><i class="icon-remove"></i><span class="divider-text"></span> 数据错误/金额不对</a></li>
                             <li onclick ="show('elseError','<%#Eval("SalaID")%>')"><a href="javascript:void(0);"><i class="icon-pencil"></i><span class="divider-text"></span> 其他问题</a></li>
                         </ul>
                     </div>
                 </div>
                  
                </td>
               </tr>                                                                         
             </ItemTemplate>          
            </asp:Repeater>    
           </tbody> 
                </ContentTemplate>
           </asp:UpdatePanel>
          <tfoot>
            <tr><%--金额错误--%>
               <td  colSpan="9" id="errorMoney" style="display:none;" >        
                  <span>
                   <label for="<%=TextBox1.ClientID %>" style="display:inline">工资号：<asp:label runat="server" text="Label" id="label2"></asp:label>--金额错误：请填写你认为正确的金额</label>
                 </span>
                  <div class="input-prepend input-append"> <span class="add-on">&nbsp; ￥ &nbsp;</span>
                    <asp:TextBox ID="TextBox1" class="span8" size="16" runat="server" placeholder="确保申报的工资号正确！"></asp:TextBox>
                    <span class="add-on">&nbsp; .00 &nbsp;</span> 
                    <div class="btn-group">                                      
                      <asp:Button ID="Button5"  runat="server" Text='提交申请' class="btn btn-middle btn-success"
                       CommandName="errorMoney" CommandArgument=<%#Eval("SalaID")%> />
                       <a onclick="show('errorMoney')"; class="btn btn-middle">关闭<i class="fontello-icon-cancel-4" ></i></a>
                           
                   </div>
                 </div>   
             </td>
            </tr> 
            <tr><%--其他错误--%>
              <td colspan="9" id="elseError" style="display:none">   <%--  后台如何获取动态生成的id ?????--%>
                <span>
                <label for="<%=TextBox2.ClientID %>" style="display:inline">工资号：<asp:label runat="server" text="Label" id="label1"></asp:label><span id="100"></span>--其他错误：工资有其他错误，请提交具体说明</label>
              </span>
                <div class="input-prepend input-append"> <span class="add-on">&nbsp; ? &nbsp;</span>             
                    <asp:TextBox ID="TextBox2" class="span8" size="16" runat="server" placeholder="确保申报的工资号正确！"></asp:TextBox>
                   <div class="btn-group">                                      
                    <asp:Button ID="Button6"  runat="server" Text='提交申请' class="btn btn-middle btn-success"
                     CommandName="elseError" CommandArgument=<%#Eval("SalaID")%> />
                     <a onclick="show('elseError')"; class="btn btn-middle">关闭<i class="fontello-icon-cancel-4" ></i></a>            
                  </div> 
              </div>  
           </td>
          </tr>
         </tfoot> 
         </table>
         </div>
        </div>
    </section> 
  <section>
        <div class="page-header">                  
         <a id="btnChangeWrapper2" class="btn _btn-large btn-green" href="javascript:void(0);">所有工资情况</a>
        </div>
        <div class="row-fluid">
          <div class="span12">
          <table id="exampleDT" class="table table-striped table-hover">
           <caption>
          所有员工工资发放如下 <span></span>
            </caption>
            <thead>
             <tr>
               <th scope="col">工资号 <span class="column-sorter"></span></th>
               <th scope="col">年份 <span class="column-sorter"></span></th>
               <th scope="col">月份 <span class="column-sorter"></span></th>
               <th scope="col">工号 <span class="column-sorter"></span></th>
               <th scope="col">姓名 <span class="column-sorter"></span></th>
               <th scope="col">类别 <span class="column-sorter"></span></th>
               <th scope="col">金额 <span class="column-sorter"></span></th>
               <th scope="col">状态 <span class="column-sorter"></span></th>
               <th scope="col">发放途径 <span class="column-sorter"></span></th>
               <th scope="col">最新处理 <span class="column-sorter"></span></th>
               <th scope="col">确收时间 <span class="column-sorter"></span></th>
               <th scope="col">备注 <span class="column-sorter"></span></th>
           </tr>
            </thead>
            <tbody>
             <asp:Repeater ID="Repeater1" runat="server">
               <HeaderTemplate>                      
               </HeaderTemplate>                  
               <FooterTemplate>
               </FooterTemplate>
                <ItemTemplate> 
               <tr>
                <td><%#Eval("SalaID") %></td>
                <td><%#Eval("Year") %></td>
                <td><%#Eval("Month") %></td>
                <td><%#Eval("WID") %></td>
                <td><%#Eval("Name") %></td>
                <td><%#Eval("SalaryTypeName") %></td>
                <td><%#Eval("Money") %></td>
                <td><%#Eval("StateName") %></td>
                <td><%#Eval("SendWay") %></td>
                <td><%#Eval("SendTime","{0:D}") %></td>
                <td><%#Eval("GetTime","{0:D}") %></td>
                <td><%#Eval("Remark") %></td>
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
    <script>    
        function show(id,salaryid) {
            var a = document.getElementById(id);
            
            if (a.style.display == 'none') {
                a.style.display = '';
                
            }
            else if (a.style.display == '') {//block 将导致colspan 出错无效
                a.style.display = 'none';
            }
            else {
                a.style.display = 'none';
            }
            var label1 = document.getElementById('<%=label1.ClientID %>');
            var label2 = document.getElementById('<%=label2.ClientID %>');
            document.getElementById('100').innerHTML = "";
            label1.innerText = salaryid;
            label2.innerText = salaryid;
        }

    </script>

</asp:Content>

