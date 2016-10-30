<%@ Page Title="" Language="C#" MasterPageFile="~/Do/MasterPage2.master" AutoEventWireup="true" CodeFile="widgets1.aspx.cs" Inherits="aspx_widgets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>个人账户</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

     <section>
                    <div class="page-header">                  
                     <a id="btnChangeWrapper1" class="btn _btn-large btn-green" href="javascript:void(0);"> <i class="fontello-icon-arrows-cw"></i> 个人工资情况</a>
                   </div>
                    <div class="row-fluid margin-bottom16">
                        <div class="span12">
                            <div class="widget widget-simple widget-table">                            
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" GridLines="None" ForeColor="#333333"  CssClass="table boo-table table-striped table-hover"  AllowSorting="True"
                                             EmptyDataRowStyle-BackColor="#33cc33" emptydatatext="No data available." AllowPaging="True" EnableModelValidation="True" 
                                            OnRowUpdating="GridView1_RowUpdating" OnRowEditing="GridView1_RowEditing"  Width="100%">                        
                                             <Columns >
                                                
                                         <asp:BoundField DataField="SalaID" HeaderText="工资号" ReadOnly="true" > 
                                                 <HeaderStyle Width="7%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="Month" HeaderText="月份"  ControlStyle-Width="100%"    >
<ControlStyle Width="100%"></ControlStyle>
                                                 <HeaderStyle Width="5%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="Money" HeaderText="金额"   ControlStyle-Width="100%"   >
<ControlStyle Width="100%"></ControlStyle>
                                                 <HeaderStyle Width="5%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="StateName" HeaderText="发放状态"  ControlStyle-Width="100%"   >   
<ControlStyle Width="100%"></ControlStyle>
                                                 <HeaderStyle Width="7%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="SendWay" HeaderText="发放途径"   ControlStyle-Width="100%"  >   
<ControlStyle Width="100%"></ControlStyle>
                                                 <HeaderStyle Width="7%" />
                                                 </asp:BoundField>
                                       <asp:BoundField DataField="SendTime" HeaderText="最新处理时间"  DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False"  ReadOnly="True"> 
                                                 <HeaderStyle Width="10%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="GetTime" HeaderText="确收时间"     DataFormatString="{0:MM-dd}"  HtmlEncode="false" ReadOnly="True">  
                                                 <HeaderStyle Width="10%" />
                                                 </asp:BoundField>
                                         <asp:BoundField DataField="Remark"    ControlStyle-Width="100%"   HeaderText="备注" >  
<ControlStyle Width="100%"></ControlStyle>
                                                 <HeaderStyle Width="12%" />
                                                 </asp:BoundField>
                                            <asp:CommandField HeaderText="选择 "     ShowSelectButton="True" />
                                        <asp:CommandField HeaderText="编辑"     ShowEditButton="True" />
                                        <asp:CommandField HeaderText="删除"     ShowDeleteButton="True" />

                                    <asp:TemplateField HeaderText="处理">
                       <edititemtemplate>
                        
               <%--<style>table{table-layout:fixed}</style>--%>
                  
                           
                </edititemtemplate>
                  <ItemTemplate>
                  
                       <div class="quick-menu">
                                                        <div class="btn-group"> <a class="btn btn-mini btn-success" href="javascript:void(0);">确认收到</a> <a data-toggle="dropdown" class="btn btn-mini dropdown-toggle"> or&nbsp; <span class="caret"></span></a>
                                                            <ul class="dropdown-menu pull-right">
                                                          
                                                                <li onclick=""><a href="javascript:void(0);"><i class="icon-pencil"></i><span class="divider-text"></span> 没有收到/申请发放</a></li>
                                                             
                                                                <li><a href="javascript:void(0);"><i class="icon-remove"></i><span class="divider-text"></span> 数据错误/金额不对</a></li>
                                                                <li><a href="javascript:void(0);"><i class="icon-pencil"></i><span class="divider-text"></span> 其他问题</a></li>
                                                            
                                                            </ul>
                                                        </div>
                                                    </div>

                  </ItemTemplate>
              </asp:TemplateField>   
                                                                             
                            </Columns>
                                           
                                        <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="#272b2f" />
                                        <RowStyle ForeColor="#272b2f" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />

