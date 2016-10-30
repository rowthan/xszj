<%@ Page Title="" Language="C#" MasterPageFile="~/Do/MasterPage2.master" AutoEventWireup="true" CodeFile="userinfo.aspx.cs" Inherits="aspx_userinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>userinfo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="row-fluid page-head">
                <h2 class="page-title"><i class="aweso-icon-list-alt"></i> 信息查看<small>员工、会员</small></h2>                                         
                <p class="pagedesc">本页可以查看个人信息以及修改个人信息</p>
                <div class="page-bar">
                    <div class="btn-toolbar">
                        <ul class="nav nav-tabs pull-right">
                            <li class="active"> <a href="userinfo.aspx" >个人信息</a> </li>
                            <li> <a href="staffinfo.aspx">员工信息</a> </li>
                            <li> <a href="#Tab3" data-toggle="tab">会员信息</a> </li>
                        </ul>
                    </div>
                </div>         
            </div>

       <div id="page-content" class="page-content tab-content overflow-y">

           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
               <ContentTemplate>
      <div id="Tab1" class="tab-pane fade in active">
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="page-header">
                                <h3><i class="aweso-icon-list-alt opaci35"></i> Wizard <small>查看、修改个人信息</small></h3>
                            </div>
                            <div class="well well-nice well-box wizard">
                                <div id="DWZD" class="form-horizontal form-dark" >
                                    <div class="navbar">
                                        <div class="navbar-inner">
                                            <div class="container">
                                                <ul>
                                                     <li><a href="#tab6fb" data-toggle="tab">简介</a></li>
                                                    <li><a href="#tab1fb" data-toggle="tab">姓名</a></li>
                                                    <li><a href="#tab2fb" data-toggle="tab">私人资料</a></li>
                                                    <li><a href="#tab3fb" data-toggle="tab">工作</a></li>
                                                    <li><a href="#tab4fb" data-toggle="tab">联系方式</a></li>
                                                    <li><a href="#tab5fb" data-toggle="tab">密码</a></li>
                                                   
                                                </ul>
                                                <div class="number-page pull-right"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="section-content item bg-blue-medium padding-top10 padding-bottom10 no-border-top">
                                        <div id="bar1" class="progress progress-info progress-mini no-margin"> <%--进度条框--%>
                                            <div class="bar"></div><%--//进度条动态--%>
                                        </div>
                                    </div>
                                     
                                    <div class="tab-content section-content item">
                                       
                                             
                                                     
                         
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="do"><%----%> 
                                            
                                             <ItemTemplate><%--//如果数据源返回值为空 则在这里面的内容不会显示--%>
                                                    
                                        <div class="tab-pane" id="tab1fb">
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <fieldset>
                                                        <legend><i class="fontello-icon-user-4"></i> 姓名 <span> 作为员工真实姓名是必须的，请填写。</span></legend>
                                                        <ul class="form-list label-left list-bordered dotted">
                                                            <li class="control-group">
                                                                <label for="wzNewPrefix" class="control-label">昵称</label>
                                                                <div class="controls">
                                                                  <%--  <input id="" runat="server"  type="text" value=''  name="wzNewPrefix">--%>
                                                                    <asp:TextBox ID="Nickname" class="span6" runat="server" Text='<%#Eval("NickName")%>'></asp:TextBox>
                                                                     </div>
                                                            </li>
                                                            <!-- // form item -->
                                                            
                                                            <li class="control-group">
                                                                <label for="wzNewFirstName" class="control-label">真实姓名 <span class="required">*</span></label>
                                                                <div class="controls">
                                                                   
                                                                <asp:TextBox ID="Name" class="span6" runat="server" Text='<%#Eval("Name")%>'></asp:TextBox>
                                                                     </div>
                                                            </li>                               
                                                            <li class="control-group">
                                                                <label for="wzNewSuffix" class="control-label">个性签名</label>
                                                                <div class="controls">
                                                                   
                                                                 <asp:TextBox ID="Sign" class="span6" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sign")%>'></asp:TextBox>
                                                                   
                                              
                                           <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Updatename" class=" btn btn-green">确定修改</asp:LinkButton>
                                                                     </div>
                                                            </li>
                                                            <!-- // form item -->
                                                            
                                                        </ul>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- // tab1 -->
                                               
                                        
                                        <div class="tab-pane" id="tab2fb">
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <fieldset>
                                                        <legend><i class="fontello-icon-vcard"></i> 私人资料<span> 个人隐私请慎重修改，此部分内容仅员工内部可见</span></legend>
                                                        <ul class="form-list label-left list-bordered dotted">
                                                               <li class="control-group">
                                                                <label for="wzNewAddressState2" class="control-label">性别 <span class="required">*</span></label>
                                                                <div class="controls">
                                                                   <label for="wzNewAddressState2" class="control-label"><%#DataBinder.Eval(Container.DataItem,"Gender") %></label>
                                                                    <asp:DropDownList ID="gender" runat="server" class="span3"  AutoPostBack="true">                                               
                                                                        <asp:ListItem Value="男" ></asp:ListItem>
                                                                        <asp:ListItem Value="女"></asp:ListItem>  
                                                                    </asp:DropDownList>  
                                                                </div>
                                                            </li>                              
                                                            <!-- // form item -->
                                                            
                                                             <li class="control-group">
                                                                <label for="wzNewAddressState2" class="control-label">恋爱状态 <span class="required">*</span></label>
                                                                <div class="controls">
                                                                    <label for="wzNewAddressState2" class="control-label"><%#DataBinder.Eval(Container.DataItem,"LoveState") %></label>
                                                                      <asp:DropDownList ID="lovestate" class="span3" runat="server" >                                               
                                                                        <asp:ListItem Value="单身狗" ></asp:ListItem>
                                                                        <asp:ListItem Value="恋爱中"></asp:ListItem>
                                                                        <asp:ListItem Value="孤独终老"></asp:ListItem>
                                                                        <asp:ListItem Value="保密"></asp:ListItem>
                                                                    </asp:DropDownList> 
                                                                </div>
                                                            </li>                                   
                                                            <!-- // form item -->
                                                            
                                                            <li class="control-group">
                                                                <label for="birth" class="control-label">生日<span class="required">*</span></label>
                                                                <div class="controls">
                                                                       <asp:TextBox ID="birth" class="span4" runat="server" Text='<%#Eval("Birth","{0:D}")%>'></asp:TextBox>
                                                                 </div>
                                                            </li>
                                                            
                                                            <!-- // form item -->
                                                            
                                                            <li class="control-group">
                                                                <label for="wzNewAge" class="control-label">年龄</label>
                                                                <div class="controls">
                                                                      <asp:TextBox ID="age" class="span4" runat="server" Text='<%#Eval("Age")%>'></asp:TextBox>
                                                              <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Updatepersonal" class=" btn btn-green">确定修改</asp:LinkButton>
                                                                      </div>
                                                            </li>
                                                            <!-- // form item -->
                                                            
                                                        </ul>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- // tab2 -->
                                        
                                        <div class="tab-pane" id="tab3fb">
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <fieldset>
                                                        <legend><i class="fontello-icon-bag"></i>工作 <span> 请确保学号正确以及支付宝和银行卡号正确，这是发放工资的重要凭据。</span></legend>
                                                        <ul class="form-list label-left list-bordered dotted">
                                                             <li class="control-group">
                                                                <label for="wzNewEmployer" class="control-label">学号</label>
                                                                <div class="controls">
                                                                    <asp:TextBox ID="sid" class="span4" runat="server" Text='<%#Eval("SID") %>'></asp:TextBox>
                                                                 </div>
                                                            </li>  
                                                            <li class="control-group">
                                                                <label for="wzNewEmployer" class="control-label">职位</label>
                                                                <div class="controls">
                                                                     <asp:TextBox ID="powername" class="span4" runat="server" Text='<%#Eval("PowerName") %>' ReadOnly="true"></asp:TextBox>
                                                                    <asp:TextBox ID="TextBox2" class="span4" runat="server" Text='<%#Eval("StateName") %>' ReadOnly="true"></asp:TextBox>       
                                                                </div>
                                                            </li>     
                                                             <li class="control-group">
                                                                <label for="zfb" class="control-label">支付宝</label>
                                                                <div class="controls">
                                                                      <asp:TextBox ID="zfb" class="span4" runat="server" Text='<%#Eval("ZFB") %>'></asp:TextBox>       
                                                                </div>
                                                            </li>        
                                                             <li class="control-group">
                                                                <label for="bank" class="control-label">银行卡</label>
                                                                <div class="controls">
                                                                     <asp:TextBox ID="bank" class="span4" runat="server" Text='<%#Eval("Bank") %>'></asp:TextBox>  
                                                                    <asp:TextBox ID="card" class="span4" runat="server" Text='<%#Eval("Card") %>'></asp:TextBox> 
                                                                </div>
                                                            </li>                       
                                                            <!-- // form item -->
                                                               <li class="control-group">
                                                                <label for="wzNewJob" class="control-label">工作说明</label>
                                                                <div class="controls">
                                                                    <input id="wzNewJob" class="span4" type="text"  readonly="readonly" name="wzNewJob" value="">
                                                                    </div>
                                                            </li>
                                                            <li class="control-group">
                                                                <label for="wzNewDepartment" class="control-label">上次更新</label>
                                                                <div class="controls">
                                                                    <input id="wzNewMiddleName" class="span4" readonly="readonly" type="text" name="wzNewMiddleName" value="<%#Eval("lastModify","{0:D}") %>">
                                                                  <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Updatework" class=" btn btn-green">确定修改</asp:LinkButton>
                                                                     <p class="help-block">Lorem ipsum dolor sit amet consectetuer convallis nisl dolor tellus porta. Curabitur accumsan tempus semper eget Aliquam ante Aliquam Curabitur odio tincidunt.</p>
                                                             
                                                                </div>
                                                            </li>
                                                            <!-- // form item -->                        
                                                        </ul>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- // tab3 -->
                                        
                                        <div class="tab-pane" id="tab4fb">
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <fieldset>
                                                        <legend><i class="fontello-icon-phone"></i> 联系方式<span> 修改联系方式</span></legend>
                                                        <ul class="form-list label-left list-bordered dotted">
                                                            <li class="control-group">
                                                                <label for="wzNewEmail" class="control-label">Email <span class="required">*</span></label>
                                                                <div class="controls">
                                                                   <asp:TextBox ID="email" class="span5" runat="server" Text='<%#Eval("Email") %>'></asp:TextBox>
                                                                     </div>
                                                            </li>
                                                            <!-- // form item -->
                                                            
                                                            <li class="control-group">
                                                                <label for="wzNewPhoneNumber" class="control-label">电话 <span class="required">*</span></label>
                                                                <div class="controls">
                                                                 <asp:TextBox ID="tel" class="span5" runat="server" Text='<%#Eval("Tel") %>'></asp:TextBox>
                                                                </div>
                                                            </li>
                                                            <!-- // form item -->
                                                            
                                                            <li class="control-group">
                                                                <label for="wzNewFaxNumber" class="control-label">QQ</label>
                                                                <div class="controls">
                                                                   
                                                                    <asp:TextBox ID="qq" class="span5" runat="server" Text='<%#Eval("QQ") %>'></asp:TextBox>
                                                                     </div>
                                                            </li>
                                                             <li class="control-group">
                                                                <label for="address" class="control-label">校园住址</label>
                                                                <div class="controls">
                                                                     <asp:TextBox ID="address" class="span5" runat="server" Text='<%#Eval("Address") %>'></asp:TextBox>  
                                                                      </div>
                                                            </li>
                                                             <li class="control-group">
                                                                <label for="homeaddress" class="control-label">家庭住址 <span class="required">*</span></label>
                                                                <div class="controls">
                                                                    <asp:TextBox ID="homeaddress" class="span5" runat="server" Text='<%#Eval("HomeAddress") %>'></asp:TextBox>   
                                                                  <asp:LinkButton ID="LinkButton6" runat="server" CommandName="Updatecontact" class=" btn btn-green">确定修改</asp:LinkButton>
                                                             
                                                                </div>
                                                            </li>
                                                            <!-- // form item -->
                                                          
                                                            <li class="control-group">
                                                                <div class="controls">
                                                                    <p>Lorem ipsum dolor sit amet consectetuer convallis nisl dolor tellus porta.</p>
                                                                </div>
                                                            </li>
                                                            <!-- // form item -->
                                                            
                                                        </ul>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- // tab4 -->
                                        
                                        <div class="tab-pane" id="tab5fb">
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <fieldset>
                                                        <legend><i class="fontello-icon-home"></i> 密码 <span> 修改你的密码</span></legend>
                                                        <ul class="form-list label-left list-bordered dotted">
                                                           
                                                            <!-- // form item -->
                                                             <li class="control-group">
                                                                <label for="oldpwd" class="control-label">原密码 <span class="required">*</span></label>
                                                                <div class="controls">
                                                                     <asp:TextBox ID="oldpwd" TextMode="Password" class="span6" runat="server" Text=""></asp:TextBox>   
                                                                </div>
                                                            </li>
                                                            <li class="control-group">
                                                                <label for="newpwd" class="control-label">新密码 <span class="required">*</span></label>
                                                                <div class="controls">
                                                                     <asp:TextBox ID="newpwd" class="span6" TextMode="Password" runat="server" Text=""></asp:TextBox> 
                                                                        <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Updatepwd" class=" btn btn-green">确定修改</asp:LinkButton>
                                                                  </div>
                                                            </li>
                                                        </ul>
                                                    </fieldset>
                                                    <!-- // fieldset Input --> 
                                                </div>
                                            </div>
                                        </div>
                                        <!-- // tab5 -->
                                        
                                        <div class="tab-pane summary" id="tab6fb">
                                            <div class="row-fluid">
                                                <div class="span12">
                                                    <fieldset>
                                                        <legend><i class="fontello-icon-th-list-4"></i> Overview of your infomation <span> 查看个人信息</span></legend>
                                                        <ul class="summary-list list-bordered dotted">
                                                            <li class="control-group row-fluid">
                                                                <div class="span6 well well-small well-nice">
                                                                    <p><span class="label-field">姓名</span> <span class="field bold"><%#Eval("Name") %></span></p>
                                                                    <p><span class="label-field">恋爱状态</span> <span class="field"><%#Eval("LoveState") %></span></p>
                                                                    <p><span class="label-field">性别</span> <span class="field"><%#Eval("Gender") %></span></p>
                                                                    <p><span class="label-field">生日</span> <span class="field"><%#Eval("Birth","{0:D}") %></span></p>
                                                                    <p><span class="label-field">年龄</span> <span class="field"><%#Eval("Age") %></span></p>
                                                                </div>
                                                            </li>
                                                            <!-- // form item -->
                                                            
                                                            <li class="control-group row-fluid">
                                                                <p><span class="label-field">Email</span> <span class="field bold"><%#Eval("Email") %></span></p>
                                                                <p><span class="label-field">Phone</span> <span class="field bold"><%#Eval("Tel") %></span></p>
                                                                <p><span class="label-field">QQ</span> <span class="field"><%#Eval("QQ") %></span></p>
                                                            </li>
                                                            <!-- // form item -->
                                                            
                                                            <li class="control-group">
                                                                <p><span class="label-field">Address</span> <span class="field"><%#Eval("Address") %></span></p>
                                                                <p><span class="label-field">&nbsp;</span> <span class="field"><%#Eval("HomeAddress") %></span></p>
                                                            </li>
                                                            <!-- // form item -->
                                                            
                                                            <li class="control-group">
                                                                <p><span class="label-field">Employer</span> <span class="field"><%#Eval("PowerName") %></span></p>
                                                                <p><span class="label-field">LastLogin</span> <span class="field"><%#Eval("LastLogin","{0:D}") %></span></p>
                                                                <p><span class="label-field">LoginCount</span> <span class="field"><%#Eval("LoginCount") %></span></p>
                                                                 
                                                            </li>
                                                            <!-- // form item -->
                                                            
                                                        </ul>
                                                    </fieldset>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- // tab6 summary --> 
                                                 </ItemTemplate>
                                       
                                      </asp:Repeater>
                                    <div class="section-content footer">
                                        <ul class="wizard-action wizard-pager">
                                            <li><a class="previous first btn" href="javascript:void(0);">首页</a></li>
                                            <li><a class="previous btn btn-blue" href="javascript:void(0);"><i class="fontello-icon-left-circle2"></i> 上一页</a></li>
                                            <li><a class="next last btn" href="javascript:void(0);">最后一页</a></li>
                                            <li><a class="next btn btn-blue" href="javascript:void(0);">下一页 <i class="fontello-icon-right-circle2"></i></a></li>
                                          <%--  <li>
                                                <button type="submit" class="next finish btn btn-green">确定修改</button>
                                            </li>--%>
                                            <li><a class="next print btn btn-glyph" href="javascript:void(0);"><i class="fontello-icon-print-2"></i></a></li>
                                            <li><a class="next cancel btn btn-red" href="javascript:void(0);">取消</a></li>
                                        </ul>
                                        <!-- // Action --> 
                                        
                                    </div>

                               
                            </div>
                        </div>
                    </div>
                	<!-- // example row -->
                </div>
               
           
      </div>
          </div>
                   </ContentTemplate>
               </asp:UpdatePanel>
           </div>
