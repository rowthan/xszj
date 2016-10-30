<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="网站1_index_aspx_assets_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学生之家-登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="description" content="">
<meta name="author" content="">

<!-- Custom styles -->
<style type="text/css">
.signin-content {
  max-width: 360px;
  margin: 0 auto 20px;
}
</style>

<!-- Le styles -->
<link href="assets/css/lib/bootstrap.css" rel="stylesheet">
<link href="assets/css/lib/bootstrap-responsive.css" rel="stylesheet">
<link href="assets/css/boo-extension.css" rel="stylesheet">
<link href="assets/css/boo.css" rel="stylesheet">
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/boo-coloring.css" rel="stylesheet">
<link href="assets/css/boo-utility.css" rel="stylesheet">

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script src="assets/plugins/selectivizr/selectivizr-min.js"></script>
    <script src="assets/plugins/flot/excanvas.min.js"></script>
<![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<body class="signin signin-vertical">
<div class="page-container">
    <div id="header-container">
        <div id="header">
            <div class="navbar-inverse navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container"> </div>
                </div>
            </div>
            <!-- // navbar -->
            
            <div class="header-drawer" style="height:3px"> </div>
            <!-- // breadcrumbs --> 
        </div>
        <!-- // drawer --> 
    </div>
    <!-- // header-container -->
    
    <div id="main-container" >
        <div id="main-content" class="main-content container">

           <form id="Form1" class="form-tied margin-00"  name="login_form" runat="server">

            <div class="signin-content">
               <a href="../index.html"> <h1 class="welcome text-center" style="line-height: 0.6;"><span style="margin-left: -45px;">Welcome to</span><br />
                    Home Of<small>Student</small></h1></a>
                <div class="well well-black well-impressed">
                    <div class="tab-content overflow">
                        <div class="tab-pane fade in active" id="login">
                            <h3 class="no-margin-top"><i class="fontello-icon-user-4"></i> Sign in with your ID</h3>
                            <div class="form-tied margin-00">
                                <fieldset>
                                    <legend class="two"><span>Legend</span></legend>
                                    <ul>
                                     
                                        <li>
                                       <asp:TextBox ID="username" runat="server" class="input-block-level" name="id_login_email" placeholder="用户名" ></asp:TextBox>
                                        </li>

                                        <li>
                                            <asp:TextBox ID="pwd" runat="server" TextMode="Password"  class="input-block-level"  name="id_login_password" placeholder="密码"></asp:TextBox>
                                      </li>
                                        </ul>
                                    <asp:Button ID="Button1" runat="server" Text="登录" 
                                        class="btn btn-yellow btn-block btn-large" onclick="Button1_Click1"  OnClientClick="return check()"
                                        Height="32px"   />
                               
                                    <hr class="margin-xm">
                                    <label class="checkbox pull-left">
                                        <input id="remember" class="checkbox" type="checkbox">
                                        Remember me </label>
                                  
                                 
                                    <a href="#forgot" class="pull-right link" data-toggle="tab">Forgot Password?</a>
                                </fieldset>
                              </div>
                        </div>
                        <!-- // Tab Login -->
                        
                        <div class="tab-pane fade" id="forgot">
                            <h3 class="no-margin-top">Forgot your password?</h3>
                         <div class="margin-00" >
                                <p class="note">填写你的注册邮箱或者电话，我们将以邮箱或短信方式告知你的密码。囧...暂不可用</p>
                             <asp:TextBox ID="email" runat="server" class="input-block-level"  placeholder="your email"></asp:TextBox>                            
                                <p class="text-center">or</p>
                                <asp:TextBox ID="phone" runat="server" class="input-block-level"  placeholder="your phone"></asp:TextBox>
                              
                                <hr class="margin-xm">
                             <asp:Button ID="Button2" runat="server" Text="确定" class="btn btn-yellow btn-block btn-large" Height="32px"/>
                                   
                                <p>Have you remembered? <a href="#login" class="pull-right link" data-toggle="tab">Try to log in again.</a></p>
                            </div>
                            <!-- // form 往往这里会出现post的问题 这是不是本页的问题 是因为接受对象为静态网址html 他不能接受post --> 
                            
                        </div>
                        <!-- // Tab Forgot -->
                        
                        <div class="tab-pane fade" id="register">
                            <h3 class="no-margin-top"><i class="fontello-icon-users"></i>新用户注册</h3>
                          
                               <div class="form-tied margin-00">
                                <fieldset>
                                    <legend class="two"><span>用户信息</span></legend>
                                    <ul>                            
                                        <li>
                                           <asp:TextBox ID="regname" runat="server" class="input-block-level" placeholder="姓名"></asp:TextBox>                                
                                        </li>
                                        <li>
                                            <asp:TextBox ID="regemail" runat="server" class="input-block-level" placeholder="Email"></asp:TextBox>
                                        </li>
                                         <li>
                                            <asp:TextBox ID="regphone" runat="server" class="input-block-level" placeholder="电话"></asp:TextBox>
                                        </li>
                                          <li>
                                            <asp:TextBox ID="regstuid" runat="server" class="input-block-level" placeholder="学号"></asp:TextBox>
                                        </li>
                                    </ul>
                                </fieldset>
                                <fieldset>
                                    <legend class="two"><span>Password</span></legend>
                                    <ul>
                                      
                                        <li>
                                         <asp:TextBox ID="regpassword"  TextMode="Password" runat="server" class="input-block-level" placeholder="密码"></asp:TextBox>
                                           
                                        </li>
                                        <li>
                                             <asp:TextBox ID="regcheckpassword"  TextMode="Password" runat="server" class="input-block-level" placeholder="确认密码"></asp:TextBox>
                                        </li>


                                    </ul>
                                    <span> 
                                    <asp:Button ID="Button3" runat="server" Text="注册" class="btn btn-green btn-block btn-large"  Height="32px" OnClientClick="return checkreg()" onclick="Button3_Click1"/>
                                    
                                    </span>
                                    <hr class="margin-xm">
                                    <p>Have you remembered? <a href="#login" class="pull-right link" data-toggle="tab">Try to log in again.</a></p>
                                </fieldset>
                            </div>
                            <!-- // form --> 
                            
                        </div>
                        <!-- // Tab Forgot --> 
                        
                    </div>
                </div>
                <!-- // Well-Black --> 
                
                <a href="#register" class="btn btn-block btn-yellow btn-large f12" data-toggle="tab">没有账户？免费注册</a>
                <div class="web-description">
                    <h5>Copyright &copy; 2015 ynuxszj.com</h5>
                </div>
                
               
            </div>
            <!-- // sign-content -->
            
             </form>
            
        </div>
        <!-- // main-content --> 
        
    </div>
    <!-- // main-container  --> 
    
</div>
<!-- // page-container --> 

<!-- Le javascript --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="assets/js/lib/jquery.js"></script> 
<script src="assets/js/lib/jquery-ui.js"></script>
<%--<script src="assets/js/lib/jquery.cookie.js"></script> --%>
<script src="assets/js/lib/jquery.date.js"></script> 
<script src="assets/js/lib/jquery.mousewheel.js"></script> 
<%--<script src="assets/js/lib/jquery.load-image.min.js"></script>--%>
<script src="assets/js/lib/bootstrap/bootstrap.js"></script> 

<!-- Plugins Bootstrap -->
<%--<script src="assets/plugins/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.min.js"></script> 
<script src="assets/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>
<script src="assets/plugins/bootstrap-fuelux/all-fuelux.min.js"></script> 
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script> 
<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js"></script> 
<script src="assets/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script src="assets/plugins/bootstrap-daterangepicker/js/bootstrap-daterangepicker.js"></script> 
<script src="assets/plugins/bootstrap-toggle-button/js/bootstrap-toggle-button.js"></script> 
<script src="assets/plugins/bootstrap-fileupload/js/bootstrap-fileupload.js"></script> 
<script src="assets/plugins/bootstrap-rowlink/js/bootstrap-rowlink.js"></script> 
<script src="assets/plugins/bootstrap-progressbar/js/bootstrap-progressbar.js"></script> 
<script src="assets/plugins/bootstrap-select/bootstrap-select.js"></script> 
<script src="assets/plugins/bootstrap-multiselect/js/bootstrap-multiselect.js"></script> 
<script src="assets/plugins/bootstrap-bootbox/bootbox.min.js"></script> 
<script src="assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script> 
<script src="assets/plugins/bootstrap-modal/js/bootstrap-modal.js"></script> 
<script src="assets/plugins/bootstrap-wizard/js/bootstrap-wizard.min.js"></script>
<script src="assets/plugins/bootstrap-wizard-2/js/bwizard-only.min.js"></script>
<script src="assets/plugins/bootstrap-image-gallery/js/bootstrap-image-gallery.min.js"></script>--%>
 

<!-- Plugins Custom - Only example --> 
<%--<script src="assets/plugins/pl-extension/google-code-prettify/prettify.js"></script>--%>

<!-- Plugins Custom - System --> 
<%--<script src="assets/plugins/pl-system/nicescroll/jquery.nicescroll.min.js"></script> 
<script src="assets/plugins/pl-system/xbreadcrumbs/xbreadcrumbs.js"></script> --%>

<!-- Plugins Custom - System info -->
<%--<script src="assets/plugins/pl-system-info/qtip2/dist/jquery.qtip.min.js"></script> 
<script src="assets/plugins/pl-system-info/gritter/js/jquery.gritter.min.js"></script> 
<script src="assets/plugins/pl-system-info/notyfy/jquery.notyfy.js"></script>--%>

<!-- Plugins Custom - Content -->
<%--<script src="assets/plugins/pl-content/list/js/list.min.js"></script> 
<script src="assets/plugins/pl-content/list/plugins/list.paging.min.js"></script>
<script src="assets/plugins/pl-content/jpages/js/jPages.js"></script> --%>

<!-- Plugins Custom - Component -->
<%--<script src="assets/plugins/pl-component/fullcalendar/fullcalendar.min.js"></script> 
<script src="assets/plugins/pl-component/rangeslider/jqallrangesliders.min.js"></script>--%>

<!-- Plugins Custom - Form -->
<%--<script src="assets/plugins/pl-form/uniform/jquery.uniform.min.js"></script> 
<script src="assets/plugins/pl-form/select2/select2.min.js"></script>
<script src="assets/plugins/pl-form/counter/jquery.counter.js"></script> 
<script src="assets/plugins/pl-form/elastic/jquery.elastic.js"></script> 
<script src="assets/plugins/pl-form/inputmask/jquery.inputmask.js"></script> 
<script src="assets/plugins/pl-form/inputmask/jquery.inputmask.extensions.js"></script> 
<script src="assets/plugins/pl-form/validate/js/jquery.validate.min.js"></script> 
<script src="assets/plugins/pl-form/duallistbox/jquery.duallistbox.min.js"></script>--%>

<!-- Plugins Custom - Gallery --> 
<%--<script src="assets/plugins/pl-gallery/nailthumb/jquery.nailthumb.1.1.min.js"></script> 
<script src="assets/plugins/pl-gallery/nailthumb/showLoading/js/jquery.showLoading.min.js"></script>
<script src="assets/plugins/pl-gallery/wookmark/jquery.imagesloaded.js"></script>
<script src="assets/plugins/pl-gallery/wookmark/jquery.wookmark.min.js"></script>--%>
 
<!-- Plugins Tables --> 
<%--<script src="assets/plugins/pl-table/datatables/media/js/jquery.dataTables.js"></script> 
<script src="assets/plugins/pl-table/datatables/plugin/jquery.dataTables.plugins.js"></script> 
<script src="assets/plugins/pl-table/datatables/plugin/jquery.dataTables.columnFilter.js"></script> --%>

<!-- Plugins data visualization --> 
<%--<script src="assets/plugins/pl-visualization/sparkline/jquery.sparkline.min.js"></script> 
<script src="assets/plugins/pl-visualization/easy-pie-chart/jquery.easy-pie-chart.js"></script> 
<script src="assets/plugins/pl-visualization/percentageloader/percentageloader.min.js"></script>
<script src="assets/plugins/pl-visualization/knob/knob.js"></script> 
<script src="assets/plugins/pl-visualization/flot/jquery.flot.js"></script> 
<script src="assets/plugins/pl-visualization/flot/jquery.flot.categories.js"></script> 
<script src="assets/plugins/pl-visualization/flot/jquery.flot.grow.js"></script> 
<script src="assets/plugins/pl-visualization/flot/jquery.flot.orderBars.js"></script> 
<script src="assets/plugins/pl-visualization/flot/jquery.flot.pie.js"></script> 
<script src="assets/plugins/pl-visualization/flot/jquery.flot.resize.js"></script> 
<script src="assets/plugins/pl-visualization/flot/jquery.flot.selection.js"></script> 
<script src="assets/plugins/pl-visualization/flot/jquery.flot.stack.js"></script> 
<script src="assets/plugins/pl-visualization/flot/jquery.flot.stackpercent.js"></script> 
<script src="assets/plugins/pl-visualization/flot/jquery.flot.time.js"></script> --%>

<!-- main js --> 
<script src="assets/js/core.js"></script> 
<script src="assets/js/application.js"></script> 

<script>
    $(document).ready(function () {
    });

    
    function check() {
        if (username.value == "") {
            alert("用户名不能为空！");
            return false;
        }
        if (document.getElementById("pwd").value.length < 6) {
            alert("密码不能为空且长度大于6位！");
            return false;
        }
       
       
    }

    function checkreg() {
        if(regname.value==""){
            alert("用户名必填！");
            return false;
        }
        
        if (regpassword.value == "") {
            alert("密码不能为空");
            return false;
        }
        
        if (regstuid.value == "") {
            alert("学号不能为空");
            return false;

        }
        else if (isNaN(regstuid.value)) {//不是返回真 是返回假
            alert("学号类型不对");
            return false;
        }
        else if (regstuid.value > 20161000000 || regstuid.value < 10000000000) {
            alert("学号数据不合法！");
            return false;
        }
        
        

        if(regpassword.value!=regcheckpassword.value){
             alert("两次密码不一样！");
        return false;
        }
        if (document.getElementById("regcheckpassword").value.length<6) {
            alert("密码要求至少六位！");
            return false;
        }
   
   
   
    }
</script>
</body>
</html>
