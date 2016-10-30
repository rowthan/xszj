
                 <script>
                     $(document).ready(function () {
                         $(function (wizardFormBar) {
                             // navbar, numbering, progressbar, submit button well-nice �������������ȡ
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

                                     $wizard.find('.bar').css({//������
                                         width: $percent + '%'
                                     });

                                     $wizard.find('.number-page').text($current + ' of ' + $total);

                                     // If it's the last tab then hide the last button and show the finish instead ���ƴ�ӡ��button�Ƿ����
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
                             wizardFormBar('#DWZD .finish').click(function () {//�����Ŀ���
                                 alert('Finished!, Starting over!');
                                 $('#DWZD').find("a[href*='tab1fb']").trigger('click');
                             })

                             wizardFormBar('#wzNewAddressState2').select2();//δ��֪������
                         });
                     });
</script>