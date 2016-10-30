<%@ Page Title="" Language="C#" MasterPageFile="~/Do/MasterPage2.master" AutoEventWireup="true" CodeFile="application.aspx.cs" Inherits="Do_application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>申报</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div class="row-fluid ">

    <div class="span8 grider">
         <div class="widget widget-simple">
           <div class="widget-header">
             <h4><i class="fontello-icon-user"></i>最新申报：<small>最新</small></h4>
           </div>
        </div> 
        
        
        <div class="widget widget-box">
             <ul class="nav nav-tabs">
                <li class="active"><a href="#TabBestsellers" data-toggle="tab"><i class="fontello-icon-award-1"></i> <span class="hidden-phone">最新申请</span></a></li>
                <li><a href="#TabCustomers" data-toggle="tab"><i class="fontello-icon-user"></i> <span class="hidden-phone">我的申请</span></a></li>
              </ul>
             <div class="tab-content">
               <div class="tab-pane active" id="TabBestsellers">
                <table class="table table-condensed table-striped no-margin">
                 <thead>
                  <tr>
                     <th scope="col" >年份</th>
                     <th scope="col">月份</th>
                     <th scope="col">员工</th>
                      <th scope="col" >类别</th>
                       <th scope="col">金额</th>
                     <th scope="col">申请人</th>
                     <th scope="col">申请时间</th>
                       <th scope="col">状态</th>
                       <th scope="col">备注</th>
                       <%if ( Convert.ToInt32(Session["Power"])>2) { %>
                       <th scope="col">操作</th>
                         <%} %>
                  </tr>
                 </thead>
                 <tbody>
                     <asp:Repeater runat="server" ID="Repeater1">
             
                     <ItemTemplate> 
                    <tr>
                     <td><%#Eval("Year") %></td>
                       <td><%#Eval("Month") %></td>
                       <td><%#Eval("WID") %>--<%#Eval("Name") %></td>
                       <td><%#Eval("SalaryTypeName") %></td>
                       <td><%#Eval("Money") %></td>
                        <td><%#Eval("ApplyPerson") %></td>
                       <td><%#Eval("ApplyTime","{0:D}") %></td>
                        <td><%#Eval("StateName") %></td>
                       <td><%#Eval("Remark") %></td>
                           <%if ( Convert.ToInt32(Session["Power"])>2) { %>
                        <td>  
                         <div class="quick-menu">
                     <div class="btn-group">
                        <asp:Button ID="Button4"  runat="server" Text='同意' class="btn btn-mini btn-success" CommandName="get" CommandArgument= />
                        <asp:Button ID="Button2"  runat="server" Text='拒绝/删除' class="btn btn-mini dropdown-toggle" CommandName="get" CommandArgument= />
                     </div>
                 </div>
                       </td>
                          <%} %>
                    </tr>
                       </ItemTemplate>          
                   </asp:Repeater>
                 </tbody>
                </table>
               </div>
            
            
               <div class="tab-pane" id="TabCustomers">
                 <table class="table table-condensed no-margin">
                   <thead>
                  <tr>
                      <th scope="col" >年份</th>
                      <th scope="col">月份</th>
                      <th scope="col">员工</th>
                      <th scope="col" >类别</th>
                       <th scope="col">金额</th>
                       <th scope="col">申请时间</th>
                       <th scope="col">状态</th>
                       <th scope="col">备注</th>            
                       <th scope="col">操作</th>
                    
                   </tr>
                    </thead>
                   <tbody>
                    <asp:Repeater ID="Repeater2" runat="server">
                     <ItemTemplate> 
                     <tr>
                       <td><%#Eval("Year") %></td>
                       <td><%#Eval("Month") %></td>
                       <td><%#Eval("WID") %>--<%#Eval("Name") %></td>
                       <td><%#Eval("SalaryTypeName") %></td>
                       <td><%#Eval("Money") %></td>
                       <td><%#Eval("ApplyTime","{0:D}") %></td>
                       <td><%#Eval("StateName") %></td>
                       <td><%#Eval("Remark") %></td>
                       
                       <td>  
                         <div class="quick-menu">
                          <div class="btn-group">
                          <asp:Button ID="Button4"  runat="server" Text='编辑' class="btn btn-mini btn-success" CommandName="get" CommandArgument= />
                          <asp:Button ID="Button2"  runat="server" Text='删除' class="btn btn-mini dropdown-toggle" CommandName="get" CommandArgument= />
                         </div>
                       </div>
                       </td>
                      
                     </tr> 
                    </ItemTemplate>
                    </asp:Repeater>
                                                              
                   </tbody>
                 </table>
              </div>
            </div>
        </div>
       </div>
               

     <div class="span4 grider">
       <div class="widget widget-simple widget-notes">
         <div class="widget-header">
            <h4><i class="fontello-icon-list-alt"></i>填表申报</h4>
        </div>
      <div class="widget-content">
        <div class="widget-body">
          <div id="formNextAccountSettings" class="form-condensed">
          <fieldset>
           <ul class="form-list">
            <li class="control-group">
             <label for="DropDownList1" class="control-label">员工(按工号排序)</label>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                 <div class="controls">
                 <asp:DropDownList ID="DropDownList5" runat="server" class="span6" AutoPostBack="true" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                  </asp:DropDownList>
                   <asp:DropDownList ID="DropDownList1" runat="server" class="span6" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                  </asp:DropDownList>                                                              
                 </div>
                  </ContentTemplate>
               </asp:UpdatePanel>
           </li>
               <li class="control-group">
             <label for="DropDownList3" class="control-label">工资月份</label>
             <div class="controls">
                 <asp:dropdownlist id="DropDownList3" runat="server" class="selectpicker">
                     <asp:ListItem Text="2016年" Value="2016">
                     </asp:ListItem>
                     <asp:ListItem Text="2015年" Value="2015">
                     </asp:ListItem>
                 </asp:dropdownlist>   
                  
                  <asp:DropDownList ID="DropDownList4" runat="server" class="selectpicker">
                      <asp:ListItem Text="1月" Value="1">
                     </asp:ListItem>
                       <asp:ListItem Text="2月" Value="2">
                     </asp:ListItem>
                       <asp:ListItem Text="3月" Value="3">
                     </asp:ListItem>
                       <asp:ListItem Text="4月" Value="4">
                     </asp:ListItem>
                       <asp:ListItem Text="5月" Value="5">
                     </asp:ListItem>
                       <asp:ListItem Text="6月" Value="6">
                     </asp:ListItem>
                       <asp:ListItem Text="7月" Value="7">
                     </asp:ListItem>
                       <asp:ListItem Text="8月" Value="8">
                     </asp:ListItem>
                       <asp:ListItem Text="9月" Value="9">
                     </asp:ListItem>
                       <asp:ListItem Text="10月" Value="10">
                     </asp:ListItem>
                       <asp:ListItem Text="11月" Value="11">
                     </asp:ListItem>
                       <asp:ListItem Text="12月" Value="12">
                     </asp:ListItem>
                  </asp:DropDownList>      
             </div>
           </li>
            <li class="control-group">
             <label for="applytype" class="control-label">申报类型</label>
             <div class="controls">
                   <asp:DropDownList ID="DropDownList2" runat="server" class="span6">
                  </asp:DropDownList> 
             </div>
             </li>
            <li class="control-group">
             <label for="accountForce" class="control-label">金额</label>
               <div class="controls">
                   <asp:textbox  id="Money" runat="server" placeholder="eg:100.0" class="span6" ></asp:textbox>
                <span >请精确到小数点一位</span> </div>
             </li>
                                                  
            <li class="control-group">
             <label for="accountForce" class="control-label">备注</label>
             <div class="controls">
                     <asp:textbox  id="remark" placeholder="备注说明" runat="server" class="input-block-level margin-00" ></asp:textbox>
                </div>
           </li>

           
        </ul>
           <asp:Button ID="Button1" class="btn btn-green btn-block" runat="server" Text="提交"  OnClientClick="return checkmoney()"  OnClick="Button1_Click"/>
          </fieldset>
          </div>
        </div>
      </div>
     </div>
     </div><%--公告--%>           

   </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script>
        function checkmoney() {
            if (document.getElementById("ctl00_ContentPlaceHolder1_Money").value == "") {
                alert("金额还未填！");
                return false;
            }
            if (document.getElementById("ctl00_ContentPlaceHolder1_Money").value <= 0) {
                alert("金额大于0！");
                return false;
            }
        }
    </script>
</asp:Content>