</asp:Content>

    <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:xszjConnectionString %>" ProviderName="<%$ ConnectionStrings:xszjConnectionString.ProviderName %>"
                                                SelectCommand="SELECT  Email FROM staffinfo WHERE (Gender = '男')">
                                                <%--<SelectParameters>
                                                      <asp:QueryStringParameter Name="Param1" QueryStringField="ID" />
                                                 </SelectParameters>带参数的时候用--%>

                                                   <%-- </asp:SqlDataSource>--%>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript" src="assets/datachoose/js/laydate.js"></script>

    <script src="assets/js/demo/demo-form.js"></script> 
<script src="assets/js/demo/demo-wisyhtml5.js"></script>


    <script>
        $(document).ready(function () {  
            $(function (wizardFormBar) {
                // navbar, numbering, progressbar, submit button well-nice 函数名可以随便取
                wizardFormBar('#DWZD').bootstrapWizard({
                    nextSelector: '.wizard-action .next',
                    previousSelector: '.wizard-action .previous',
                    firstSelector: '.wizard-action .first',
                    lastSelector: '.wizard-action .last',
                    onTabShow: function (tab, navigation, index) {

                        var $total = navigation.find('li').length;
                        var $current = index + 1;
                        var $percent = ($current / $total) * 100;
                        var $wizard = $('#DWZD');

                        $wizard.find('.bar').css({//进度条
                            width: $percent + '%'
                        });

                        $wizard.find('.number-page').text($current + ' of ' + $total);

                        // If it's the last tab then hide the last button and show the finish instead 控制打印等button是否出现
                        if ($current >= $total) {
                            $wizard.find('.wizard-action .next').hide();
                            $wizard.find('.wizard-action .finish').show();
                            $wizard.find('.wizard-action .finish').removeClass('disabled');
                            $wizard.find('.wizard-action .print').show();
                            $wizard.find('.wizard-action .print').removeClass('disabled');
                            $wizard.find('.wizard-action .cancel').show();
                            $wizard.find('.wizard-action .cancel').removeClass('disabled');
                        }
                        else {
                            $wizard.find('.wizard-action .next').show();
                            $wizard.find('.wizard-action .finish').hide();
                            $wizard.find('.wizard-action .print').hide();
                            $wizard.find('.wizard-action .cancel').hide();
                        }

                    }

                })
                wizardFormBar('#DWZD .finish').click(function () {//结束的控制
                    alert('Finished!, Starting over!');
                    $('#DWZD').find("a[href*='tab1fb']").trigger('click');
                })

                wizardFormBar('#wzNewAddressState2').select2();//未能知道功能
            });
        });
</script>
</asp:Content>