<EmptyDataRowStyle BackColor="#33CC33"></EmptyDataRowStyle>
                                        <EmptyDataTemplate>no data</EmptyDataTemplate>
                    </asp:GridView>     
                                                  
                                            </div>
                         
                        </div>   
                        
                      
                    </div>    
       
       
                  <%if ( Convert.ToInt32( Session["power"])==4){ %>
                <div class="page-header">                  
                    <p> <a id="btnChangeWrapper2" class="btn _btn-large btn-green" href="javascript:void(0);"> <i class="fontello-icon-arrows-cw"></i> 所有员工工资情况</a></p>
                    </div>
                     <div class="row-fluid margin-bottom16">
                        <div class="span12">
                            <div class="widget widget-simple widget-table">                            
                                      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" GridLines="None" 
                                          ForeColor="#333333"  CssClass="table boo-table table-striped table-hover" 
                                           EnableModelValidation="True" Width="100%">
                           
                                             <Columns>
                                         <asp:BoundField DataField="SalaID" HeaderText="工资号" ReadOnly="True" > 
                                                 <HeaderStyle Width="7%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="Month" HeaderText="月份">
                                                 <HeaderStyle Width="6%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="WID" HeaderText="工号" >
                                                 <HeaderStyle Width="5%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="Name" HeaderText="姓名" >
                                                 <HeaderStyle Width="7%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="Money" HeaderText="金额">
                                                 <HeaderStyle Width="5%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="StateName" HeaderText="发放状态">   
                                                 <HeaderStyle Width="10%" />
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="SendWay" HeaderText="发放途径">   
                                                 <HeaderStyle Width="10%" />
                                                 </asp:BoundField>
                                       <asp:BoundField DataField="SendTime" HeaderText="最新处理时间" HtmlEncode ="false" DataFormatString="{0:d}"> 
                                                 <HeaderStyle Width="10%" />
                                        
                                                 </asp:BoundField>
                                        <asp:BoundField DataField="GetTime" HeaderText="确收时间" DataFormatString="{0:MM-dd}"  HtmlEncode="false">  
                                                 <HeaderStyle Width="10%" />
                                            
                                                 </asp:BoundField>
                                         <asp:BoundField DataField="Remark" HeaderText="备注" >  
                                                 <HeaderStyle Width="5%" />
                                                 <ItemStyle Wrap="False" />
                                                 </asp:BoundField>
                                       <%--  <asp:CommandField HeaderText="选择" ShowSelectButton="True" />--%>
                        
                              <%--  <asp:CommandField HeaderText="编辑" ShowEditButton="True" />--%>
  
                                    <asp:TemplateField HeaderText="处理">
                       <edititemtemplate>
                           <%--<asp:Label ID="Label2" runat="server" Text='<%# Eval("SendTime", "{0:M-dd-yyyy}") %>'></asp:Label>--%>
               
                </edititemtemplate>
                  <ItemTemplate>
                  
                       <div class="quick-menu">
                                                        <div class="btn-group"> <a class="btn btn-mini btn-success" href="javascript:void(0);">确认收到</a> <a data-toggle="dropdown" class="btn btn-mini dropdown-toggle"> or&nbsp; <span class="caret"></span></a>
                                                            <ul class="dropdown-menu pull-right">
                                                           
                                                               <li><a href="javascript:void(0);"><i class="icon-pencil"></i><span class="divider-text"></span> 编辑/管理员操作</a></li>
                                                               
                                                            </ul>
                                                        </div>
                                                    </div>
                  </ItemTemplate>
                                        <HeaderStyle Width="5%" />
              </asp:TemplateField>   
                                                                             
                            </Columns>
                                           
                                        <HeaderStyle BackColor="black" Font-Bold="True" ForeColor="#272b2f" />
                                        <RowStyle ForeColor="#272b2f" />
                                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                        
                    </asp:GridView> 
                                         
                                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
                                         
                                            </div>
            
                        </div>   
                        <%} %>  
               </div>    
                </section>

    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script src="assets/js/demo/demo-jquery.dataTables.js"></script>
</asp:Content>

