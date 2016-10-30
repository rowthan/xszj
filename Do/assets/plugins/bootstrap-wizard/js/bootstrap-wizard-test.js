
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